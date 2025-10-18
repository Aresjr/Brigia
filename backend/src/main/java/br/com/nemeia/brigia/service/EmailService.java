package br.com.nemeia.brigia.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@Service
@Profile("!test")
public class EmailService {

    private final MailgunClient mailgunClient;
    private final TemplateLoader templateLoader;

    @Value("${brigida.email.suporte}")
    private String emailSuporte; // TODO - pegar do cadastro da Unidade

    public EmailService(MailgunClient mailgunClient, TemplateLoader templateLoader) {
        this.mailgunClient = mailgunClient;
        this.templateLoader = templateLoader;
    }

    @Async
    public void sendEmail(String to, String subject, String templateName, Map<String, Object> variables)
            throws UnsupportedEncodingException {
        Map<String, Object> variaveis = new HashMap<>(variables);
        variaveis.putIfAbsent("emailSuporte", emailSuporte);
        String htmlContent = templateLoader.renderTemplate(templateName, variaveis);
        mailgunClient.sendMessage(to, subject, htmlContent);
    }
}
