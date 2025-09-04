package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.dto.request.ProfissionalRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ProfissionalMapper;
import br.com.nemeia.brigia.model.Especialidade;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.repository.ProfissionalRepository;
import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProfissionalService {

    private final ProfissionalRepository repository;
    private final ProfissionalMapper mapper;
    private final EspecialidadeService especialidadeService;

    public Page<Profissional> getPaged(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Utils.DEFAULT_SORT);
        return repository.findAll(pageable);
    }

    public List<Profissional> getAniversariantes() {
        return repository.findAllByDataNascimentoIs(LocalDate.now());
    }

    public Profissional getById(Long id) {
        return repository
                .findById(id)
                .orElseThrow(
                        () -> new NotFoundException("Profissional não encontrado com ID: " + id));
    }

    public Profissional getByUsuarioId(Long usuarioId) {
        return repository
                .findOneByUsuarioIdIs(usuarioId)
                .orElseThrow(
                        () ->
                                new NotFoundException(
                                        "Profissional não encontrado com o usuário ID: "
                                                + usuarioId));
    }

    public Profissional createProfissional(ProfissionalRequest request) {
        Profissional profissional = mapper.toEntity(request);

        if (!request.especialidades().isEmpty()) {
            List<Especialidade> especialidades =
                    request.especialidades().stream().map(especialidadeService::getById).toList();
            profissional.setEspecialidades(especialidades);
        }

        return saveProfissional(profissional);
    }

    private Profissional saveProfissional(Profissional profissional) {
        return repository.save(profissional);
    }

    public Profissional editProfissional(Long id, ProfissionalRequest request) {
        getById(id);
        Profissional profissional = mapper.toEntity(request);

        if (!request.especialidades().isEmpty()) {
            List<Especialidade> especialidades =
                    request.especialidades().stream().map(especialidadeService::getById).toList();
            profissional.setEspecialidades(especialidades);
        }

        profissional.setId(id);
        return saveProfissional(profissional);
    }
}
