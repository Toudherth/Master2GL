package com.example.demo;

import com.example.demo.service.AnalyseLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class DemoApplication implements CommandLineRunner {

	@Autowired
	private AnalyseLogService analyseLogService;


	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);

	}


	@Bean
	public ApplicationRunner applicationRunner() {
		return args -> {
			//analyseLogService.parseAllLogs(); // Assurez-vous que cette méthode existe
			//analyseLogService.saveUserActionsToDatabase();
		};
	}


	//@Override
	public void run2(String... args) throws Exception {
		if (args.length > 0) {
			switch (args[0]) {
				case "get":
					getMethod();
					break;
				case "add":
					addMethod(args);
					break;
				default:
					System.out.println("Commande non reconnue.");
			}
		} else {
			System.out.println("Aucun argument fourni.");
		}
	}


	private void getMethod() {
		// Logique pour la commande "get"
		System.out.println("Exécution de la méthode GET.");
	}

	private void addMethod(String[] args) {
		// Logique pour la commande "add"
		// Utilisez args pour obtenir des informations supplémentaires si nécessaire
		System.out.println("Exécution de la méthode ADD.");
	}

	@Override
	public void run(String... args) throws Exception {

	}
}
