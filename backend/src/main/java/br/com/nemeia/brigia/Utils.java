package br.com.nemeia.brigia;

import org.springframework.data.domain.Sort;

public abstract class Utils {

    public static Sort DEFAULT_SORT =
            Sort.by(Sort.Direction.ASC, "excluido").and(Sort.by(Sort.Direction.DESC, "id"));
}
