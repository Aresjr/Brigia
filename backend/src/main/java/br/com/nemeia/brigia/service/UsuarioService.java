package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.UsuarioMapper;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.model.Usuario;
import br.com.nemeia.brigia.repository.UnidadeRepository;
import br.com.nemeia.brigia.repository.UsuarioRepository;

import java.util.Optional;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UsuarioService extends BaseService<Usuario, UsuarioRepository> {

    private final UsuarioRepository repository;
    private final UsuarioMapper mapper;
    private final UnidadeRepository unidadeRepository;
    private final PasswordEncoder passwordEncoder;

    public UsuarioService(UsuarioRepository repository, UsuarioMapper mapper, UnidadeRepository unidadeRepository,
            PasswordEncoder passwordEncoder) {
        super(repository);
        this.repository = repository;
        this.mapper = mapper;
        this.unidadeRepository = unidadeRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public Optional<Usuario> getByEmail(String email) {
        return repository.findByEmail(email);
    }

    public Usuario create(UsuarioRequest request) {
        Unidade unidade = unidadeRepository.findById(request.unidadeId())
                .orElseThrow(() -> new NotFoundException("Unidade não encontrada com o ID: " + request.unidadeId()));

        Usuario usuario = mapper.toEntity(request);

        usuario.setUnidade(unidade);
        return repository.save(usuario);
    }

    @Override
    String getNomeEntidade() {
        return "Usuário";
    }
}
