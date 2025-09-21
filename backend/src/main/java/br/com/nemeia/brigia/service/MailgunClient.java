package br.com.nemeia.brigia.service;

import jakarta.mail.internet.InternetAddress;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Service
public class MailgunClient {

    @Value("${spring.application.name}")
    private String clientName;

    @Value("${mailgun.api.key}")
    private String apiKey;

    @Value("${mailgun.domain}")
    private String domain;

    @Value("${mailgun.from-name}")
    private String fromName;

    @Value("${mailgun.from-email}")
    private String fromEmail;

    public void sendMessage(String to, String subject, String htmlContent) throws UnsupportedEncodingException {
        var from = new InternetAddress(fromEmail, clientName, "UTF-8");
        to = "aresnemeia@gmail.com"; // TODO - remover
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.mailgun.net/v3/" + domain + "/messages"))
                .header("Authorization", "Basic " + Base64.getEncoder().encodeToString(("api:" + apiKey).getBytes()))
                .POST(HttpRequest.BodyPublishers
                        .ofString("from=" + from + "&to=" + URLEncoder.encode(to, StandardCharsets.UTF_8) + "&subject="
                                + URLEncoder.encode(subject, StandardCharsets.UTF_8) + "&html="
                                + URLEncoder.encode(htmlContent, StandardCharsets.UTF_8)))
                .header("Content-Type", "application/x-www-form-urlencoded").build();

        try (HttpClient httpClient = HttpClient.newHttpClient()) {
            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() >= 400) {
                throw new RuntimeException("Erro ao enviar email: " + response.body());
            }
        } catch (Exception e) {
            throw new RuntimeException("Falha no envio de email", e);
        }
    }
}
