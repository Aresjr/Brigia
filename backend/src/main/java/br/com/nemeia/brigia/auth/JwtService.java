package br.com.nemeia.brigia.auth;

import br.com.nemeia.brigia.model.Usuario;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import java.util.Date;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class JwtService {

  @Value("${jwt.secret}")
  private String secretKey;

  private final long EXPIRATION = 1000 * 60 * 30;

  public String generateToken(Usuario usuario) {
    return Jwts.builder()
        .setSubject(usuario.getEmail())
        .claim("id", usuario.getId())
        .claim("roles", usuario.getRoles())
        .setIssuedAt(new Date())
        .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION))
        .signWith(Keys.hmacShaKeyFor(secretKey.getBytes()), SignatureAlgorithm.HS256)
        .compact();
  }

  public Claims extractClaims(String token) {
    return Jwts.parserBuilder()
        .setSigningKey(Keys.hmacShaKeyFor(secretKey.getBytes()))
        .build()
        .parseClaimsJws(token)
        .getBody();
  }

  public boolean isTokenValid(String token) {
    try {
      Claims claims = extractClaims(token);
      return !claims.getExpiration().before(new Date());
    } catch (JwtException e) {
      return false;
    }
  }
}
