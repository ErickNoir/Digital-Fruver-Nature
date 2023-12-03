package model.delivery;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import model.Conectionn;
import model.order.OrderVO;

public class DeliverDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String sql = null;
    int r;



    public void registNewDelivery(DeliveryVO deliveryVO) {
        System.out.println("Registrando domicilio...");
        
        try {
            con = Conectionn.conectTo();

            String sql1 = "SELECT MAX(id_Pedido) AS max_id FROM pedidos;";
            ps=con.prepareStatement(sql1);
            rs=ps.executeQuery(sql1);
            int idOrder = 0;
            if (rs.next()) {
                idOrder = rs.getInt("max_id"); // Obtener el valor de la columna max_id
            }


            sql = "INSERT INTO `domicilios`(`id_Domicilio`, `idFK_Pedido`, `direccion_Domicilio`, `detalles_Domicilio`, `fechaEnvio_Domicilio`, `fechaEntrega_Domicilio`) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setString( 1, deliveryVO.getIdDelivery());
            ps.setInt( 2, idOrder);
            ps.setString( 3, deliveryVO.getAddress());
            ps.setString(4, deliveryVO.getDetailsDelivery());
            ps.setString(5, deliveryVO.getShipmentDate());
            ps.setString( 6, deliveryVO.getDeliveryDate());


            ps.executeUpdate();
            ps.close();
            con.close();

            System.out.println("Se registró el domicilio correctamente.");
            
        } catch (Exception x) {
            System.out.println("(DAO Domicilio) La consulta no pudo ser ejecutada: " + x.getMessage().toString());
        }

    }



    public List<DeliveryVO> listDeliveriesClient(String fkIdUser) throws SQLException {
        List<DeliveryVO> arrayDeliveriesClient = new ArrayList<>();
    
        try {
            sql = "CALL Listar_Domicilios_Cliente(?);";
    
            System.out.println("Buscando domicilio..." + fkIdUser);
    
            con = Conectionn.conectTo();
            ps = con.prepareCall(sql);
    
            ps.setString(1, fkIdUser);
    
            rs = ps.executeQuery();
    
            // Cerrar la conexión después de obtener los datos
            while (rs.next()) {
                DeliveryVO r = new DeliveryVO();
                r.setIdDelivery(rs.getString("id_Domicilio"));
                r.setIdFKOrder(rs.getString("idFK_Pedido"));
                r.setAddress(rs.getString("direccion_Domicilio"));
                r.setShipmentDate(rs.getString("fechaEnvio_Domicilio"));
                r.setDeliveryDate(rs.getString("fechaEntrega_Domicilio"));
                r.setDetailsDelivery(rs.getString("detalles_Domicilio"));
    
                arrayDeliveriesClient.add(r);
            }
    
            // Cerrar la conexión después de obtener los datos
            ps.close();
            con.close();
            System.out.println("Búsqueda exitosa.");
    
        } catch (Exception x) {
            System.out.println("(DAO) Error al listar los domicilios del cliente: " + x.getMessage().toString());
            // Aquí podrías agregar un x.printStackTrace(); para obtener más detalles del error en la consola
        }
    
        return arrayDeliveriesClient;
    }



//LISTAR TODOS LOS DOMICILIOS - ADMINISTRADOR -------------------------------------------------------------------------------------------------------------------------
    public List<DeliveryVO> listAllDomicilios() throws SQLException {
        List<DeliveryVO> arrayAllDelivery=new ArrayList<>();

        try {
            sql="SELECT * FROM `domicilios`;";

            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            while(rs.next()){
                DeliveryVO r=new DeliveryVO();
                r.setIdDelivery(rs.getString("id_Domicilio"));
                r.setIdFKOrder(rs.getString("idFK_Pedido"));
                r.setShipmentDate(rs.getString("fechaEnvio_Domicilio"));
                r.setDeliveryDate(rs.getString("fechaEntrega_Domicilio"));
                r.setAddress(rs.getString("direccion_Domicilio"));
                r.setDetailsDelivery(rs.getString("detalles_Domicilio"));

                arrayAllDelivery.add(r);
            }
            
            ps.close();
            con.close();
            System.out.println("Consulta exitosa.");
        } catch (Exception e) {
            System.out.println("(DAO) La consulta de todos los domicilios no pudo ser ejecutada "+e.getMessage().toString());
        }
        
        return arrayAllDelivery;
    }


