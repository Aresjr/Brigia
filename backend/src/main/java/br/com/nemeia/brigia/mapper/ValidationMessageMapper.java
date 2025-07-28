package br.com.nemeia.brigia.mapper;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.MethodArgumentNotValidException;

import java.util.ArrayList;
import java.util.List;

@Component
public class ValidationMessageMapper {

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

    public List<String> extractMsg(MethodArgumentNotValidException ex) {
        List<String> errors = new ArrayList<>();
        ex.getBindingResult()
                .getFieldErrors()
                .forEach(error -> errors.add(error.getDefaultMessage()));
        return errors;
    }

}
