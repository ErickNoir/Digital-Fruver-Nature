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
import model.order.OrderDAO;
import model.order.OrderVO;

public class Order extends HttpServlet{

    OrderVO newOrderVo = new OrderVO();
    OrderDAO newOrderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String navOrders = req.getParameter("navOrders");
        System.out.println(navOrders);

        switch (navOrders) {
            case "listAllOrders":
                System.out.println("Listando...");
                listOrders(req,resp);
                break;
        
            default:
                System.out.println("(getOrders) idk, bro...");
                break;
        }
    }



    private void listOrders(HttpServletRequest req, HttpServletResponse resp) {
        try{
            List<OrderVO> arrayAllOrders = newOrderDAO.listsOrder();
            req.setAttribute("allOrdersADM", arrayAllOrders);

            System.out.println("Finalizando...");
            
            RequestDispatcher showUsers = req.getRequestDispatcher("./views/order/listAllOrdersADM.jsp");
            showUsers.forward(req, resp);

            System.out.println("Se terminó de listar los Domicilios.");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){
            System.out.println("Error al listar los Domicilios: "+ e.getMessage().toString());
        }
    }





    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String formOrders = req.getParameter("formOrders");
        System.out.println(formOrders);

        String formOrdersValidated = req.getParameter("formOrdersValue");
        System.out.println(formOrders + " " + formOrdersValidated);

        if(formOrders != null){
            switch (formOrders) {
                case "registNewOrder":
                    registNewOrder(req, resp);
                    break;
                
                case "listOrderForClient":
                    listOrderForClient(req, resp);
                    break;

                case "searchOneOrder":
                    searchOneOrderForUpdate(req, resp);
                    break;

                case "updateOrderADM":
                    updateOrder(req, resp);
                    break;
            
                default:
                    System.out.println("(doPostOrders) idk, bro...");
                    break;
            }
        } else{
            switch (formOrdersValidated) {
                case "registNewOrder":
                    registNewOrder(req,resp);
                    break;
            
                default:
                    System.out.println("(doPostOrders) idk, bro...");
                    break;
            }
        }
    }


    // LISTAR PEDIDO - CLIENTE -------------------------------------------------------------------------------------------------------------------------- 
    private void listOrderForClient(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("listOrderClientID")!=null) { newOrderVo.setFkIdUser(req.getParameter("listOrderClientID")); }

        try {
            List<OrderVO> arrayOrdersClient = newOrderDAO.listOrdersClient(newOrderVo.getFkIdUser());
            req.setAttribute("orders", arrayOrdersClient);

            System.out.println("Finalizando...");

            RequestDispatcher showProductsSearch = req.getRequestDispatcher("views/order/listClientOrders.jsp");
            showProductsSearch.forward(req, resp);

            System.out.println("Se terminó de los pedidos del cliente.");
            System.out.println("------------------------------------------------------------------------");
            
        } catch (Exception x) {
            System.out.println("(Servlet) Error al listar los pedidos del cliente: "+ x.getMessage().toString());
        }
    }



