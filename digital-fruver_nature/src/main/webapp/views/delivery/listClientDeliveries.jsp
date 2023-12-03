
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
// Obtener los atributos de la sesión
    String username = (String) session.getAttribute("username");
    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
    String lastname = (String) session.getAttribute("lastname");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="./assets/img/logo.png">
    <title>Listar - Domicilios</title>

    <link rel="stylesheet" href="./assets/css/list.css">
    <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
</head>
<body>
    <% if (username != null && id != null && name != null && lastname != null) { %>
        <div class="container">
            <header>
                <nav class="clientNav">
                    <div class="navbarButtons">
                        <div><a class="navButton principalNavButton" href="product?navProduct=listProductsForClient">Inicio</a></div>
                        <div><a class="navButton" href="product?navProduct=listProductsForClient">Productos</a></div>
                        <form action="order" method="post">
                            <input type="text" name="listOrderClientID" value="<%= id %>" hidden>
                            <button class="navbarButtonForm" type="submit" name="formOrders" value="listOrderForClient">Mis Pedidos</button>
                        </form>
                        <div><a class="navButton specialNavButton" href="user?navUser=myProfile">Mi perfil</a></div>
                        <div><a class="navButton specialNavButton" href="user?navUser=logout">Cerrar sesión</a></div>
                    </div>
        
                    <div class="logoText"><h1>Digital-Fruver Nature</h1></div>
                    
                    <div class="headerLogo">
                        <img src="assets/img/logo.png">
                    </div>
                </nav>

                <!--Botón de barra de navegación desplegable-->
                <nav class="NavMovile">
                    <div id="burgerMenu"><i class="fa-solid fa-bars"></i></div>
                    <div class="logoText"><h1>Digital-Fruver Nature</h1></div>  
                    <div class="headerLogo">
                        <img src="assets/img/logo.png">
                    </div>
                </nav>
            </header>
            <div class="greenNavbarGreen"></div>
            <div class="greenNavbarGreen2">

                <form action="order" method="post"  class="formNav2">
                    <input type="text" name="listOrderClientID" value="<%= id %>" hidden>
                    <button class="navbarButtonForm buttonNav b2_3 center" type="submit" name="formOrders" value="listOrderForClient">Mis Pedidos</button>
                </form>
            </div>


            <main>
                <div class="title1"><h1>Domicilios</h1></div>

                <hr class="hr1">

                <div class="divTable">
                    <table class="table1 center">
                        <tr>
                            <td class="tableTitle">ID del pedido</td>
                            <td class="tableTitle hideTable">Direccion</td>
                            <td class="tableTitle hideTable">Fecha de envio</td>
                            <td class="tableTitle">Fecha de entrega</td>
                            <td class="tableTitle">Detalles</td>
                            <td class="tableTitle">Acciones</td>
                        </tr>
                        <c:forEach var="deli" items="${deliveries}">
                            <tr>
                                <td class="tableContent">${deli.idFKOrder}</td>
                                <td class="tableContent hideTable">${deli.address}</td>
                                <td class="tableContent hideTable">${deli.shipmentDate}</td>
                                <td class="tableContent">${deli.deliveryDate}</td>
                                <td class="tableContent">${deli.detailsDelivery}</td>
            
                                <td class="tableContent">
                                    <form action="user" method="post">
                                        <input type="hidden" name="searchUserToEdit" value="${deli.idDelivery}">
                                        <button class="editButton" type="submit" name="userForm" value="searchOneUser">Editar Domicilio</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                
            </main>


            <!--Ventana modal, Barra de bavegación lateral-->
            <div class="lateralNabvarModalWindow" id="lateralNabvarModalWindow">
                <div class="lateralNavbarModalContent">
                    <div id="closeLateralNavbar"><i class="fa-solid fa-xmark"></i></div>
                    <div class="lateralNabvarButtons">
                        <div><a class="navButton principalNavButton" href="product?navProduct=listProductsForClient">Inicio</a></div>
                        <div><a class="navButton" href="product?navProduct=listProductsForClient">Productos</a></div>
                        <form action="order" method="post">
                            <input type="text" name="listOrderClientID" value="<%= id %>" hidden>
                            <button class="navbarButtonForm" type="submit" name="formOrders" value="listOrderForClient">Mis Pedidos</button>
                        </form>
                        <div><a class="navButton specialNavButton" href="user?navUser=myProfile">Mi perfil</a></div>
                        <div><a class="navButton specialNavButton" href="user?navUser=logout">Cerrar sesión</a></div>
                    </div>
                </div>
            </div>

            <footer>
                <div class="footerButton"><a href="./#">Sobre nosotros</a></div>

                <div class="footerLogoText"><h3>Digital-Fruver Nature</h3></div>
                
                <div class="footerLogo">
                    <img src="assets/img/logo.png">
                </div>
            </footer>
        </div>

    <% } else { %>

        <!--ERROR EN EL INICIO DE SESION-->
            <div class="notLogedSession">
                <div><h1>Acceso a funciones denegado. Inicia sesión para continuar.</h1></div>
                <div class="notLogedSessionButton"><a href="user?navUser=login">Iniciar sesión</a></div>
            </div>
     <% } %> 
    
    <script src="./assets/js/indexStaff.js"></script>
</body>
</html>