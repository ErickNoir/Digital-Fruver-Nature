<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
// Obtener los atributos de la sesión
    String username = (String) session.getAttribute("username");
    String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="./assets/img/logo.png">
    <title>Listar - Pedidos</title>

    <link rel="stylesheet" href="./assets/css/list.css">
    <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
</head>
<body>
    <% if (username != null && id != null) { %>
        <div class="container">
            <header>
                <nav class="clientNav">
                    <div class="navbarButtons">
                        <div><a class="navButton principalNavButton" href="user?navUser=indexStaff">Inicio</a></div>
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
                <a href="order?navOrders=listAllOrders" class="buttonNav b2_1 center">Actualizar Lista</a>
            </div>


            <main>
                <div class="title1"><h1>Pedidos</h1></div>

                <hr class="hr1">

                <div class="divTable">
                    <table class="table1 center">
                        <tr>
                            <td class="tableTitle">ID</td>
                            <td class="tableTitle">ID cliente</td>
                            <td class="tableTitle">ID producto</td>
                            <td class="tableTitle hideTable">Cantidad</td>
                            <td class="tableTitle hideTable">Fecha del pedido</td>   
                            <td class="tableTitle hideTable">Fecha de entrega</td>
                            <td class="tableTitle">Total</td>
                            <td class="tableTitle hideTable">Detalles</td>
                            <td class="tableTitle">Domicilio</td>
                            <td class="tableTitle">Acciones</td>
                        </tr>
                
                        <c:forEach var="theOr" items="${allOrdersADM}">
                            <tr>
                                <td class="tableContent">${theOr.idOrder}</td>
                                <td class="tableContent">${theOr.fkIdUser}</td>
                                <td class="tableContent">${theOr.fkIdproduct}</td>
                                <td class="tableContent hideTable">${theOr.quantityOrder}</td>
                                <td class="tableContent hideTable">${theOr.orderDate}</td>
                                <td class="tableContent hideTable">${theOr.orderDeliveryDate}</td>
                                <td class="tableContent">$ ${theOr.totalOrder}</td>
                                <td class="tableContent hideTable">${theOr.detailsOrder}</td>
                                <td class="tableContent">
                                    <c:choose>
                                        <c:when test="${theOr.trueFalseDelivery eq '1'}">
                                            Sí
                                        </c:when>
                                        <c:otherwise>
                                            No
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="tableContent">
                                    <form action="order" method="post">
                                        <input type="hidden" name="searchOrderToEdit" value="${theOr.idOrder}">
                                        <button class="editButton" type="submit" name="formOrders" value="searchOneOrder">Editar pedido</button>
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
                        <div><a class="navButton principalNavButton" href="user?navUser=indexAdmin">Inicio</a></div>
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