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
    <title>Listar - Domicilios</title>

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
                <a href="delivery?navDelivery=listAllDeliveries" class="buttonNav b2_1 center">Actualizar Lista</a>
            </div>


            <main>
                <div class="title1"><h1>Domicilios</h1></div>

                <hr class="hr1">

                <div class="divTable">
                    <table class="table1 center">
                        <tr>
                            <td class="tableTitle">ID domicilio</td>
                            <td class="tableTitle">ID pedido</td>
                            <td class="tableTitle">Direccion</td>
                            <td class="tableTitle hideTable">detalles</td>
                            <td class="tableTitle hideTable">fecha de envio</td>
                            <td class="tableTitle">fecha de entrega</td>
                            <td class="tableTitle">Acciones</td>
                        </tr>
                        <c:forEach var="dom" items="${domicilioss}">
                            <tr>
                                <td class="tableContent">${dom.idDelivery}</td>
                                <td class="tableContent">${dom.idFKOrder}</td>
                                <td class="tableContent">${dom.address}</td>
                                <td class="tableContent hideTable">${dom.detailsDelivery}</td>
                                <td class="tableContent hideTable">${dom.shipmentDate}</td>
                                <td class="tableContent">${dom.deliveryDate}</td>
            
                                <td class="tableContent">
                                    <form action="delivery" method="post">
                                        <input type="hidden" name="searchDeliveryToEdit" value="${dom.idDelivery}">
                                        <button class="editButton" type="submit" name="formDelivery" value="searchOneDelivery">Editar Domicilio</button>
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