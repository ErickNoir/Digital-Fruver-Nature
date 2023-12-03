package model.product;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import model.Conectionn;

public class ProductDAO {

    /* Atributos para realizar operaciones sobre la base de datos */
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String sql = null;
    int r;



// REGISTRAR PRODUCTOS --------------------------------------------------------------------------------------------------------------------------
    public void registProduct(ProductVO newProductVO) throws SQLException {
        try {
            System.out.println("Registrando producto...");
            sql = "INSERT INTO productos(imagenProducto, nombreProducto, disponibilidadPoducto, detallesProducto, precioProducto, suspendidoProducto) VALUES (?, ?, ?, ?, ?, ?);";

            con = Conectionn.conectTo();
            ps = con.prepareStatement(sql);

            ps.setBlob( 1, newProductVO.getImageProduct());
            ps.setString( 2, newProductVO.getNameProduct());
            ps.setString(3, newProductVO.getAvailabilityProduct());
            ps.setString(4, newProductVO.getDescriptionProduct());
            ps.setString( 5, newProductVO.getPriceProduct());
            ps.setString(6, newProductVO.getStatusProduct());

            ps.executeUpdate();
            ps.close();
            System.out.println("Se registró el producto correctamente.");
            
        } catch (Exception x) {
            System.out.println("(DAO) La consulta no pudo ser ejecutada: " + x.getMessage().toString()); 
        } finally{
            con.close();
        }
    }



// LISTAR TODOS LOS Productos --------------------------------------------------------------------------------------------------------------------------
    public List<ProductVO> listsProducts() throws SQLException{
        List<ProductVO> arrayProduct=new ArrayList<>();
        sql="SELECT prod.idProducto, prod.imagenProducto, prod.nombreProducto, prod.precioProducto, prod.disponibilidadPoducto, prod.suspendidoProducto FROM `productos` AS prod;";
        try {
            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            while(rs.next()){
                ProductVO p = new ProductVO();

                p.setIdProduct(rs.getString("idProducto"));
                p.setImageProduct(rs.getBinaryStream("imagenProducto"));
                p.setNameProduct(rs.getString("nombreProducto"));
                p.setPriceProduct(rs.getString("precioProducto"));
                p.setAvailabilityProduct(rs.getString("disponibilidadPoducto"));
                p.setStatusProduct(rs.getString("suspendidoProducto"));

                arrayProduct.add(p);
            }
            
            ps.close();
            System.out.println("Consulta exitosa.");
        } catch (Exception x) {
            System.out.println("(DAO) La consulta no pudo ser ejecutada: " + x.getMessage().toString());
        } finally{ 
            con.close();
        }
        
        return arrayProduct;
    }

    public void listImagesProducts(int idProduct, HttpServletResponse response){
        sql="SELECT prod.idProducto, prod.imagenProducto, prod.nombreProducto, prod.precioProducto, prod.disponibilidadPoducto, prod.suspendidoProducto FROM `productos` AS prod WHERE prod.idProducto =" + idProduct;
        
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");

        try {
            outputStream = response.getOutputStream();

            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            if(rs.next()){
                inputStream = rs.getBinaryStream("imagenProducto");
            }

            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);

            int i = 0;
            
            while((i = bufferedInputStream.read())!=-1){
                bufferedOutputStream.write(i);
            }

        } catch (Exception x) {
            System.out.println("(DAO) La consulta de imagenes no pudo ser ejecutada: " + x.getMessage().toString());
        }
    }
    


// BUSCAR PRODUCTO --------------------------------------------------------------------------------------------------------------------------
    public List<ProductVO> searchProduct(String dataForSearch, String typeDataSearchFor) throws SQLException{
        List<ProductVO> arrayProductSearch=new ArrayList<>();

        System.out.println("Guardando parametros de busqueda...");

        if(typeDataSearchFor.equals("idFKEmpaque")){
            sql = "SELECT prod.idProducto, prod.imagenProducto, prod.nombreProducto, prod.precioProducto, prod.disponibilidadPoducto, prod.suspendidoProducto FROM `productos` AS prod INNER JOIN `empaques` AS emp ON prod.idFKEmpaque=emp.id_Empaque WHERE emp.empaque = '" + dataForSearch + "';";
        }else{
            sql = "SELECT prod.idProducto, prod.imagenProducto, prod.nombreProducto, prod.precioProducto, prod.disponibilidadPoducto, prod.suspendidoProducto FROM `productos` AS prod WHERE " + typeDataSearchFor + "='" + dataForSearch + "';";
        }

        try {
            System.out.println("Buscando producto...");

            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            while(rs.next()){
                ProductVO r = new ProductVO();
                r.setIdProduct(rs.getString("idProducto"));
                r.setImageProduct(rs.getBinaryStream("imagenProducto"));
                r.setNameProduct(rs.getString("nombreProducto"));
                r.setPriceProduct(rs.getString("precioProducto"));
                r.setAvailabilityProduct(rs.getString("disponibilidadPoducto"));
                r.setStatusProduct(rs.getString("suspendidoProducto"));

                arrayProductSearch.add(r);
            }
            
            ps.close();
            System.out.println("Busqueda exitosa.");
        } catch (Exception e) {
            System.out.println("(DAO) La busqueda no pudo ser ejecutada: "+e.getMessage().toString());
        } finally{ 
            con.close();
        }

        return arrayProductSearch;
    }




