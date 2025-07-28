package br.com.nemeia.brigia.mapper;

import java.util.ArrayList;
import java.util.List;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.MethodArgumentNotValidException;

@Component
public class ValidationMessageMapper {

  public List<String> extractMsg(MethodArgumentNotValidException ex) {
    List<String> errors = new ArrayList<>();
    ex.getBindingResult().getFieldErrors().forEach(error -> errors.add(error.getDefaultMessage()));
    return errors;
  }

  public String extractMsg(DataIntegrityViolationException ex) {
    String msg = ex.getMessage();
    if (msg != null && msg.contains("duplicate key")) {
      String msgCompleta = msg.split("Key")[1];
      String campoDuplicado = msgCompleta.split(" already exists")[0].trim();

      String sqlCommando = msg.split("insert into ")[1];
      String tableName = sqlCommando.split(" ")[0];

      return "Já existe um cadastro de " + tableName + " com o campo " + campoDuplicado;
    }
    return "Erro ao salvar no banco de dados.";
  }

  public String extractMsg(HttpMessageNotReadableException ex) {
    String msg = ex.getMessage();
    if (msg != null) {
      if (msg.contains("Cannot deserialize value of type")) {
        String campo = null;
        String valores = null;
        try {
          String[] partes = msg.split("Cannot deserialize value of type ");
          if (partes.length > 1) {
            String tipo = partes[1].split(" from")[0].replace("`", "").trim();
            campo = tipo.substring(tipo.lastIndexOf(".") + 1);
          }
          if (msg.contains("not one of the values accepted for Enum class")) {
            valores = msg.split("Enum class: ")[1].replace("[", "").replace("]", "");
          }
        } catch (Exception ignore) {
        }
        if (campo != null && valores != null) {
          return "Valor inválido para o campo '"
              + campo
              + "'. Os valores aceitos são: "
              + valores
              + ".";
        }
        return "Valor inválido enviado para um campo do tipo Enum.";
      }
      if (msg.contains("Required request body is missing")) {
        return "O corpo da requisição não foi enviado.";
      }
      if (msg.contains("JSON parse error")) {
        return "Erro ao interpretar o corpo da requisição. Verifique se o JSON está correto.";
      }
    }
    return "Erro ao processar a requisição. Verifique os dados enviados.";
  }
}
