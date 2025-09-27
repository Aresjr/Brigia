package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Usuario;
import java.util.Optional;

public interface UsuarioRepository extends BaseRepository<Usuario> {
    Optional<Usuario> findByEmail(String email);
}
