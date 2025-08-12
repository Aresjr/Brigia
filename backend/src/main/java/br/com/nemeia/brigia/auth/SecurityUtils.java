package br.com.nemeia.brigia.auth;

import java.util.Optional;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class SecurityUtils {

  public Long getLoggedUser() {
    return Optional.ofNullable(SecurityContextHolder.getContext().getAuthentication())
        .map(auth -> Long.valueOf(auth.getName()))
        .orElse(null);
  }
}
