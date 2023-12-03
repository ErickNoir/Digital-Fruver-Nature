package model.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


import model.Conectionn;

public class OrderDAO {
    /* Atributos para realizar operaciones sobre la base de datos */
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String sql = null;
    int r;


    public void registerNewOrder(OrderVO newOrderVo) {
        System.out.println("Registrando pedido...");
        try{
            sql = "CALL Insertar_Pedido(?, ?, ?, ?, ?, ?, ?);";
            //sql = "INSERT INTO `pedidos`(`id_Pedido`, `idFK_Usuario`, `idFK_Producto`, `fechaEntrega_Pedido`, `cantidadProducto_DetallePedido`, `precioTotal_Pedido`, `domicilio_Pedido`, `detalles_Pedido`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            con = Conectionn.conectTo();
            ps = con.prepareCall(sql);

            ps.setString( 1, newOrderVo.getFkIdUser());
            ps.setString( 2, newOrderVo.getFkIdproduct());  
            ps.setString( 3, newOrderVo.getQuantityOrder());
            ps.setString(4, newOrderVo.getTotalOrder());
            ps.setString(5, newOrderVo.getTrueFalseDelivery());
            ps.setString(6, newOrderVo.getOrderDeliveryDate());
            ps.setString(7, newOrderVo.getDetailsOrder());
            
            ps.executeUpdate();
            ps.close();
            con.close();

            System.out.println("Se registró el pedido correctamente.");
            
        } catch (Exception x) {
            System.out.println("(DAO) La consulta no pudo ser ejecutada: " + x.getMessage().toString()); 
        }
    }


    public List<OrderVO> listOrdersClient(String fkIdUser) throws SQLException {
        List<OrderVO> arrayProductSearch=new ArrayList<>();

        try {
            sql = "CALL Listar_Pedidos_Cliente(?);";

            System.out.println("Buscando pedido...");

            con=Conectionn.conectTo();
            ps = con.prepareCall(sql);

            ps.setString( 1, fkIdUser);

            rs = ps.executeQuery();
            
            while(rs.next()){
                OrderVO r = new OrderVO();
                r.setIdOrder(rs.getString("id_Pedido"));
                r.setOrderDate(rs.getString("fecha_Pedido"));
                r.setFkIdproduct(rs.getString("nombreProducto"));
                r.setQuantityOrder(rs.getString("cantidadProducto_DetallePedido"));
                r.setTotalOrder(rs.getString("precioTotal_Pedido"));
                r.setDetailsOrder(rs.getString("detalles_Pedido"));

                arrayProductSearch.add(r);
            }
            
            ps.close();
            con.close();
            System.out.println("Busqueda exitosa.");
            
        } catch (Exception x) {
            System.out.println("(DAO) Error al listar los pedidos del cliente: "+ x.getMessage().toString());
        }
        return arrayProductSearch;
    }






    public List<OrderVO> listsOrder() throws SQLException {
        List<OrderVO> arrayAllOrders=new ArrayList<>();

        try {
            sql="SELECT * FROM `pedidos`;";

            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            while(rs.next()){
                OrderVO r=new OrderVO();
                r.setIdOrder(rs.getString("id_Pedido"));
                r.setFkIdUser(rs.getString("idFK_Usuario"));
                r.setFkIdproduct(rs.getString("idFK_Producto"));
                r.setOrderDate(rs.getString("fecha_Pedido"));
                r.setOrderDeliveryDate(rs.getString("fechaEntrega_Pedido"));
                r.setQuantityOrder(rs.getString("cantidadProducto_DetallePedido"));
                r.setTotalOrder(rs.getString("precioTotal_Pedido"));
                r.setTrueFalseDelivery(rs.getString("domicilio_Pedido"));
                r.setDetailsOrder(rs.getString("detalles_Pedido"));

                arrayAllOrders.add(r);
            }
            
            ps.close();
            con.close();
            System.out.println("Consulta exitosa.");
        } catch (Exception e) {
            System.out.println("(DAO) La consulta de todos los pedidos no pudo ser ejecutada "+e.getMessage().toString());
        }
        
        return arrayAllOrders;
    }








// BUSCAR PEDIDOS A ACTUALIZAR --------------------------------------------------------------------------------------------------------------------------
    public List<OrderVO> listOneOderForUpdate(OrderVO newOrderVO) throws SQLException{
        List<OrderVO> arrayOneOrderrr=new ArrayList<>();

        sql="SELECT * FROM `pedidos` WHERE `id_Pedido`='" + newOrderVO.getIdOrder() + "';";
        
        try {
            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            while(rs.next()){
                OrderVO r=new OrderVO();
                r.setIdOrder(rs.getString("id_Pedido"));

                r.setOrderDeliveryDate(rs.getString("fechaEntrega_Pedido"));
                if (r.getOrderDeliveryDate() != null) {
                    System.out.println("Ajustando formatos de fecha para la entrega...");
                    String dateShipment = r.getOrderDeliveryDate();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern( "yyyy-MM-dd HH:mm:ss");
                    LocalDateTime dateTime = LocalDateTime.parse(dateShipment, formatter);
                    DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                    String formattedDateForDB = dateTime.format(dbFormatter);
                    r.setOrderDeliveryDate(formattedDateForDB);
                    System.out.println("Fecha de entrega ajustada."); 
                 } else{
                    System.out.println("Fecha de entrega no registrada. Continuando con el proceso...");
                    r.setOrderDeliveryDate("0000-00-00'T'00:00");
                 }

                r.setQuantityOrder(rs.getString("cantidadProducto_DetallePedido"));
                r.setTotalOrder(rs.getString("precioTotal_Pedido"));
                r.setTrueFalseDelivery(rs.getString("domicilio_Pedido"));
                r.setDetailsOrder(rs.getString("detalles_Pedido"));
                

                arrayOneOrderrr.add(r);
            }
            
            ps.close();
            System.out.println("Consulta exitosa.");
        } catch (Exception e) {
            System.out.println("(DAO) La consulta no pudo ser ejecutada "+e.getMessage().toString());
        } finally{ 
            con.close();
        }
        
        return arrayOneOrderrr;
    }


// ACTUALIZAR PEDIDO - ADMINISTRADOR --------------------------------------------------------------------------------------------------------------------------
    public void updateOrder(OrderVO newOrderVO) throws SQLException {
        try{
            System.out.println("Actualizando usuario...");
            sql = "CALL Actualizar_pedido(?, ?, ?, ?, ?, ?);";

            con=Conectionn.conectTo();
            ps = con.prepareCall(sql);

            ps.setString( 1, newOrderVO.getIdOrder());
            ps.setString( 2, newOrderVO.getOrderDeliveryDate());
            ps.setString(3, newOrderVO.getQuantityOrder());
            ps.setString(4, newOrderVO.getTotalOrder());
            ps.setString(5, newOrderVO.getTrueFalseDelivery());
            ps.setString( 6, newOrderVO.getDetailsOrder());

            rs = ps.executeQuery();

            ps.close();
            con.close();

        } catch(Exception x){
            System.out.println("(DAO) La consulta no pudo ser ejecutada " + x.getMessage().toString());
        } finally{ 
            con.close();
        }
        
    }
}
