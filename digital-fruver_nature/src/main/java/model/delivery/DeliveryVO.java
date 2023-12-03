package model.delivery;

public class DeliveryVO {
    private String idDelivery, idFKOrder, shipmentDate, deliveryDate;
    private String address, detailsDelivery;

    public DeliveryVO(){}
    public DeliveryVO(String idDelivery, String idFKOrder, String shipmentDate, String deliveryDate, String address, String detailsDelivery){
        this.idDelivery = idDelivery;
        this.idFKOrder = idFKOrder;
        this.address = address;
        this.detailsDelivery = detailsDelivery;
        this.shipmentDate = shipmentDate;
        this.deliveryDate = deliveryDate;
    }

    
    public String getIdDelivery() { return idDelivery; }
    public void setIdDelivery(String idDelivery) { this.idDelivery = idDelivery; }
    
    public String getIdFKOrder() { return idFKOrder; }
    public void setIdFKOrder(String idFKOrder) { this.idFKOrder = idFKOrder; }
    
    public String getShipmentDate() { return shipmentDate; }
    public void setShipmentDate(String shipmentDate) { this.shipmentDate = shipmentDate; }
    
    public String getDeliveryDate() { return deliveryDate; }
    public void setDeliveryDate(String deliveryDate) { this.deliveryDate = deliveryDate; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getDetailsDelivery() { return detailsDelivery; }
    public void setDetailsDelivery(String detailsDelivery) { this.detailsDelivery = detailsDelivery; }
}
