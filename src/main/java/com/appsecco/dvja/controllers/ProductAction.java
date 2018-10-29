package com.appsecco.dvja.controllers;

import com.appsecco.dvja.models.Product;
import com.appsecco.dvja.services.ProductService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.ReflectionToStringBuilder;

import java.util.Date;
import java.util.List;

public class ProductAction extends BaseController {
    private String productId;
    private String searchQuery;
    private Product product;
    private List<Product> products;
    private ProductService productService;

    public String getSearchQuery() {
        return searchQuery;
    }

    public void setSearchQuery(String searchQuery) {
        this.searchQuery = searchQuery;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public boolean isSearchQueryAvailable() {
        return (!StringUtils.isEmpty(searchQuery));
    }

    public String list() {
        if(StringUtils.isEmpty(searchQuery))
            products = productService.findAll();
        else
            products = productService.findContainingName(searchQuery);

        return SUCCESS;
    }

    public String execute() {
        if(!StringUtils.isEmpty(getProductId()) && (product == null)) {
            product = productService.find(Integer.parseInt(getProductId()));
            return INPUT;
        }

        if(getProduct() == null)
            return INPUT;

        try {
            /*return renderText("Updating id: " + product.getId() +
                    " Product: " + ReflectionToStringBuilder.toString(product));*/
            //product.setCreatedAt(new Date());
            //product.setUpdatedAt(new Date());

            productService.save(product);
            return SUCCESS;
        }
        catch(Exception e) {
            addActionError("Error Occurred: " + e.getMessage());
            return INPUT;
        }
    }
}
