package controller;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.product.ProductVO;
import model.product.ProductDAO;


@MultipartConfig
public class Product extends HttpServlet implements Filter{
    ProductVO newProductVO = new ProductVO();
    ProductDAO newProductDAO = new ProductDAO();
    
    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String navProduct = req.getParameter("navProduct");
        System.out.println(navProduct);

        if(navProduct!=null){
            switch(navProduct){
            case "listProducts":
                System.out.println("Listando...");
                listProducts(req,resp);
                break;

            case "listProductsForClient":
                System.out.println("Listando...");
                listProductsClient(req,resp);
                break;

            case "registProduct":
                RequestDispatcher register = req.getRequestDispatcher("views/product/registProduct.jsp");
                register.forward(req, resp);
                break;
            
            
            }
        } else {
            System.out.println("Idk, bro...");
        }
    }


//Listar Productos - ADMINISTRADOR
    private void listProducts(HttpServletRequest req, HttpServletResponse resp) {
        try{List<ProductVO> arrayProduct = newProductDAO.listsProducts();
            req.setAttribute("productList", arrayProduct);
            System.out.println("Finalizando...");
                        
            RequestDispatcher showProducts = req.getRequestDispatcher("views/product/listProducts.jsp");
            showProducts.forward(req, resp);

            System.out.println("Se terminó de listar los productos.");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){ System.out.println("Error al listar los productos: "+ e.getMessage().toString()); }
    }


//Listar Productos -  CLIENTE
    private void listProductsClient(HttpServletRequest req, HttpServletResponse resp) {
        try{List<ProductVO> arrayProduct = newProductDAO.listsProducts();
            req.setAttribute("productList", arrayProduct);
            System.out.println("Finalizando...");
                        
            RequestDispatcher showProducts = req.getRequestDispatcher("views/user/clientIndex.jsp");
            showProducts.forward(req, resp);

            System.out.println("Se terminó de listar los productos para el cliente.");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){ System.out.println("Error al listar los productos: "+ e.getMessage().toString()); }
    }



    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productForm = req.getParameter("productForm");
        System.out.println(productForm);

        switch(productForm){
            case "searchProductFor":
                searchProductFor(req,resp);
                break;

            case "inactivateProduct":
                inactivateProduct(req,resp);
                break;

            case "activateProduct":
                activateProduct(req,resp);
                break;

            case "viewProductDetails_Client":
                viewProductDetails_Client(req,resp);
                break;
            
// REGISTRAR PRODUCTO -------------------------------------------------------------------------------------------------------------------------- 
            case "Registrar Producto":
                Part partt = req.getPart("photoNewProduct");
                InputStream inputStream = partt.getInputStream();
                
                String newNameP = req.getParameter("nameNewProduct"); 
                String disponibilidadPoducto = req.getParameter("stockNewProduct"); 
                String detalles = req.getParameter("detailsNewProduct"); 
                String precio = req.getParameter("priceNewProduct"); 
                String estado = req.getParameter("statusNewProduct"); 

                newProductVO.setNameProduct(newNameP);
                newProductVO.setImageProduct(inputStream);
                newProductVO.setAvailabilityProduct(disponibilidadPoducto);
                newProductVO.setDescriptionProduct(detalles);
                newProductVO.setPriceProduct(precio);
                newProductVO.setStatusProduct(estado);
                
                try {
                    newProductDAO.registProduct(newProductVO);
                    req.getRequestDispatcher("product?navProduct=listProducts").forward(req, resp);;
                } catch (Exception e) {
                    System.out.println("Error al listar los productos: "+ e.getMessage().toString());
                }
                break;
                

                case "searchOneProduct":
                    searchOneProduct(req,resp);
                    break;


                case "Actualizar Producto":
                    Part uPartt = req.getPart("updateImageProduct");
                    InputStream uInputStream = uPartt.getInputStream();
                    
                    String uIDP = req.getParameter("updateIDProduct");
                    String uNameP = req.getParameter("updateNameProduct"); 
                    String uDispoP = req.getParameter("updateStockProduct"); 
                    String uDetallesP = req.getParameter("updateDetailsProduct"); 
                    String uPrecioP = req.getParameter("updatePriceProduct"); 
                    String uEstadop = req.getParameter("updateStatusProduct"); 
                    
                    newProductVO.setIdProduct(uIDP);
                    newProductVO.setImageProduct(uInputStream);
                    newProductVO.setNameProduct(uNameP); 
                    newProductVO.setAvailabilityProduct(uDispoP);
                    newProductVO.setDescriptionProduct(uDetallesP);
                    newProductVO.setPriceProduct(uPrecioP);
                    newProductVO.setStatusProduct(uEstadop);
                    
                    try {
                        newProductDAO.updateProductt(newProductVO);
                        req.getRequestDispatcher("product?navProduct=listProducts").forward(req, resp);;
                    } catch (Exception e)  {
                        System.out.println("Error al listar los productos: "+ e.getMessage().toString());
                    }
                    break;
        }
    }





