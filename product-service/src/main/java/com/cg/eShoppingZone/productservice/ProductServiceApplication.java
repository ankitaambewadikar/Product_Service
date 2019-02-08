package com.cg.eShoppingZone.productservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication

public class ProductServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProductServiceApplication.class, args);
	}

	/*@Bean
	public CommandLineRunner addData(ProductRepository productRepository) {
		return (arg) -> {
			productRepository.save(new Product(100,"handbag","bags and Luggage",null,null,null,1400.00,"good product",null));
			
		};

	}*/

}
