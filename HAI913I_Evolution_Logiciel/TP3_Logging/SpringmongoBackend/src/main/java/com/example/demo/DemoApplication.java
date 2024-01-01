package com.example.demo;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}


	@Override
	public void run(String... args) throws Exception {
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

}
