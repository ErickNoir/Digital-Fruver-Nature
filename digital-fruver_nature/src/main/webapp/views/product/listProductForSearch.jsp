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
    <title>Listar - </title>

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
                    <a href="product?navProduct=listProducts" class="buttonNav b2_1 center">Actualizar Lista</a>

                <a href="product?navProduct=registProduct" class="buttonNav b2_2">Registrar Producto</a>
    
                <form action="product" method="post" class="formNav2">
                    <label class="label1">Buscar producto por...</label>
                    <select name="searchFor" class="label1">
                        <option value="idProducto">ID</option>
                        <option value="nombreProducto">Nombre</option>
                        <option value="precioProducto">Precio</option>
                        <option value="disponibilidadPoducto">Disponibilidad</option>
                        <option value="idFKEmpaque">Empaque</option>
                        <option value="suspendidoProducto">Estado</option>
                    </select>
            
                    <input type="text" name="searchData" class="input2">
            
                    <button type="submit" name="productForm" value="searchProductFor" class="buttonNav b2_3">Buscar</button>
                </form>
            </div>


            <main>
                <div class="title1"><h1>Productos</h1></div>

                <hr class="hr1">

                <div class="divTable">
                    <table class="table1 center">
                        <tr>
                            <td class="tableTitle">ID</td>
                            <td class="tableTitle">Imagen</td>
                            <td class="tableTitle">Nombre</td>
                            <td class="tableTitle hideTable">Precio</td>
                            <td class="tableTitle hideTable">Disponibilidad</td>
                            <td class="tableTitle">Estado</td>
                            <td class="tableTitle">Acciones</td>
                        </tr>
                <c:forEach var="prod" items="${product}">
                        <tr>
                            <td class="tableContent">${prod.idProduct}</td>
                            <td class="tableContent"><img src="productimg?id=${prod.idProduct}" width=100px height=100px></td>
                            <td class="tableContent">${prod.nameProduct}</td>
                            <td class="tableContent hideTable">${prod.priceProduct}</td>
                            <td class="tableContent hideTable">${prod.availabilityProduct}</td>
                            <td class="tableContent">
                                <c:choose>
                                    <c:when test="${prod.statusProduct eq 'Disponible'}">
    
                                    <form action="product" method="post">
                                        <input type="hidden" name="defineStatusProduct" value="${prod.idProduct}">
                                        <input type="hidden" name="defineStatus" value="Suspendido">
                                        <button class="stateButtonOff" type="submit" name="productForm" value="inactivateProduct">Suspender</button>
                                    </form>
    
                                    </c:when>
                                    <c:otherwise>
    
                                    <form action="product" method="post">
                                        <input type="hidden" name="defineStatusProduct" value="${prod.idProduct}">
                                        <input type="hidden" name="defineStatus" value="Disponible">
                                        <button class="stateButtonOn" type="submit" name="productForm" value="activateProduct">Habilitar</button>
                                    </form>
    
                                    </c:otherwise>
                                </c:choose>
                            </td>    
        
                            <td class="tableContent">
                                <form action="product" method="post">
                                    <input type="hidden" name="searchProductToEdit" value="${prod.idProduct}">
                                    <button class="editButton" type="submit" name="productForm" value="searchOneProduct">Editar producto</button>
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