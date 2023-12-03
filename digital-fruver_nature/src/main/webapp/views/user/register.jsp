<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>

    <link rel="stylesheet" href="./assets/css/register.css">
</head>
<body>
    <div class="container">
        <div class="banner"><img src="./assets/img/registerImage.jpg" class="banner"></div>
        <header>
            <div><img src="./assets/img/logo.png"></div>
            <h3>Ditital-Fruver Nature</h3>
            <h1>Registrarse</h1>
        </header>
        <main>
            <form action="user" method="post" id="registerForm" id="registerForm">
                <div>
                    <div>
                        <label>Nombre: </label>
                        <input type="text" name="nameUser" id="nameUser">
                    </div>
                
                    <div>
                        <label>Apellido: </label>
                        <input type="text" name="lastnameUser" id="lastnameUser">
                    </div>
    
                    <div>
                        <label>E-mail: </label>
                        <input type="email" name="emailUser" id="emailUser">
                    </div>
    
                    <div>
                        <label>Telefono: </label>
                        <input type="number" name="phoneUser" id="phoneUser">
                    </div>
    
                    <div>
                        <label>Tipo de Documento: </label>
                        <select name="typeDocUser" id="typeDocUser">
                            <option value="0">Seelccione un tipo de documento</option>
                            <option value="C.C.">Cédula de ciudadania</option>
                            <option value="C.E.">Cédula de extrangería</option>
                            <option value="P.B.">Pasaporte</option>
                            <option value="R.C.">Registro civil</option>
                        </select>
                    </div>
                </div>
                
                <div>
                    <div>
                        <label>Número de documento: </label>
                        <input type="number" name="documentUser" id="documentUser">
                    </div>
    
                    <div>
                        <label>Nombre de usuario: </label>
                        <input type="text" name="userUser" id="userUser">
                    </div>
    
                    <div>
                        <label>Contraseña: </label>
                        <input type="password" name="passwordUser" id="passwordUser" minlength="8">
                    </div>
    
                    <div>
                        <label>Confirmar contraseña: </label>
                        <input type="password" name="confirmPasswordUser" id="confirmPasswordUser" minlength="8">
                    </div>

                    <div>
                        <label>Tipo de Usuario: </label>
                        <select name="typeUser" id="typeUser">
                            <option value="0">Seleccione un tipo de usuario</option>
                            <option value="3">Cliente</option>
                            <option value="2">Empleado</option>
                        </select>
                    </div>
                </div>
                
                <input type="hidden" name="userFormValue" id="userFormValue" value="">
                
                <div class="buttonForm">
                    <button type="submit" name="userForm" value="registNewUser">Registrarse</button>
                </div>
                
            </form>
            <p><a href="user?navUser=login">Inicia sesión<br></a> si ya tienes una cuenta</p>

            <a class="cancelButton" href="user?navUser=login">Cancelar</a>
        </main>

        <script src="./assets/js/register.js"></script>
    </div>
</body>
</html>