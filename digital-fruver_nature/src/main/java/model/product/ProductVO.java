package model.product;

import java.io.InputStream;

public class ProductVO {
    private String idProduct, availabilityProduct, priceProduct, statusProduct;
    private String nameProduct, descriptionProduct;
    private InputStream imageProduct;

    public ProductVO(){}
    public ProductVO(String idProduct, String availabilityProduct, String priceProduct, String statusProduct,
                    String nameProduct, String descriptionProduct, InputStream imageProduct){
       
        this.idProduct = idProduct;
        this.availabilityProduct = availabilityProduct;
        this.priceProduct = priceProduct;

        this.nameProduct = nameProduct;
        this.descriptionProduct = descriptionProduct;

        this.imageProduct = imageProduct;
    }

    public String getIdProduct() { return idProduct; }
    public void setIdProduct(String idProduct) { this.idProduct = idProduct; }

    public String getAvailabilityProduct() { return availabilityProduct; }
    public void setAvailabilityProduct(String availabilityProduct) { this.availabilityProduct = availabilityProduct; }

    public String getPriceProduct() { return priceProduct; }
    public void setPriceProduct(String priceProduct) { this.priceProduct = priceProduct; }

    public String getStatusProduct() { return statusProduct; }
    public void setStatusProduct(String statusProduct) { this.statusProduct = statusProduct; }

    public String getNameProduct() { return nameProduct; }
    public void setNameProduct(String nameProduct) { this.nameProduct = nameProduct; }

    public String getDescriptionProduct() { return descriptionProduct; }
    public void setDescriptionProduct(String descriptionProduct) { this.descriptionProduct = descriptionProduct; }

    public InputStream getImageProduct() { return imageProduct; }
    public void setImageProduct(InputStream imageProduct) { this.imageProduct = imageProduct; }  
}
