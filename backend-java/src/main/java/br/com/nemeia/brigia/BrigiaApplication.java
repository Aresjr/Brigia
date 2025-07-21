package br.com.nemeia.brigia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class BrigiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(BrigiaApplication.class, args);
	}

}