// BUSCAR PRODUCTO --------------------------------------------------------------------------------------------------------------------------
    private void searchProductFor(HttpServletRequest req, HttpServletResponse resp) {
        String dataForSearch = null;
        String typeDataSearchFor = null;

        if(req.getParameter("searchData")!= null){ dataForSearch = req.getParameter("searchData"); }
        if(req.getParameter("searchFor")!= null){ typeDataSearchFor = req.getParameter("searchFor"); }

        try{
            List<ProductVO> arrayProductSearch = newProductDAO.searchProduct(dataForSearch, typeDataSearchFor);
            req.setAttribute("product", arrayProductSearch);

            System.out.println("Finalizando...");

            RequestDispatcher showProductsSearch = req.getRequestDispatcher("views/product/listProductForSearch.jsp");
            showProductsSearch.forward(req, resp);

            System.out.println("Se terminó de buscar el producto.");
            System.out.println("------------------------------------------------------------------------");

        } catch(Exception x){
            System.out.println("(Servlet) Error al buscar el producto: "+ x.getMessage().toString());
        }
    }



// DEFINIR ESTADO DE PRODUCTO --------------------------------------------------------------------------------------------------------------------------
    //INACTIVAR
    private void inactivateProduct(HttpServletRequest req, HttpServletResponse resp){
        if(req.getParameter("defineStatusProduct")!= null){ newProductVO.setIdProduct(req.getParameter("defineStatusProduct"));}
        if(req.getParameter("defineStatus")!= null){ newProductVO.setStatusProduct(req.getParameter("defineStatus"));}

        try{
            newProductDAO.inactivateProduct(newProductVO);
            System.out.println("Finalizando...");

            RequestDispatcher showProducts = req.getRequestDispatcher("views/product/listProducts.jsp");
            showProducts.forward(req, resp);

            System.out.println("La inactivación del producto fue exitosa.");
            System.out.println("------------------------------------------------------------------------");
        } catch(Exception x){
            System.out.println("(Servlet) Error al inactivar el productp: "+ x.getMessage().toString());
        }
    }

    //ACTIVAR
    private void activateProduct(HttpServletRequest req, HttpServletResponse resp){
        if(req.getParameter("defineStatusProduct")!= null){ newProductVO.setIdProduct(req.getParameter("defineStatusProduct"));}
        if(req.getParameter("defineStatus")!= null){ newProductVO.setStatusProduct(req.getParameter("defineStatus"));}

        try{
            newProductDAO.activateProduct(newProductVO);
            System.out.println("Finalizando...");

            RequestDispatcher showUsers = req.getRequestDispatcher("views/product/listProducts.jsp");
            showUsers.forward(req, resp);

            System.out.println("La activación del producto fue exitosa.");
            System.out.println("------------------------------------------------------------------------");
        } catch(Exception x){
            System.out.println("(Servlet) Error al activar el producto: "+ x.getMessage().toString());
        }
    }

// BUSCAR UN PRODUCTO --------------------------------------------------------------------------------------------------------------------------
    private void searchOneProduct(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("Buscando producto...");
        if(req.getParameter("searchProductToEdit")!= null){ newProductVO.setIdProduct(req.getParameter("searchProductToEdit"));}

        try{
            List<ProductVO> arrayOneProduct = newProductDAO.listOneProduct(newProductVO);
            req.setAttribute("product", arrayOneProduct);

            System.out.println("Finalizando...");
            
            RequestDispatcher formToUpdateUser = req.getRequestDispatcher("views/product/updateProduct.jsp");
            formToUpdateUser.forward(req, resp);

            System.out.println("Se terminó de listar los datos del producto buscado.");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){
            System.out.println("(Servlet) Error al listar los datos del producto buscado: "+ e.getMessage().toString());
        }
    }






// VER DETALLES DE PRODUCTO - CLIENTE --------------------------------------------------------------------------------------------------------------------------
    private void viewProductDetails_Client(HttpServletRequest req, HttpServletResponse resp) {
        String dataForSearch = null;

        if(req.getParameter("idProductDetails_Client")!= null){ dataForSearch = req.getParameter("idProductDetails_Client"); }

        try{
            List<ProductVO> arrayOneProduct = newProductDAO.searchProductDetails(dataForSearch);
            req.setAttribute("oneProductList", arrayOneProduct);

            List<ProductVO> arrayProducts = newProductDAO.listsProducts();
            req.setAttribute("productsList", arrayProducts);

            System.out.println("Finalizando...");

            RequestDispatcher showProductsSearch = req.getRequestDispatcher("views/product/viewProductDetails_Client.jsp");
            showProductsSearch.forward(req, resp);

            System.out.println("Se terminó de buscar el producto.");
            System.out.println("------------------------------------------------------------------------");

        } catch(Exception x){
            System.out.println("(Servlet) Error al buscar el producto: "+ x.getMessage().toString());
        }
    }














    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'init'");
    }


// CARGAR LISTADO DE PRODUCTOS EN EL INDEX --------------------------------------------------------------------------------------------------------------------------
    @Override    
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        
        try{
            System.out.println("Inicializando...");
            List<ProductVO> arrayProduct = newProductDAO.listsProducts();
            req.setAttribute("productList", arrayProduct);
            System.out.println("Finalizando...");
        } catch(Exception e){
             System.out.println("(Servlet) Error al listar los productos: "+ e.getMessage().toString());
        } finally{
            System.out.println("Fin de la inicalización.");
            System.out.println("------------------------------------------------------------------------");
        }
            
        // TODO Auto-generated method stub
        chain.doFilter(req, resp);
    }
    
}
