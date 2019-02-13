package com.cg.eShoppingZone.websiteEshoppingZone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.cg.eShoppingZone.websiteEshoppingZone.pojo.Product;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

@EnableCircuitBreaker
@Controller
public class WebsiteEshoppingController {

	@Autowired
	RestTemplate restTemplate;

	Product product;

	@RequestMapping("/home")
	public String homepage() {
		return "HomePage";
	}
	// @RequestMapping("/products")
	// public
	/*
	 * @RequestMapping(value = "/products", method = RequestMethod.GET) public
	 * String getProducts() { return "AllProducts"; }
	 */

	@HystrixCommand(fallbackMethod = "noServiceOne")
	@RequestMapping("/products")
	public ModelAndView getAllProducts() {
		List<Product> productList = restTemplate.getForObject("http://localhost:8989/products", List.class);

		return new ModelAndView("AllProducts", "productList", productList);

	}

	public ModelAndView noServiceOne() {
		String message = "Service Not Available";

		return new ModelAndView("NoService", "message", message);

	}

	public String noServiceTwo(Model model) {
		String message = "Service Not Available";
		model.addAttribute("message", message);
		return "NoService";
	}

	@RequestMapping("/productById")
	public String getProductByIdForm() {
		return "ProductById";
	}

	/* @HystrixCommand(fallbackMethod = "noServiceTwo") */
	@RequestMapping("/productBy")
	public String getProductById(@RequestParam("productId") int productId, Model model) {

		Product product = restTemplate.getForObject("http://localhost:8989/products/" + productId, Product.class);

		model.addAttribute(product);
		return "AllProducts";

	}

	@RequestMapping("/productByName")
	public String getProductByNameForm() {
		return "ProductByName";
	}

	/* @HystrixCommand(fallbackMethod = "noServiceTwo") */
	@RequestMapping("/productsByName")
	public String getProductByName(@RequestParam("productName") String productName, Model model) {

		Product product = restTemplate.getForObject("http://localhost:8989/products/productName/" + productName,
				Product.class);

		model.addAttribute(product);
		return "AllProducts";

	}

	@RequestMapping("/productByCategory")
	public String getProductByCategoryForm() {
		return "ProductByCategory";
	}

	/* @HystrixCommand(fallbackMethod = "noServiceOne") */
	@RequestMapping("/productsByCategory")
	public ModelAndView getCategory(@RequestParam("category") String category, Model model) {

		List product = restTemplate.getForObject("http://localhost:8989/products/category/" + category, List.class,
				category);
		return new ModelAndView("AllProducts", "productList", product);

	}

	@RequestMapping("/productByType")
	public String getProductByTypeForm() {
		return "ProductByType";

	}

	/* @HystrixCommand(fallbackMethod = "noServiceOne") */
	@RequestMapping("/productsType")
	public ModelAndView getProductType(@RequestParam("productType") String productType) {

		List product = restTemplate.getForObject("http://localhost:8989/products/type/" + productType, List.class);
		return new ModelAndView("AllProducts", "productList", product);

	}

	@RequestMapping("/updateProduct")
	public String updateProductForm() {
		return "UpdateForm";
	}

	@RequestMapping("/update")
	public String updatedProductDetails(@RequestParam("productId") int productId, Model model) {
		Product product = restTemplate.getForObject("http://localhost:8989/products/{productId}", Product.class,
				productId);

		model.addAttribute(product);
		return "UpdateDetails";

	}

	@RequestMapping("/updatedb")
	public String update(@RequestParam("price") Double price) {
		System.out.println(price);
		restTemplate.put("http://localhost:8989/products", price);
		System.out.println("After" + price);
		return "AllProducts";

	}

	@RequestMapping("/deleteProduct")
	public String deleteProductForm() {
		return "DeleteForm";
	}

	@RequestMapping("/deleteProductById")
	public String deleteProduct(@RequestParam("productId") int productId, Model model) {
		restTemplate.delete("http://localhost:8989/products/" + productId);
		model.addAttribute("message", "Deleted Successfully");
		return "DeleteForm";

	}
}
