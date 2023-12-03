<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
// Obtener los atributos de la sesión
    String username = (String) session.getAttribute("username");
    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
    String lastname = (String) session.getAttribute("lastname");
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="./assets/img/logo.png">

    <% if("1".equals(role)){ %>
        <title>Administración</title>
    <%  } else if("2".equals(role)){ %>
        <title>Area de trabajo</title>
    <% } else { %>
        <title>Error</title>
    <% } %>  
    <link rel="stylesheet" href="./assets/css/indexStaff.css">
    <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
</head>
<body> 
    <% if (username != null && id != null) { %>
        <% if("1".equals(role)){ %>
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
                            <img src="./assets/img/logo.png">
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



                <main>
                    <div class="pcDiv1">
                        <img src="./assets/img/GearsFruit.jpg">

                        <h2 class="welcome">Bienvenido, administrador <%= name%> <%= lastname %>, ¿qué desea hacer hoy?</h2>
                    </div>
                    
                    <div class="pcDiv2">
                        <div>
                            <h2>Acciones generales</h2>
                            <hr>
                        </div>
                        
                        <div class="actionButtons">
                            <a href="user?navUser=listUsers">Gestionar Usuarios</a>
                            <a href="product?navProduct=listProducts">Gestionar Productos</a>
                            <a href="order?navOrders=listAllOrders">Gestionar Pedidos</a>
                            <a href="delivery?navDelivery=listAllDeliveries">Gestionar Domicilios</a>
                        </div>
                        
                    </div>
                    

                </main>

                <!--Ventana modal, Barra de bavegación lateral-->
                    <div class="lateralNabvarModalWindow" id="lateralNabvarModalWindow">
                        <div class="lateralNavbarModalContent">
                            <div id="closeLateralNavbar"><i class="fa-solid fa-xmark"></i></div>
                            <div class="lateralNabvarButtons">
                                <div><a class="navButton principalNavButton" href="user?navUser=indexStaff">Inicio</a></div>
                                <div><a class="navButton specialNavButton" href="user?navUser=myProfile">Mi perfil</a></div>
                                <div><a class="navButton specialNavButton" href="user?navUser=logout">Cerrar sesión</a></div>
                            </div>
                        </div>
                    </div>


                <footer>
                    <div class="footerButton"><a href="./#">Sobre nosotros</a></div>

                    <div class="footerLogoText"><h3>Digital-Fruver Nature</h3></div>
                    
                    <div class="footerLogo">
                        <img src="./assets/img/logo.png">
                    </div>
                </footer>
            </div>
        <%  } else if("2".equals(role)){ %>
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
        
        
        
                <main>
                    <div class="pcDiv1">
                        <img src="./assets/img/GearsFruit.jpg">
        
                        <h2 class="welcome">Bienvenido, empleado <%= name%> <%= lastname %>, ¿qué desea hacer hoy?</h2>
                    </div>
                    
                    <div class="pcDiv2">
                        <div>
                            <h2>Acciones generales</h2>
                            <hr>
                        </div>
                        
                        <div class="actionButtons">
                            <a href="order?navOrders=listAllOrders">Gestionar Pedidos</a>
                            <a href="">Gestionar Domicilios</a>
                        </div>                
                    </div>
                    
        
                </main>
        
                <!--Ventana modal, Barra de bavegación lateral-->
                    <div class="lateralNabvarModalWindow" id="lateralNabvarModalWindow">
                        <div class="lateralNavbarModalContent">
                            <div id="closeLateralNavbar"><i class="fa-solid fa-xmark"></i></div>
                            <div class="lateralNabvarButtons">
                                <div><a class="navButton principalNavButton" href="user?navUser=indexStaff">Inicio</a></div>
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