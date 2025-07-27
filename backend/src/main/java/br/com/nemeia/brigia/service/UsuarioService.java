package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.UsuarioResponse;
import br.com.nemeia.brigia.exception.UsuarioNotFoundException;
import br.com.nemeia.brigia.mapper.UsuarioMapper;
import br.com.nemeia.brigia.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UsuarioService {

    private final UsuarioRepository repository;

    private final UsuarioMapper mapper;

    public UsuarioResponse getByEmail(String email) {
        return repository.findByEmail(email)
                .map(mapper::toResponse)
                .orElseThrow(() -> new UsuarioNotFoundException("Usuário não encontrado com o email: " + email));
    }
}
