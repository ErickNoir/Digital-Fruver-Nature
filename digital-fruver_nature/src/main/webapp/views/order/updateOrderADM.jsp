<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="./assets/img/logo.png">
    <title>Actualizar Pedido</title>

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
                <h2>Actualizar pedido</h2>
            </div>
        </header>


        <main>
            <c:forEach var="oneO" items="${oneOrder}">
                <form action="order" method="post">
                    <input type="number" name="updateIDOrder" value="${oneO.idOrder}" hidden>

                    <label>Fecha de entrega:</label>
                    <br><input type="datetime-local" name="updateDeliveryDateOrder" value="${oneO.orderDeliveryDate}">

                    <br><label>Cantidad del producto:</label>
                    <br><input type="number" name="updateQuantityProductOrder" value="${oneO.quantityOrder}">

                    <br><label>Total:</label>
                    <br><input type="number" name="updateTotalOrder" value="${oneO.totalOrder}">

                    <br><label>Domicilio:</label>
                    <c:choose>
                        <c:when test="${oneO.trueFalseDelivery eq '1'}">
                            <select name="updateDeliveryTrueFalseOrder" id="">
                                <option value="1">Sí</option>
                                <option value="0">No</option>
                            </select>
                        </c:when>
                        
                        <c:when test="${oneO.trueFalseDelivery eq '0'}">
                            <br><select name="updateDeliveryTrueFalseOrder" id="">
                                <option value="0">No</option>
                                <option value="1">Sí</option>
                            </select>
                        </c:when>
                    </c:choose>

                    <br><label>Detalles del pedido:</label>
                    <br><textarea name="updateDetailsOrder" id="" cols="30" rows="10">${oneO.detailsOrder}</textarea>
                    
                    <br> <br>

                    <div class="center">
                        <button class="buttonForm" type="submit" name="formOrders" value="updateOrderADM">Actualizar</button>
                    </div>
                </form>
            </c:forEach>

            <br> <br>

            <div class="center cancel">
                <a class="cancelButton" href="order?navOrders=listAllOrders">Cancelar</a>
            </div>
        </main>
    </div>
</body>
</html>