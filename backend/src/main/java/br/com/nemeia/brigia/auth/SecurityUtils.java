package br.com.nemeia.brigia.auth;

import java.util.List;
import java.util.Optional;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class SecurityUtils {

    public Long getLoggedUserId() {
        return Optional.ofNullable(SecurityContextHolder.getContext().getAuthentication())
                .map(auth -> Long.valueOf(auth.getName())).orElse(null);
    }

    public Long getLoggedUserUnidadeId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAuth userAuth = (UserAuth) authentication.getPrincipal();
        return userAuth.getUnidadeId();
    }

    public List<String> getLoggedUserRoles() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAuth userAuth = (UserAuth) authentication.getPrincipal();
        return userAuth.getRoles();
    }
}