// DEFINIR ESTADO DE PRODUCTO --------------------------------------------------------------------------------------------------------------------------
    //INACTIVAR
    public void inactivateProduct(ProductVO newProductVO) throws SQLException {
        try{
            System.out.println("Inactivando producto...");

            sql="UPDATE `productos` SET `suspendidoProducto` = '" + newProductVO.getStatusProduct() + "' WHERE `idProducto` = '" + newProductVO.getIdProduct() + "';";
            con = Conectionn.conectTo();
            ps = con.prepareStatement(sql);

            ps.executeUpdate();
            ps.close();

        } catch(Exception x){
             System.out.println("(DAO) La actualización de estado no pudo ser ejecutada: " + x.getMessage().toString());
        } finally{ 
            con.close();
        }

    }

    //ACTIVAR
    public void activateProduct(ProductVO newProductVO) throws SQLException {
        try{
            System.out.println("Activando producto...");

            sql="UPDATE `productos` SET `suspendidoProducto` = '" + newProductVO.getStatusProduct() + "' WHERE `idProducto` = '" + newProductVO.getIdProduct() + "';";
            con = Conectionn.conectTo();
            ps = con.prepareStatement(sql);

            ps.executeUpdate();
            ps.close();

        } catch(Exception x){
             System.out.println("(DAO) La actualización de estado no pudo ser ejecutada: " + x.getMessage().toString());
        } finally{ 
            con.close();
        }

    }



// BUSCAR PRODUCTO A ACTUALIZAR --------------------------------------------------------------------------------------------------------------------------
    public List<ProductVO> listOneProduct(ProductVO newProductVO) throws SQLException{
        List<ProductVO> arrayOneProduct=new ArrayList<>();

        sql="SELECT * FROM `productos` WHERE `idProducto`='" + newProductVO.getIdProduct() + "';";
        
        try {
            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            while(rs.next()){
                ProductVO r=new ProductVO();
                r.setIdProduct(rs.getString("idProducto"));
                r.setImageProduct(rs.getBinaryStream("imagenProducto"));
                r.setNameProduct(rs.getString("nombreProducto"));
                r.setAvailabilityProduct(rs.getString("disponibilidadPoducto"));
                r.setPriceProduct(rs.getString("precioProducto"));
                r.setDescriptionProduct(rs.getString("detallesProducto"));
                r.setStatusProduct(rs.getString("suspendidoProducto"));

                arrayOneProduct.add(r);
            }
            
            ps.close();
            System.out.println("Consulta exitosa.");
        } catch (Exception e) {
            System.out.println("(DAO) La consulta no pudo ser ejecutada "+e.getMessage().toString());
        } finally{ 
            con.close();
        }
        
        return arrayOneProduct;
    }

// ACTUALIZAR PRODUCTO --------------------------------------------------------------------------------------------------------------------------
    public void updateProductt(ProductVO newProductVO) throws SQLException {
        try{
            System.out.println("Actualizando producto...");
            sql = "UPDATE `productos` SET `imagenProducto`='" + newProductVO.getImageProduct() + "',`nombreProducto`='" + newProductVO.getNameProduct() + "',`disponibilidadPoducto`='" + newProductVO.getAvailabilityProduct() +"',`detallesProducto`='" + newProductVO.getDescriptionProduct() + "',`precioProducto`='" + newProductVO.getPriceProduct() + "', `suspendidoProducto`='" + newProductVO.getStatusProduct() + "' WHERE `idProducto`='" + newProductVO.getIdProduct() + "';";

            con = Conectionn.conectTo();
            ps = con.prepareStatement(sql);

            ps.executeUpdate();
            ps.close();

        } catch(Exception x){
            System.out.println("(DAO) La consulta no pudo ser ejecutada " + x.getMessage().toString());
        } finally{ 
            con.close();
        }
        
    }






// VER DETALLES DEL PRODUCTO - CLIENTE --------------------------------------------------------------------------------------------------------------------------
    public List<ProductVO> searchProductDetails(String dataForSearch) throws SQLException{
        List<ProductVO> arrayProductSearch=new ArrayList<>();

        System.out.println("Guardando parametros de busqueda...");
        sql = "SELECT * FROM `productos` AS prod WHERE `idProducto`='" + dataForSearch +"';";


        try {
            System.out.println("Buscando producto...");

            con=Conectionn.conectTo();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery(sql);

            while(rs.next()){
                ProductVO r = new ProductVO();
                r.setIdProduct(rs.getString("idProducto"));
                r.setImageProduct(rs.getBinaryStream("imagenProducto"));
                r.setNameProduct(rs.getString("nombreProducto"));
                r.setPriceProduct(rs.getString("precioProducto"));
                r.setDescriptionProduct(rs.getString("detallesProducto"));

                arrayProductSearch.add(r);
            }
            
            ps.close();
            System.out.println("(Cliente) Busqueda de los detalles del producto exitosa.");
        } catch (Exception e) {
            System.out.println("(DAO) La busqueda no pudo ser ejecutada: "+e.getMessage().toString());
        } finally{ 
            con.close();
        }

        return arrayProductSearch;
    }
}