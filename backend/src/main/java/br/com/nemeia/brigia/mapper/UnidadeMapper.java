package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.UnidadeResponse;
import br.com.nemeia.brigia.model.Unidade;
import org.springframework.stereotype.Component;

@Component
public class UnidadeMapper {

  public UnidadeResponse toResponse(Unidade unidade) {
    if (unidade == null) {
      return null;
    }

    return new UnidadeResponse(
        unidade.getId(),
        unidade.getNome());
  }
}
