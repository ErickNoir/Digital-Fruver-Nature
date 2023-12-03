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
    <title>Actualizar usuario</title>
    <link rel="stylesheet" href="./assets/css/updateUser.css">
</head>
<body>
    <% if (username != null && id != null) { %>
    <div class="container">
        <div class="banner"><img src="./assets/img/registerImage.jpg" class="banner"></div>
        <header>
            <div><img src="./assets/img/logo.png"></div>
            <h3>Ditital-Fruver Nature</h3>
            <h1>Actualizar</h1>
        </header>
        <main>
            <c:forEach var="usu" items="${user}">
                <form action="user" method="post" id="updateUserForm">

                    <input type="number" name="updateIDUser" value="${usu.idUser}" hidden>

                    <div>
                        <div>
                            <label>Nombre: </label>
                            <input type="text" name="updateNameUser" id="updateNameUser" value="${usu.nameUser}">
                        </div>
                    
                        <div>
                            <label>Apellido: </label>
                            <input type="text" name="updateLastnameUser" id="updateLastnameUser" value="${usu.lastNameUser}">
                        </div>
        
                        <div>
                            <label>E-mail: </label>
                            <input type="email" name="updateEmailUser" id="updateEmailUser" value="${usu.emailUser}">
                        </div>
        
                        <div>
                            <label>Telefono: </label>
                            <input type="number" name="updatePhoneUser" id="updatePhoneUser" value="${usu.celphoneUser}">
                        </div>
        
                        <div>
                            <label>Tipo de Documento: </label>
                            <c:choose>
                                <c:when test="${usu.typeDocumentUser eq 'C.C.'}">
                                    <select name="updateTypeDocUser" id="updateTypeDocUser">
                                        <option value="C.C.">Cédula de ciudadania</option>
                                        <option value="C.E.">Cédula de extrangería</option>
                                        <option value="P.B.">Pasaporte</option>
                                        <option value="R.C.">Registro civil</option>
                                    </select>
                                </c:when>

                                <c:when test="${usu.typeDocumentUser eq 'C.E.'}">
                                    <select name="updateTypeDocUser" id="updateTypeDocUser">
                                        <option value="C.E.">Cédula de extrangería</option>
                                        <option value="C.C.">Cédula de ciudadania</option>
                                        <option value="P.B.">Pasaporte</option>
                                        <option value="R.C.">Registro civil</option>
                                    </select>
                                </c:when>

                                <c:when test="${usu.typeDocumentUser eq 'P.B.'}">
                                    <select name="updateTypeDocUser" id="updateTypeDocUser">
                                        <option value="P.B.">Pasaporte</option>
                                        <option value="C.C.">Cédula de ciudadania</option>
                                        <option value="C.E.">Cédula de extrangería</option>
                                        <option value="R.C.">Registro civil</option>
                                    </select>
                                </c:when>

                                <c:when test="${usu.typeDocumentUser eq 'R.C.'}">
                                    <select name="updateTypeDocUser" id="updateTypeDocUser">
                                        <option value="R.C.">Registro civil</option>
                                        <option value="C.C.">Cédula de ciudadania</option>
                                        <option value="C.E.">Cédula de extrangería</option>
                                        <option value="P.B.">Pasaporte</option>
                                    </select>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    
                    <div>
                        <div>
                            <label>Número de documento: </label>
                            <input type="number" name="updateDocumentUser" id="updateDocumentUser" value="${usu.documentNumberUser}">
                        </div>
        
                        <div>
                            <label>Nombre de usuario: </label>
                            <input type="text" name="updateUserUser" id="updateUserUser" value="${usu.usernameUser}">
                        </div>
        
                        <div>
                            <label>Contraseña: </label>
                            <input type="password" name="updatePasswordUser" id="updatePasswordUser" minlength="8" value="${usu.passwordUser}" minlength="8">
                        </div>

                        <div>
                            <label>Tipo de Usuario: </label>
                            <c:choose>
                                <c:when test="${usu.idfkRolUser eq '1'}">
                                    <select name="updateTypeUser" id="updateTypeUser">
                                        <option value="1">Administrador</option>
                                        <option value="3">Cliente</option>
                                        <option value="2">Empleado</option>
                                    </select>
                                </c:when>

                                <c:when test="${usu.idfkRolUser eq '2'}">
                                    <select name="updateTypeUser" id="updateTypeUser">
                                        <option value="2">Empleado</option>
                                        <option value="3">Cliente</option>
                                        <option value="1">Administrador</option>
                                    </select>
                                </c:when>

                                <c:when test="${usu.idfkRolUser eq '3'}">
                                    <select name="updateTypeUser" id="updateTypeUser">
                                        <option value="3">Cliente</option>
                                        <option value="2">Empleado</option>
                                        <option value="1">Administrador</option>
                                    </select>
                                </c:when>
                            </c:choose>
                        </div>

                        <div>
                            <label>Estado: </label>
                            <c:choose>
                                <c:when test="${usu.stateUser eq 'Activo'}">
                                    <select name="updateStateUser" id="updateStateUser">
                                        <option value="Activo">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </select>
                                </c:when>

                                <c:when test="${usu.stateUser eq 'Inactivo'}">
                                    <select name="updateStateUser" id="updateStateUser">
                                        <option value="Inactivo">Inactivo</option>
                                        <option value="Activo">Activo</option>
                                    </select>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>

                    <input type="hidden" name="userFormValue" id="updateUserValue" value="">
                    
                    <div class="buttonForm">
                        <button type="submit" name="userForm" id="updateUserValueForm" value="updateUser">Actualizar</button>
                    </div>
                </form>

                <a class="cancelButton" href="user?navUser=listUsers">Cancelar</a>

            </c:forEach>
        </main>
               
    </div>

    <% } else { %>

        <!--ERROR EN EL INICIO DE SESION-->
            <div class="notLogedSession">
                <div><h1>Acceso a funciones denegado. Inicia sesión para continuar.</h1></div>
                <div class="notLogedSessionButton"><a href="user?navUser=login">Iniciar sesión</a></div>
            </div>
     <% } %> 

    <script src="./assets/js/updateUser.js"></script>
</body>
</html>