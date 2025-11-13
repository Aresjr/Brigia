package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Usuario;
import java.util.List;
import java.util.Optional;

public interface UsuarioRepository extends BaseRepository<Usuario> {
    Optional<Usuario> findByEmail(String email);
    Optional<Usuario> findByTokenPublico(String token);
    List<Usuario> findAllByUnidadeId(Long unidadeId);
}
