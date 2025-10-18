package br.com.nemeia.config;

import br.com.nemeia.brigia.service.EmailService;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

import java.util.Map;

@TestConfiguration
public class TestConfig {
  @Bean
  @Primary
  public EmailService mockEmailService() {
    return new EmailService(null, null) {
      @Override
      public void sendEmail(String to, String subject, String templateName, Map<String, Object> variables) {
        System.out.println("Mock Email enviado para " + to);
      }
    };
  }
}