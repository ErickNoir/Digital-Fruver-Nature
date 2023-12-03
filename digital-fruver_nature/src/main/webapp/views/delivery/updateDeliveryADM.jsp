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
    <title>Actualizar domicilio</title>

    <link rel="stylesheet" href="./assets/css/editOrder.css">
</head>
<body>
    <div class="container">
        <header>
            <div class="logoHeader">
                <img src="assets/img/logo.png">
            </div>
            <div class="textHeader center">
                <h4>Digital-Fruver Nature</h4>
                <h2>Actualizar domicilio</h2>
            </div>
        </header>


        <main>
            <c:forEach var="oneD" items="${oneDelivery}">
                <form action="delivery" method="post">
                    <input type="number" name="updateIDDelivery" value="${oneD.idDelivery}" hidden>

                    <br><label>Dirección:</label>
                    <br><input type="text" name="updateAdressDelivery" value="${oneD.address}">

                    <br><label>Fecha de envío:</label>
                    <br><input type="datetime-local" name="updateShipmentDateDelivery" value="${oneD.shipmentDate}">

                    <br><label>Fecha de entrega:</label>
                    <br><input type="datetime-local" name="updateDeliveryDateDelivery" value="${oneD.deliveryDate}">

                    <br><label>Detalles:</label>
                    <br><textarea name="updateDetailsDelivery" cols="30" rows="10">${oneD.detailsDelivery}</textarea>
                    
                    <div class="center">
                        <button class="buttonForm"  type="submit" name="formDelivery" value="updateDeliveryADM">Actualizar</button>
                    </div>
                </form>
            </c:forEach>

            <br> <br>

            <div class="center cancel">
                <a class="cancelButton" href="delivery?navDelivery=listAllDeliveries">Cancelar</a>
            </div>
        </main>
    </div>
    
</body>
</html>