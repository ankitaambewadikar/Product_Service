package com.cg.eShoppingZone.productservice.repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.cg.eShoppingZone.productservice.entity.Product;

@Repository
public interface ProductRepository extends MongoRepository<Product, Integer> {

	Optional<Product> findByProductName(String productName);

}
