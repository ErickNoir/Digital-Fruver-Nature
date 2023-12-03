<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="assets/img/logo.png">
    <title>Iniciar Sesión</title>

    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
    <div class="container">
        <div class="loginHead">
            <div class="imgLoginHead"><img src="assets/img/logo.png" class="img"></div>
            <div class="logoTextLoginHead"><h3>Digital-Fruver Nature</h3></div>
        </div>


        <div class="loginBody">
            <div class="loginTitle"><h1>Iniciar Sesión</h1></div>            
            <form action="user" method="post">
                <div  class="label1"><label>Usuario</label></div>
                <input type="text" class="input1" name="enteredLogUsername" id="enteredLogUsername">
    
                <div class="label2"><label>Contraseña</label></div>
                <input type="password" class="input2" name="enteredLogPassword" id="enteredLogPassword" >

                <button type="submit" class="greenButton" name="userForm" value="validateFormLogin">Ingresar</button>

                <div class="registerRedirect center"><p>¿Aún no tienes una cuenta? <br><a href="user?navUser=register">Registrate aquí</a></p></div>
            </form>

            <button class="cancelButton center" onclick="window.location.href='user?navUser=index'">Cancelar</button>

        </div>
    </div>
</body>
</html>