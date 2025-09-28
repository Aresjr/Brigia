package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.UsuarioMapper;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.model.Usuario;
import br.com.nemeia.brigia.repository.UnidadeRepository;
import br.com.nemeia.brigia.repository.UsuarioRepository;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UsuarioService extends BaseService<Usuario, UsuarioRepository> {

    private final UsuarioRepository repository;
    private final UsuarioMapper mapper;
    private final UnidadeRepository unidadeRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    @Value("${app.base-url}")
    private String baseUrl;

    public UsuarioService(UsuarioRepository repository, UsuarioMapper mapper, UnidadeRepository unidadeRepository,
            PasswordEncoder passwordEncoder, EmailService emailService) {
        super(repository);
        this.repository = repository;
        this.mapper = mapper;
        this.unidadeRepository = unidadeRepository;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
    }

    public Optional<Usuario> getByEmail(String email) {
        return repository.findByEmail(email);
    }

    public Usuario create(UsuarioRequest request) {
        Unidade unidade = unidadeRepository.findById(request.unidadeId())
                .orElseThrow(() -> new NotFoundException("Unidade não encontrada com o ID: " + request.unidadeId()));

        Usuario usuario = mapper.toEntity(request);
        usuario.setUnidade(unidade);
        usuario = repository.save(usuario);
        enviarEmail(usuario);

        return usuario;
    }

    private void enviarEmail(Usuario usuario) {
        try {
          Map<String, Object> variables = new HashMap<>();
          variables.put("nome", usuario.getNome());
          var linkCadastroSenha = String.format("%s/cadastrar-senha?token=%s", baseUrl, usuario.getTokenPublico());
          variables.put("linkCadastroSenha", linkCadastroSenha);

          emailService.sendEmail(
            usuario.getEmail(),
            "Bem-vindo ao sistema - Cadastre sua senha",
            "usuario-cadastrado",
            variables
          );
        } catch (Exception e) {
          log.error("Erro ao enviar e-mail de cadastro para o usuário: " + usuario.getEmail(), e);
        }
    }

    public Usuario edit(Long id, UsuarioRequest request) {
      getById(id);
      Usuario usuario = mapper.toEntity(request);

      Unidade unidade = unidadeRepository.findById(request.unidadeId())
        .orElseThrow(() -> new NotFoundException("Unidade não encontrada com o ID: " + request.unidadeId()));

      usuario.setUnidade(unidade);
      usuario.setId(id);
      return repository.save(usuario);
    }

    @Override
    String getNomeEntidade() {
        return "Usuário";
    }
}
