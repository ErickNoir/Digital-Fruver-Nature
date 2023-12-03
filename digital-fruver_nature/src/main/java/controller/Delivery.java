package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.delivery.DeliverDAO;
import model.delivery.DeliveryVO;
import model.order.OrderVO;

public class Delivery extends HttpServlet {

    DeliveryVO newDeliveryVO = new DeliveryVO();
    DeliverDAO newDeliverDAO = new DeliverDAO();
    OrderVO newOrderVO = new OrderVO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String navDelivery = req.getParameter("navDelivery");
        System.out.println(navDelivery);

        switch (navDelivery) {
            case "listAllDeliveries":
                listAdminDelivery(req, resp);
                break;
        
            default:
                System.out.println("(getOrders) idk, bro...");
                break;
        }
    }


    private void listAdminDelivery(HttpServletRequest req, HttpServletResponse resp) {
        try{
            List<DeliveryVO> arrayAllDelivery = newDeliverDAO.listAllDomicilios();
            req.setAttribute("domicilioss", arrayAllDelivery);

            System.out.println("Finalizando...");
            
            RequestDispatcher showDeliveries = req.getRequestDispatcher("./views/delivery/listAllDeliveriesADM.jsp");
            showDeliveries.forward(req, resp);

            System.out.println("Se terminó de listar los domicilios .");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){
            System.out.println("Error al listar los domicilios : "+ e.getMessage().toString());
        }
    }





    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String formDelivery = req.getParameter("formDelivery");
        System.out.println(formDelivery);

        switch (formDelivery) {
            case "listClientDeliveries":
                listClientDeliveries(req, resp);
                break;
            
            case "searchOneDelivery":
                System.out.println("Listando domicilio a editar...");
                listToUpdateOneDelivery(req, resp);
                break;

            case "updateDeliveryADM":
                System.out.println("Acualizando domicilio seleccionado...");
                updateOneDeliveryADM(req, resp);
                break;
        
            default:
                System.out.println("(getOrders) idk, bro...");
                break;
        }
    }


// LISTAR TODOS LOS DOMICILIOS - CLIENTE -----------------------------------------------------------------------------------------------------------
    private void listClientDeliveries(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        if (req.getParameter("listDeliveryClientID")!=null) { newOrderVO.setFkIdUser(req.getParameter("listDeliveryClientID")); }

        try {
            List<DeliveryVO> arrayDeliveriesClient = newDeliverDAO.listDeliveriesClient(newOrderVO.getFkIdUser());
            req.setAttribute("deliveries", arrayDeliveriesClient);

            System.out.println("Finalizando...");

            RequestDispatcher showClientDeliveries = req.getRequestDispatcher("views/delivery/listClientDeliveries.jsp");
            showClientDeliveries.forward(req, resp);

            System.out.println("Se terminó de los domicilios del cliente.");
            System.out.println("------------------------------------------------------------------------");
            
        } catch (Exception x) {
            System.out.println("(Servlet) Error al listar los domicilios del cliente: "+ x.getMessage().toString());
        }
    }
    



//LISTAR UN DOMICILIO PARA ACTUALIZAR - ADMINISTRADOR ------------------------------------------------------------------------------------------------
    private void listToUpdateOneDelivery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("searchDeliveryToEdit")!=null){newDeliveryVO.setIdDelivery(req.getParameter("searchDeliveryToEdit"));}

        try {
            List<DeliveryVO> arrayOneDeliverToUpdate = newDeliverDAO.listOneDeliveryToEdit(newDeliveryVO.getIdDelivery());
            req.setAttribute("oneDelivery", arrayOneDeliverToUpdate);

            System.out.println("Finalizando...");

            RequestDispatcher showFormToUpdateDelivery = req.getRequestDispatcher("views/delivery/updateDeliveryADM.jsp");
            showFormToUpdateDelivery.forward(req, resp);

            System.out.println("Se terminó de listar el domicilio a actualizar.");
            System.out.println("------------------------------------------------------------------------");
            
        } catch (Exception x) {
            System.out.println("(Servlet) Error al listar el domicilios a editar: "+ x.getMessage().toString());
        }
    }



//ACTUALIZAR DOMICILIO - ADMINISTRADOR ---------------------------------------------------------------------------------------------------------------
    private void updateOneDeliveryADM(HttpServletRequest req, HttpServletResponse resp) {
        if(req.getParameter("updateIDDelivery")!=null){newDeliveryVO.setIdDelivery(req.getParameter("updateIDDelivery"));}
        if(req.getParameter("updateAdressDelivery")!=null){newDeliveryVO.setAddress(req.getParameter("updateAdressDelivery"));}
        
        if(req.getParameter("updateShipmentDateDelivery")!=null && !req.getParameter("updateShipmentDateDelivery").isEmpty()){
            String dateShipment = req.getParameter("updateShipmentDateDelivery");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dateTime = LocalDateTime.parse(dateShipment, formatter);
            DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateForDB = dateTime.format(dbFormatter);
            newDeliveryVO.setShipmentDate(formattedDateForDB);
        } else{
            newDeliveryVO.setShipmentDate(null);
        }
        
        if(req.getParameter("updateDeliveryDateDelivery")!=null && !req.getParameter("updateDeliveryDateDelivery").isEmpty()){
            String dateDelivery = req.getParameter("updateDeliveryDateDelivery");
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dateTime2 = LocalDateTime.parse(dateDelivery, formatter2);
            DateTimeFormatter dbFormatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateForDB2 = dateTime2.format(dbFormatter2);
            newDeliveryVO.setDeliveryDate(formattedDateForDB2);
        } else{
            newDeliveryVO.setDeliveryDate(null);
        }

        if(req.getParameter("updateDetailsDelivery")!=null){newDeliveryVO.setDetailsDelivery(req.getParameter("updateDetailsDelivery"));}
    
        try{
            newDeliverDAO.updateDelivery(newDeliveryVO);
            System.out.println("La actualización del domicilio fue exitosa.");

            RequestDispatcher showListDeliveries = req.getRequestDispatcher("./views/delivery/listAllDeliveriesADM.jsp");
            showListDeliveries.forward(req, resp);

        } catch (Exception x) {
            System.out.println("(Servlet) La consulta de actualización no pudo ser ejecutada: " + x.getMessage().toString()); 
        }
    
    
    
    }

}
