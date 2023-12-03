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
    <title>Listar - Usuarios</title>

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
                <a href="user?navUser=listUsers" class="buttonNav b2_1 center">Actualizar Lista</a>

                <button class="buttonNav b2_2">Registrar Usuario</button>
    
                <form action="user" method="post"  class="formNav2">
                    <label class="label1">Buscar usuario por...</label>
                    <select name="searchFor" class="label1">
                        <option value="idUsuario">ID</option>
                        <option value="nombreUsuario">Nombre</option>
                        <option value="apellidoUsuario">Apellido</option>
                        <option value="emailUsuario">E-mail</option>
                        <option value="telefonoUsuario">Telefono</option>
                        <option value="usernameUsuario">Usuario</option>
                        <option value="estadoUsuario">Estado</option>
                        <option value="tipoDocUsuario">Tipo de documento</option>
                        <option value="documentoUsuario">Número de documento</option>
                        <option value="idFKRol">Rol</option>
                    </select>
            
                    <input type="text" name="searchData" class="input2">
            
                    <button type="submit" name="userForm" value="searchUserFor" class="buttonNav b2_3">Buscar</button>
                </form>
            </div>


            <main>
                <div class="title1"><h1>Usuarios</h1></div>

                <hr class="hr1">

                <div class="divTable">
                    <table class="table1 center">
                        <tr>
                            <td class="tableTitle">ID</td>
                            <td class="tableTitle">Nombre</td>
                            <td class="tableTitle">Apellido</td>
                            <td class="tableTitle hideTable">E-mail</td>
                            <td class="tableTitle hideTable">Telefono</td>
                            <td class="tableTitle">Usuario</td>
                            <td class="tableTitle">Definir estado</td>
                            <td class="tableTitle">Acciones</td>
                        </tr>
                        <c:forEach var="usu" items="${user}">
                            <tr>
                                <td class="tableContent">${usu.idUser}</td>
                                <td class="tableContent">${usu.nameUser}</td>
                                <td class="tableContent">${usu.lastNameUser}</td>
                                <td class="tableContent hideTable">${usu.emailUser}</td>
                                <td class="tableContent hideTable">${usu.celphoneUser}</td>
                                <td class="tableContent">${usu.usernameUser}</td>
                                <td class="tableContent">
                                    <c:choose>
                                        <c:when test="${usu.stateUser eq 'Activo'}">
                
                                                <form action="user" method="post">
                                                    <input type="hidden" name="defineStatusUser" value="${usu.idUser}">
                                                    <input type="hidden" name="defineStatus" value="Inactivo">
                                                    <button class="stateButtonOff" type="submit" name="userForm" value="inactivateUser">Inactivar</button>
                                                </form>
                
                                        </c:when>
                                        <c:otherwise>
                
                                                <form action="user" method="post">
                                                    <input type="hidden" name="defineStatusUser" value="${usu.idUser}">
                                                    <input type="hidden" name="defineStatus" value="Activo">
                                                    <button class="stateButtonOn" type="submit" name="userForm" value="activateUser">Activar</button>
                                                </form>
                
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                
                                <td class="tableContent">
                                    <form action="user" method="post">
                                        <input type="hidden" name="searchUserToEdit" value="${usu.idUser}">
                                        <button class="editButton" type="submit" name="userForm" value="searchOneUser">Editar usuario</button>
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