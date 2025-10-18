package br.com.nemeia.brigia.auth;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityHolder {

    public static Long getLoggedUserId() {
        return Optional.ofNullable(SecurityContextHolder.getContext().getAuthentication())
                .map(auth -> Long.valueOf(auth.getName())).orElse(null);
    }

    public static Long getLoggedUserUnidadeId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication.getPrincipal() == null) {
            return null;
        }
        UserAuth userAuth = (UserAuth) authentication.getPrincipal();
        return userAuth.getUnidadeId();
    }

    public static List<String> getLoggedUserRoles() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAuth userAuth = (UserAuth) authentication.getPrincipal();
        return userAuth.getRoles();
    }

    // Métodos auxiliares para testes
    public static void setLoggedUserUnidadeId(Long unidadeId) {
        UserAuth userAuth = new UserAuth(1L, unidadeId, Collections.singletonList("ADMIN"));
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userAuth, null,
                Collections.singletonList(new SimpleGrantedAuthority("ADMIN")));
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    public static void setLoggedUserId(Long userId) {
        Authentication currentAuth = SecurityContextHolder.getContext().getAuthentication();
        Long unidadeId = null;
        List<String> roles = Collections.singletonList("ADMIN");

        if (currentAuth != null && currentAuth.getPrincipal() instanceof UserAuth) {
            UserAuth currentUserAuth = (UserAuth) currentAuth.getPrincipal();
            unidadeId = currentUserAuth.getUnidadeId();
            roles = currentUserAuth.getRoles();
        }

        UserAuth userAuth = new UserAuth(userId, unidadeId, roles);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userAuth, null,
                roles.stream().map(SimpleGrantedAuthority::new).toList());
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    public static void clear() {
        SecurityContextHolder.clearContext();
    }
}
