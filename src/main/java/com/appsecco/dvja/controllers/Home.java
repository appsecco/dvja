package com.appsecco.dvja.controllers;

import com.appsecco.dvja.models.Product;
import com.appsecco.dvja.services.ProductService;

import java.util.List;

public class Home extends BaseController {

    private ProductService productService;
    private List<Product> products;

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public String assessment() {
        products = productService.findAll();
        return SUCCESS;
    }

    public String execute() {
        return SUCCESS;
    }
}