// LISTAR UN DOMICILIO PARA ACTUALIZAR - ADMINISTRADOR ----------------------------------------------------------------------------------------------
    public List<DeliveryVO> listOneDeliveryToEdit(String idDelivery) {
        List<DeliveryVO> arrayOneDeliverToUpdate=new ArrayList<>();

        try{
            System.out.println("Buscando domicilio a acrualizar...");
            sql="CALL Listar_Domicilio_A_Actualizar(?);";

            con = Conectionn.conectTo();
            ps = con.prepareCall(sql);

            ps.setString(1, idDelivery);

            rs = ps.executeQuery();
    
            // Cerrar la conexión después de obtener los datos
            while (rs.next()) {
                DeliveryVO r = new DeliveryVO();
                r.setIdDelivery(rs.getString("id_Domicilio"));
                r.setAddress(rs.getString("direccion_Domicilio"));

                r.setShipmentDate(rs.getString("fechaEnvio_Domicilio"));

                if (r.getShipmentDate() != null) {
                   System.out.println("Ajustando formatos de fecha para el envío...");
                    String dateShipment = r.getShipmentDate();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern( "yyyy-MM-dd HH:mm:ss");
                    LocalDateTime dateTime = LocalDateTime.parse(dateShipment, formatter);
                    DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                    String formattedDateForDB = dateTime.format(dbFormatter);
                    r.setShipmentDate(formattedDateForDB);
                    System.out.println("Fecha de envio ajustada."); 
                } else{
                    System.out.println("Fecha de envío no registrada. Continuando con el proceso...");
                    r.setShipmentDate("0000-00-00'T'00:00");
                }
                
                if (r.getDeliveryDate() != null) {
                    r.setDeliveryDate(rs.getString("fechaEntrega_Domicilio"));
                    System.out.println("Ajustando formatos de fecha de entrega...");
                    String dateDelivery = r.getDeliveryDate();
                    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    LocalDateTime dateTime2 = LocalDateTime.parse(dateDelivery, formatter2);
                    DateTimeFormatter dbFormatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                    String formattedDateForDB2 = dateTime2.format(dbFormatter2);
                    r.setDeliveryDate(formattedDateForDB2);
                    System.out.println("Fecha de entrega ajustada.");
                } else{
                    System.out.println("Fecha de envío entrega no registrada. Continuando con el proceso...");
                    r.setDeliveryDate("0000-00-00'T'00:00");
                }
                
                r.setDetailsDelivery(rs.getString("detalles_Domicilio"));
    
                arrayOneDeliverToUpdate.add(r);
            }
    
            // Cerrar la conexión después de obtener los datos
            ps.close();
            con.close();
            System.out.println("Búsqueda exitosa.");

        } catch (Exception e) {
            System.out.println("(DAO) La consulta de listar el domicilio a actualizar no pudo ser ejecutada "+e.getMessage().toString());
        }

        return arrayOneDeliverToUpdate;
    }


// ACTUALIZAR DOMICILIO - ADMINISTRADOR ----------------------------------------------------------------------------------------------
    public void updateDelivery(DeliveryVO newDeliveryVO) {
        try{
            System.out.println("Actualizando domicilio...");
            sql="CALL Actualizar_domicilio(?, ?, ?, ?, ?)";

            con = Conectionn.conectTo();
            ps = con.prepareCall(sql);

            ps.setString(1, newDeliveryVO.getIdDelivery());
            ps.setString(2, newDeliveryVO.getAddress());
            ps.setString(3, newDeliveryVO.getDetailsDelivery());
            ps.setString(4, newDeliveryVO.getShipmentDate());
            ps.setString(5, newDeliveryVO.getDeliveryDate());

            rs = ps.executeQuery();
            ps.close();

        }catch(Exception x){
            System.out.println("(DAO) La consulta no pudo ser ejecutada " + x.getMessage().toString());
        } 
    }
}
