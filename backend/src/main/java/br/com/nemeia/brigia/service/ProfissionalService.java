package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.utils.DbUtil;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.ProfissionalRequest;
import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ProfissionalMapper;
import br.com.nemeia.brigia.model.Especialidade;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.model.RoleUsuario;
import br.com.nemeia.brigia.model.Usuario;
import br.com.nemeia.brigia.repository.ProfissionalRepository;
import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProfissionalService {

    private final ProfissionalRepository repository;
    private final ProfissionalMapper mapper;
    private final EspecialidadeService especialidadeService;
    private final UsuarioService usuarioService;
    private final UnidadeService unidadeService;

    public Page<Profissional> getPaged(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, DbUtil.DEFAULT_SORT);
        return repository.findAll(pageable);
    }

    public List<Profissional> getAniversariantes() {
        return repository.findAllByDataNascimentoIs(LocalDate.now());
    }

    public Profissional getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Profissional não encontrado com ID: " + id));
    }

    public Profissional getByUsuarioId(Long usuarioId) {
        return repository.findOneByUsuarioIdIs(usuarioId)
                .orElseThrow(() -> new NotFoundException("Profissional não encontrado com o usuário ID: " + usuarioId));
    }

    @Transactional
    public Profissional createProfissional(ProfissionalRequest request) throws BadRequestException {
        Profissional profissional = mapper.toEntity(request);

        if (!request.especialidades().isEmpty()) {
            List<Especialidade> especialidades = request.especialidades().stream().map(especialidadeService::getById)
                    .toList();
            profissional.setEspecialidades(especialidades);
        }

        profissional.setUnidade(unidadeService.getById(SecurityHolder.getLoggedUserUnidadeId()));

        // Criar usuário automaticamente para o profissional
        if (profissional.getEmail() != null && !profissional.getEmail().isEmpty()) {
            // Verificar se já existe usuário com o email
            var usuarioExistente = usuarioService.getByEmail(profissional.getEmail());
            if (usuarioExistente.isPresent()) {
                throw new BadRequestException(
                        "Já existe um usuário no sistema cadastrado com o email: " + profissional.getEmail());
            }
            criarUsuarioParaProfissional(profissional);
        }

        return repository.save(profissional);
    }

    //TODO - migrar para MapStruct
    public Profissional editProfissional(Long id, ProfissionalRequest request) {
        Profissional profissional = getById(id);
        Profissional profissionalEdicao = mapper.toEntity(request);

        if (!request.especialidades().isEmpty()) {
            List<Especialidade> especialidades = request.especialidades().stream().map(especialidadeService::getById)
                    .toList();
            profissionalEdicao.setEspecialidades(especialidades);
        }

        profissionalEdicao.setId(id);
        profissionalEdicao.setUnidade(profissional.getUnidade());
        profissionalEdicao.setUsuario(profissional.getUsuario());
        return repository.save(profissionalEdicao);
    }

    public void reenviarConvite(Long id) throws BadRequestException {
        Profissional profissional = getById(id);
        
        if (profissional.getUsuario() == null) {
            // Criar usuário se não existir
            if (profissional.getEmail() == null || profissional.getEmail().isEmpty()) {
                throw new BadRequestException("Profissional não possui email cadastrado para criar usuário");
            }
            
            var usuarioExistente = usuarioService.getByEmail(profissional.getEmail());
            if (usuarioExistente.isEmpty()) {
                //TODO
            } else {
                profissional.setUsuario(usuarioExistente.get());
                repository.save(profissional);
                usuarioService.reenviarConvite(usuarioExistente.get().getId());
                log.info("Usuário vinculado e convite reenviado para o profissional: {}", profissional.getNome());
                return;
            }
        } else {
            usuarioService.reenviarConvite(profissional.getUsuario().getId());
        }
        
        log.info("Convite reenviado para o profissional: {}", profissional.getNome());
    }

    private void criarUsuarioParaProfissional(Profissional profissional) {
        UsuarioRequest usuarioRequest = new UsuarioRequest(profissional.getEmail(), profissional.getNome(),
                null, RoleUsuario.MEDICO, SecurityHolder.getLoggedUserUnidadeId());
        Usuario usuario = usuarioService.create(usuarioRequest);
        profissional.setUsuario(usuario);
        log.info("Usuário criado automaticamente para o profissional: {}", profissional.getNome());
    }

    public void deleteProfissional(Long id) {
        Profissional profissional = getById(id);
        profissional.setExcluido(true);
        repository.save(profissional);
        log.info("Profissional deletado com ID: {}", id);
    }

    public Profissional restaurarProfissional(Long id) {
        Profissional profissional = getById(id);
        profissional.setExcluido(false);
        return repository.save(profissional);
    }
}
