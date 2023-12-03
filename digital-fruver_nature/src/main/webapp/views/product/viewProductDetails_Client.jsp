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
    <title>Productos - #</title>

    <link rel="stylesheet" href="./assets/css/viewProductDetails_Client.css">
    <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
</head>

<body>
    <% if (username != null && id != null) { %>
    <div class="container">
        <nav class="navbar">
            <div class="burgerButton" id="burgerMenu">
                <i class="fa-solid fa-bars"></i>
            </div>

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
            <div class="logoText">
                <h1>Digital-Fruver Nature</h1>
            </div>

            <div class="headerLogo">
                <img src="assets/img/logo.png">
            </div>
        </nav>




        <!--Ventana modal, Barra de bavegación lateral-->
    <div class="lateralNabvarModalWindow" id="lateralNabvarModalWindow">
        <div class="lateralNavbarModalContent">
            <div id="closeLateralNavbar"><i class="fa-solid fa-xmark"></i></div>

            <!--Navbar lateral para el CLIENTE-->
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
    <div class="navbar2"></div>




    <c:forEach var="prod" items="${oneProductList}">
        <div class="productDetails">
            <div class="productTitle">
                <h2>${prod.nameProduct}</h2>
                <hr>
            </div>

            <div class="description">
                <p>${prod.descriptionProduct}</p>
            </div>

            <div class="producPrice">
                <h3>Precio: $ <b class="price" id="totalProductPrice">${prod.priceProduct}</b> x L</h3>
            </div>

            <div class="productImage">
                <img src="productimg?id=${prod.idProduct}">
            </div>

            <div class="buttonProduct button1" id="openViewMoreProductInfo"><i class="fa-solid fa-circle-info"></i>
            </div>
            <div class="buttonProduct button2" id="openBuyProduct"><i class="fa-solid fa-cart-shopping"></i></div>
        </div>

        <!--Modal para ver detalles de producto-->
        <div id="modalInfoProduct" class="modalInfoProduct">
            <div id="modalInfoProductContent" class="modalInfoProductContent">
                <div class="closeModal" id="closeViewMoreProductInfo"><i class="fa-solid fa-x"></i></div>
                <br>
                <p class="details">
                    ${prod.descriptionProduct}
                </p>
            </div>
        </div>

        <!--Modal para comprar producto-->
        <div id="modalBuyProduct" class="modalBuyProduct">
            <div id="modalBuyProductContent" class="modalBuyProductContent">
                <div class="closeModal" id="closeBuyProduct"><i class="fa-solid fa-x"></i></div>
                <br>
                <form action="order" method="post" id="makeOrderProduct">
                    <input type="text" value="${prod.idProduct}" name="idProductOrder" hidden>
                    <input type="number" value="<%= id %>" name="idUserOrder" hidden>

                    <label for="">Fecha para entregar el pedido:</label>
                    <input type="datetime-local" name="dateForOrder" id="dateForOrder">

                    <br><br><label for="">Cantidad en libras del producto</label>
                    <input type="number" name="quantityOrder" id="quantityOrder">

                    <br><br><label for="">¿Entrega por domicilio?</label>
                    <select name="ifDeliveryOrder" id="select1">
                        <option value="3">Seleccionar opción</option>
                        <option value="1">Sí, quiero entrega por domicilio</option>
                        <option value="0">No, lo reclamaré en punto físico</option>
                    </select>

                    <br>
                    <div id="adressInput" style="display: none;">
                        <label for="address">Dirección de entrega:</label>
                        <input type="text" id="address" name="address">
                    </div>

                    <br><label for="">Detalles del pedido</label>
                    <textarea name="orderDetails" cols="10" rows="5" placeholder="Aquí puedes agregar información relevante extra sobre tu pedido, como empaque, persona que recoge el pedido, etc."></textarea>

                    <br><br><label for="">Total:</label>
                    <input type="number" name="totalOrder" id="totalOrder" value="00" readonly>

                    <br>
                    <input type="hidden" name="formOrdersValue" id="formOrdersValue" value="">

                    <br><button class="formProductButton" type="submit" name="formOrders" id="formMakeOrders" value="registNewOrder">Hacer pedido</button>
                </form>
            </div>
        </div>
    </c:forEach>



        <div class="otherProducts">
            <div class="otherProductsTitle">
                <h3>Más de nuestros productos</h3>
                <hr>
            </div>

            <div class="otherProductsBody">
                <div class="cardsContainer">
            <c:forEach var="oProd" items="${productsList}">
                <c:choose>
                <c:when test="${oProd.statusProduct eq 'Disponible'}">
                    <div class="card">
                        <div class="cardTitle">
                            <p>${oProd.nameProduct}</p>
                        </div>
                        <div class="cardImage"><img src="productimg?id=${oProd.idProduct}"></div>
                        <div class="cardPrice">
                            <p>$ ${oProd.priceProduct} x L</p>
                        </div>
                        <form action="product" method="POST" class="cardButton">
                            <input type="text" name="idProductDetails_Client" value="${oProd.idProduct}" hidden>
                            <button class="cardButton" type="submit" name="productForm"value="viewProductDetails_Client">Ver producto</button>
                        </form>
                    </div>
                </c:when>
                <c:otherwise></c:otherwise>
                </c:choose>
            </c:forEach>  
                </div>
            </div>

        </div>

        <footer class="footer">
            <a class="buttonFoot center">Nosotros</a>
            <div class="footerTextLogo">
                <h3>Digital-Fruver Nature</h3>
            </div>
            <div class="footerLogo"><img src="assets/img/logo.png"></div>
        </footer>


        <% } else { %>
            <div class="notLogedSession">
                <div><h1>Acceso a funciones denegado. Inicia sesión para continuar.</h1></div>
                <div class="notLogedSessionButton"><a href="user?navUser=login">Iniciar sesión</a></div>
            </div>
        <% } %>
    </div>

    <script src="./assets/js/viewProductDetails_Client.js"></script>
</body>

</html>


































  