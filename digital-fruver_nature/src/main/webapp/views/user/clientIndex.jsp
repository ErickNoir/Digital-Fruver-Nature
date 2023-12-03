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
    <title>Digital-Fruver <%= username %></title>

    <link rel="stylesheet" href="./assets/css/indexClient.css">
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

            <div class="carousel">
                <img src="./assets/img/banner.jpg">
                <div class="texImgCarousel1"><h2>¡Bienvenido, <%= name %>  <%= lastname %>! ¿Qué deseas comprar hoy?</h2></div>
            </div>


            <main>
                <div class="productsSection">
                    <h2 id="productos">Productos</h2>
                    <hr>
                    <div class="cardsContainer">

                <c:forEach var="prod" items="${productList}">
                    <c:choose>
                    <c:when test="${prod.statusProduct eq 'Disponible'}">
                        <div class="card">
                            <h3>${prod.nameProduct}</h3>
                            <img src="productimg?id=${prod.idProduct}">
                            <h3 class="cardPrice">$ ${prod.priceProduct}</h3>
        
                            <form action="product" method="POST">
                                <input type="text" name="idProductDetails_Client" value="${prod.idProduct}" hidden>
                                <button class="cardButton" type="submit" name="productForm" value="viewProductDetails_Client">Ver producto</button>
                            </form>
                        </div> 
                    </c:when>
                    <c:otherwise></c:otherwise>
                    </c:choose>
                </c:forEach>
                        
                        <!--Mas productos debajo...-->
                        
                        <!--////-->
                    </div>
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
        <div class="notLogedSession">
            <div><h1>Acceso a funciones denegado. Inicia sesión para continuar.</h1></div>
            <div class="notLogedSessionButton"><a href="user?navUser=login">Iniciar sesión</a></div>
        </div>
    <% } %>
    
    <script src="./assets/js/indexClient.js"></script>
</body>
</html>