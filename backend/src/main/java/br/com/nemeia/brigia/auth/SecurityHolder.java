package br.com.nemeia.brigia.auth;

import java.util.List;
import java.util.Optional;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityHolder {

    public static Long getLoggedUserId() {
        return Optional.ofNullable(SecurityContextHolder.getContext().getAuthentication())
                .map(auth -> Long.valueOf(auth.getName())).orElse(null);
    }

    public static Long getLoggedUserUnidadeId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAuth userAuth = (UserAuth) authentication.getPrincipal();
        return userAuth.getUnidadeId();
    }

    public static List<String> getLoggedUserRoles() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAuth userAuth = (UserAuth) authentication.getPrincipal();
        return userAuth.getRoles();
    }
}
