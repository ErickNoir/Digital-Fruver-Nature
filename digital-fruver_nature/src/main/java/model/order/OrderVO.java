package model.order;

public class OrderVO {
    private String orderDate, orderDeliveryDate;
    private String idOrder, fkIdUser, fkIdproduct, quantityOrder, totalOrder, trueFalseDelivery, detailsOrder;
    
    public OrderVO(){}
    public OrderVO(String orderDate, String orderDeliveryDate, String idOrder, String fkIdUser, String fkIdproduct, String quantityOrder, String totalOrder, String trueFalseDelivery, String detailsOrder){
        this.idOrder = idOrder;
        this.fkIdUser = fkIdUser;
        this.fkIdproduct = fkIdproduct;
        this.orderDate = orderDate;
        this.orderDeliveryDate = orderDeliveryDate;
        this.quantityOrder = quantityOrder;
        this.totalOrder = totalOrder;
        this.trueFalseDelivery = trueFalseDelivery;
        this.detailsOrder = detailsOrder;
    }

    
    public String getOrderDate() { return orderDate; }
    public void setOrderDate(String orderDate) { this.orderDate = orderDate; }
    
    public String getOrderDeliveryDate() { return orderDeliveryDate; }
    public void setOrderDeliveryDate(String orderDeliveryDate) { this.orderDeliveryDate = orderDeliveryDate; }
    
    public String getIdOrder() { return idOrder; }
    public void setIdOrder(String idOrder) { this.idOrder = idOrder; }
    
    public String getFkIdUser() { return fkIdUser; }
    public void setFkIdUser(String fkIdUser) { this.fkIdUser = fkIdUser; }
    
    public String getFkIdproduct() { return fkIdproduct; }
    public void setFkIdproduct(String fkIdproduct) { this.fkIdproduct = fkIdproduct; }
    
    public String getQuantityOrder() { return quantityOrder; }
    public void setQuantityOrder(String quantityOrder) { this.quantityOrder = quantityOrder; }
    
    public String getTotalOrder() { return totalOrder; }
    public void setTotalOrder(String totalOrder) { this.totalOrder = totalOrder; }
    
    public String getTrueFalseDelivery() { return trueFalseDelivery; }
    public void setTrueFalseDelivery(String trueFalseDelivery) { this.trueFalseDelivery = trueFalseDelivery; }
    
    public String getDetailsOrder() { return detailsOrder; }
    public void setDetailsOrder(String detailsOrder) { this.detailsOrder = detailsOrder; }
}