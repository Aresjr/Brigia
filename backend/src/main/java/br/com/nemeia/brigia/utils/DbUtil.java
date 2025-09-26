package br.com.nemeia.brigia.utils;

import org.springframework.data.domain.Sort;

public abstract class DbUtil {

    public static Sort DEFAULT_SORT = Sort.by(Sort.Direction.ASC, "excluido").and(Sort.by(Sort.Direction.DESC, "id"));
}