// REGISTRAR PEDIDO - CLIENTE -------------------------------------------------------------------------------------------------------------------------- 
    private void registNewOrder(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("idUserOrder")!=null) { newOrderVo.setFkIdUser(req.getParameter("idUserOrder")); }
        System.out.println(newOrderVo.getFkIdUser());

        if (req.getParameter("idProductOrder")!=null) { newOrderVo.setFkIdproduct(req.getParameter("idProductOrder")); }; 

        if(req.getParameter("dateForOrder")!=null){
            String dateOrder = req.getParameter("dateForOrder");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dateTime = LocalDateTime.parse(dateOrder, formatter);
            DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateForDB = dateTime.format(dbFormatter);

            newOrderVo.setOrderDeliveryDate(formattedDateForDB);
        }

        if (req.getParameter("quantityOrder")!=null) { newOrderVo.setQuantityOrder(req.getParameter("quantityOrder"));}
        if (req.getParameter("totalOrder")!=null) { newOrderVo.setTotalOrder(req.getParameter("totalOrder"));}
        if (req.getParameter("ifDeliveryOrder")!=null) { newOrderVo.setTrueFalseDelivery(req.getParameter("ifDeliveryOrder"));}
        if (req.getParameter("orderDetails")!=null) { newOrderVo.setDetailsOrder(req.getParameter("orderDetails"));}

        DeliveryVO deliveryVO = new DeliveryVO();
        DeliverDAO deliverDAO = new DeliverDAO();
            
        
        if((newOrderVo.getTrueFalseDelivery()).equals("1")){
            try{
                newOrderDAO.registerNewOrder(newOrderVo);
                System.out.println("El registro del pedido fue exitoso. Registrando domicilio...");

                if (req.getParameter("address")!=null) { deliveryVO.setAddress(req.getParameter("address"));}
                deliverDAO.registNewDelivery(deliveryVO);
                System.out.println("El registro del domicilio fue exitoso. Terminando...");

                String value = "listProductsForClient";
                String clientIndexUrl = "product?navProduct=" + URLEncoder.encode(value, "UTF-8");
                resp.sendRedirect(clientIndexUrl);
            }catch(Exception x){
                System.out.println("(Servlet Order) La consulta no pudo ser ejecutada" + x.getMessage().toString()); 
            }

        } else if((newOrderVo.getTrueFalseDelivery()).equals("0")){
            try {
                newOrderDAO.registerNewOrder(newOrderVo);
                System.out.println("El registro del pedido fue exitoso.");

                String value = "listProductsForClient";
                String clientIndexUrl = "product?navProduct=" + URLEncoder.encode(value, "UTF-8");
                resp.sendRedirect(clientIndexUrl);
            } catch (Exception x) {
                System.out.println("(Servlet Order) La consulta no pudo ser ejecutada" + x.getMessage().toString()); 
            }

        } else{
            System.out.println("Error al registrar el pedido. Error en el domicilio.");
        }
    }



// BUSCAR UN PEDIDO PARA ACTUALIZAR - ADMINISTRADOR --------------------------------------------------------------------------------------------------------------------------
    private void searchOneOrderForUpdate(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("Buscando Pedido...");

        if(req.getParameter("searchOrderToEdit")!= null){ newOrderVo.setIdOrder(req.getParameter("searchOrderToEdit"));}

        try{
            List<OrderVO> arrayOneOrderrr = newOrderDAO.listOneOderForUpdate(newOrderVo);
            req.setAttribute("oneOrder", arrayOneOrderrr);

            System.out.println("Finalizando...");
            
            RequestDispatcher formToUpdatePedido = req.getRequestDispatcher("./views/order/updateOrderADM.jsp");
            formToUpdatePedido.forward(req, resp);

            System.out.println("Se terminó de listar los datos del pedido buscado.");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){
            System.out.println("(Servlet) Error al listar los datos del prdido buscado: "+ e.getMessage().toString());
        }
    }



// ACTUALIZAR PEDIDO - ADMINISTRADOR --------------------------------------------------------------------------------------------------------------------------
    private void updateOrder(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("updateIDOrder")!=null) { newOrderVo.setIdOrder(req.getParameter("updateIDOrder")); }

        if (req.getParameter("updateDeliveryDateOrder")!=null && !req.getParameter("updateDeliveryDateOrder").isEmpty()) { 
            String dateDelivery = req.getParameter("updateDeliveryDateOrder");
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dateTime2 = LocalDateTime.parse(dateDelivery, formatter2);
            DateTimeFormatter dbFormatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateForDB2 = dateTime2.format(dbFormatter2);
            newOrderVo.setOrderDeliveryDate(formattedDateForDB2);
        } else{
            newOrderVo.setOrderDeliveryDate(null);
        }

        if (req.getParameter("updateQuantityProductOrder")!=null) { newOrderVo.setQuantityOrder(req.getParameter("updateQuantityProductOrder")); }
        if (req.getParameter("updateTotalOrder")!=null) { newOrderVo.setTotalOrder(req.getParameter("updateTotalOrder")); }
        if (req.getParameter("updateDeliveryTrueFalseOrder")!=null) { newOrderVo.setTrueFalseDelivery(req.getParameter("updateDeliveryTrueFalseOrder")); }
        if (req.getParameter("updateDetailsOrder")!=null) { newOrderVo.setDetailsOrder(req.getParameter("updateDetailsOrder")); }
    
        try {
            newOrderDAO.updateOrder(newOrderVo);
            System.out.println("La actualización del Pedido fue exitosa.");

            RequestDispatcher showUsers = req.getRequestDispatcher("./views/order/listAllOrdersADM.jsp");
            showUsers.forward(req, resp);
        } catch (Exception x) {
            System.out.println("(Servlet) La consulta de actualización no pudo ser ejecutada" + x.getMessage().toString()); 
        }
    }
}