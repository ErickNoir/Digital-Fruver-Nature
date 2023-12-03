<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
// Obtener los atributos de la sesión
    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
    String lastname = (String) session.getAttribute("lastname");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    String typeDoc = (String) session.getAttribute("typeDoc");
    String document = (String) session.getAttribute("document");
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
    String status = (String) session.getAttribute("status");
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./assets/img/logo.png">
    <title><%= username %></title>
    <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./assets/css/myProfile.css">
</head>
<body>
    <div class="container">

        <% if(username != null && id != null && name != null && lastname != null) { %>
        <header>
            <% if("3".equals(role)){ %>
               <!--Navbar para el CLIENTE-->
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
            <%
                } else if("2".equals(role)){
            %>
                <!--Navbar para el EMPLEADO-->
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
            <%
                } else if("1".equals(role)){
            %>
                 <!--Navbar para el ADMINISTRADOR-->
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
            <%
                } else {
            %>
                    <!--Navbar para el ERROR-->
                    <nav class="errorNav">
                        <h1>Error al evaluar el rol del usuario.</h1>
                    </nav>
            <%
                } 
            %>

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
            <div class="profileSection">
                <div>
                    <h2>Perfil</h2>
                    <h2><%= username %></h2>
                </div>

                <div>
                    <p><b>Nombre completo:</b></p>
                    <p><%= name%> <%= lastname %></p>
                </div>

                <div>
                    <p><b>Documento de identidad: </b></p>
                    <p><%= typeDoc %> <%= document %></p>
                </div>

                <div>
                    <p><b>Email: </b></p>
                    <p><%= email %></p>
                </div>

                <div>
                    <p><b>Teléfono: </b></p>
                    <p><%= phone %></p>
                </div>

                <div>
                    <p><b>Usuario: </b></p>
                    <p><%= username %></p>
                </div>

                <div>
                    <p><b>Estado: </b></p>
                    <p><%= status %></p>
                </div>

                <button id="openUpdateProfileModal">Editar perfil</button>
                <button id="openProfileStatusModal">Inactivar mi cuenta</button>
            </div>
        </main>

            <!--Ventana modal, Barra de bavegación lateral-->
            <div class="lateralNabvarModalWindow" id="lateralNabvarModalWindow">
                <div class="lateralNavbarModalContent">
                    <div id="closeLateralNavbar"><i class="fa-solid fa-xmark"></i></div>

                <% if("3".equals(role)){ %>
                    <div class="lateralNabvarButtons">
                        <div><a class="navButton principalNavButton" href="./views/user/clientIndex.jsp">Inicio</a></div>
                        <div><a class="navButton" href="./views/user/clientIndex.jsp">Productos</a></div>
                        <form action="order" method="post">
                            <input type="text" name="listOrderClientID" value="<%= id %>" hidden>
                            <button class="navbarButtonForm" type="submit" name="formOrders" value="listOrderForClient">Mis Pedidos</button>
                        </form>
                        <div><a class="navButton specialNavButton" href="user?navUser=myProfile">Mi perfil</a></div>
                        <div><a class="navButton specialNavButton" href="user?navUser=logout">Cerrar sesión</a></div>
                    </div>
                    
                <%
                    } else if("2".equals(role)){
                 %>
                    <!--Navbar lateral para el EMPLEADO-->
                    <div class="lateralNabvarButtons">
                        <div><a class="navButton principalNavButton" href="user?navUser=indexStaff">Inicio</a></div>
                        <div><a class="navButton specialNavButton" href="user?navUser=myProfile">Mi perfil</a></div>
                        <div><a class="navButton specialNavButton" href="user?navUser=logout">Cerrar sesión</a></div>
                    </div>
                    
                <%
                    } else {
                %>
                    <!--Navbar lateral para el ADMINISTRADOR-->
                    <div class="lateralNabvarButtons">
                        <div><a class="navButton principalNavButton" href="user?navUser=indexStaff">Inicio</a></div>
                        <div><a class="navButton specialNavButton" href="user?navUser=myProfile">Mi perfil</a></div>
                        <div><a class="navButton specialNavButton" href="user?navUser=logout">Cerrar sesión</a></div>
                    </div>
                <%
                    } 
                %>
                </div>
            </div>
            

            <!--Ventana modal, advertencia para inactivar perfil-->
            <div class="profileStatusModalWindow" id="profileStatusModalWindow">
                <div class="profileStatusModalContent">
                    <h3>¿Está seguro?</h3>
                    <p>Si inactiva su cuenta no podrá volver a inciar sesión ni activarla nuevamente por su cuenta.</p>
                    <p>Si desea volver a activar posteriormente su cuenta, deberá contactarse con nosotros.</p>
                    <form action="user" method="post">
                        <input type="number" value="<%= id %>" hidden name="idUpdateProfileStatus">
                        <button name="userForm" value="updateProfileStatus" id="statusProfile" type="submit">Sí, quiero inactivar mi cuenta</button>
                    </form>
                    <button id="closeModalWindowSatusProfile">Cancelar</button>
                </div>
            </div>


                <!--Ventana modal, formulario para actualizar perfil-->
                <div class="modalWindowUpdateProfile" id="modalWindowUpdateProfile">
                    <div class="modalContentUpdateProfile">
                        <h3>Actualizar información</h3>
                        <form action="user" method="post" id="updateProfileForm">
                            <input type="number" name="idUpdateProfile" value="<%= id %>" hidden>
                            <input type="number" name="roleUpdateProfile" value="<%= role %>" hidden>

                            <div>
                                <label>Nombre</label>
                                <input type="text" name="nameUpdateProfile" id="nameUpdateProfile" value="<%= name %>">
                            </div>

                            <div>
                                <label for="">Apellido</label>
                                <input type="text" name="lastnameUpdateProfile" id="lastnameUpdateProfile" value="<%= lastname %>">
                            </div>
                            
                            <div>
                                <label for="">Email</label>
                                <input type="email" name="emailUpdateProfile" id="emailUpdateProfile" value="<%= email %>">
                            </div>

                            <div>
                                <label for="">Telefono</label>
                                <input type="text" name="phoneUpdateProfile" id="phoneUpdateProfile" value="<%= phone %>">
                            </div>

                            <div>
                                <label for="">Tipo de documento</label>
                                <% if ("C.C.".equals(typeDoc)) { %>
                                    <select name="typeDocUpdateProfile" id="typeDocUpdateProfile">
                                        <option value="C.C.">Cédila de ciudadanía</option>
                                        <option value="C.E.">Cédila de extrangería</option>
                                        <option value="P.B.">Pasaporte</option>
                                        <option value="R.C.">Registro civil</option>
                                    </select>
                                <% } else if ("C.E.".equals(typeDoc)) { %>
                                    <select name="typeDocUpdateProfile">
                                        <option value="C.E.">Cédila de extrangería</option>
                                        <option value="C.C.">Cédila de ciudadanía</option>
                                        <option value="P.B.">Pasaporte</option>
                                        <option value="R.C.">Registro civil</option>
                                    </select>
                                <% } else if ("P.B.".equals(typeDoc)) { %>
                                    <select name="typeDocUpdateProfile">
                                        <option value="P.B.">Pasaporte</option>
                                        <option value="C.C.">Cédila de ciudadanía</option>
                                        <option value="C.E.">Cédila de extrangería</option>
                                        <option value="R.C.">Registro civil</option>
                                    </select>
                                <% } else if ("R.C.".equals(typeDoc)) { %>
                                    <select name="typeDocUpdateProfile">
                                        <option value="R.C.">Registro civil</option>
                                        <option value="C.C.">Cédila de ciudadanía</option>
                                        <option value="C.E.">Cédila de extrangería</option>
                                        <option value="P.B.">Pasaporte</option>
                                    </select>
                                <% } %>
                            </div>

                            <div>
                                <label for="">Número de documento</label>
                                <input type="number" name="documentUpdateProfile" id="documentUpdateProfile" value="<%= document %>">
                            </div>

                            <div>
                                <label for="">Nombre de usuario</label>
                                <input type="text" name="usernameUpdateProfile" id="usernameUpdateProfile" value="<%= username %>">
                            </div>

                            <div>
                                <label for="">Contraseña</label>
                                <input type="password" name="passwordUpdateProfile" id="passwordUpdateProfile" value="<%= password %>">
                            </div>

                            <div>
                                <label for="">Confirmar contraseña</label>
                                <input type="password" name="password2UpdateProfile" id="password2UpdateProfile" value="<%= password %>">
                            </div>

                            <input type="hidden" name="userFormValue" id="updateProfileValue" value="">

                            <button type="submit" name="userForm" value="updateProfile" id="updateProfileFormValue" class="updateProfileButton">Actualizar</button>
                        </form>
                        <button id="closeUpdateProfileModal">Cancelar</button>
                    </div>
                </div>

        <footer>
            <div class="footerButton"><a href="./#">Sobre nosotros</a></div>

            <div class="footerLogoText"><h3>Digital-Fruver Nature</h3></div>
            
            <div class="footerLogo">
                <img src="assets/img/logo.png">
            </div>
        </footer>

        <% } else { %>
            <div class="notLogedSession">
                <div><h1>Acceso a funciones denegado. Inicia sesión para continuar.</h1></div>
                <div class="notLogedSessionButton"><a href="user?navUser=login">Iniciar sesión</a></div>
            </div>
        <% } %>
    </div>

    <script src="./assets/js/myProfile.js"></script>
</body>
</html>