package br.com.nemeia.brigia.service;

import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.Map;

@Service
public class EmailService {

  private final MailgunClient mailgunClient;
  private final TemplateLoader templateLoader;

  public EmailService(MailgunClient mailgunClient, TemplateLoader templateLoader) {
    this.mailgunClient = mailgunClient;
    this.templateLoader = templateLoader;
  }

  public void sendEmail(String to, String subject, String templateName, Map<String, Object> variables) throws UnsupportedEncodingException {
    String htmlContent = templateLoader.renderTemplate(templateName, variables);

    mailgunClient.sendMessage(to, subject, htmlContent);
  }
}
