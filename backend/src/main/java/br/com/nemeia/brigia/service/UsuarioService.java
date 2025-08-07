package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.UsuarioMapper;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.model.Usuario;
import br.com.nemeia.brigia.repository.UnidadeRepository;
import br.com.nemeia.brigia.repository.UsuarioRepository;

import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UsuarioService {

  private final UsuarioRepository repository;

  private final UsuarioMapper mapper;

  private final UnidadeRepository unidadeRepository;

  private final PasswordEncoder passwordEncoder;

  public Optional<Usuario> getByEmail(String email) {
    return repository.findByEmail(email);
  }

  public List<Usuario> getAll() {
    return repository.findAll();
  }

  public Usuario findById(Long id) {
    return repository
        .findById(id)
        .orElseThrow(() -> new NotFoundException("Usuário não encontrado com o ID: " + id));
  }

  public Usuario create(UsuarioRequest request) {

    Unidade unidade =
        unidadeRepository
            .findById(request.unidadeId())
            .orElseThrow(() -> new NotFoundException("Unidade não encontrada com o ID: " + request.unidadeId()));

    log.info("Criando usuário: {}", request.email());
    Usuario usuario = mapper.toEntity(request);

    String encryptedPassword = passwordEncoder.encode(request.senha());
    usuario.setSenha(encryptedPassword);

    usuario.setUnidade(unidade);
    return usuario;
  }
}
