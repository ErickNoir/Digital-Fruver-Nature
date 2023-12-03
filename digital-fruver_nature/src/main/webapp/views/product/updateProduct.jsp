<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="./assets/img/logo.png">
    <title>Actualizar Producto</title>

    <link rel="stylesheet" href="./assets/css/editProduct.css">
</head>
<body>
    <div class="container">
        <header>
            <div class="logoHeader">
                <img src="assets/img/logo.png">
            </div>
            <div class="textHeader center">
                <h4>Digital-Fruver Nature</h4>
                <h2>Actualizar producto</h2>
            </div>
        </header>


        <main>
            <c:forEach var="prod" items="${product}">
                <form action="product" method="POST" enctype="multipart/form-data">
                    <input type="text" name="updateIDProduct" value="${prod.idProduct}" hidden>

                    <div class="div1">
                        <div class="imageDiv"><img src="productimg?id=${prod.idProduct}" width=100px height=100px><br> </div>
                        <div class="div1-2">
                            <label>Nombre: </label>
                            <input class="styledInput" type="text" name="updateNameProduct" value="${prod.nameProduct}">
                        
                            <label>Imagen: </label>
                            <input type="file" name="updateImageProduct" value="productimg?id=${prod.idProduct}">
                        </div>
                    </div>

                    <div class="div2">
                        <label>Disponibilidad [En libras]:</label>
                        <input class="styledInput" type="number" name="updateStockProduct" value="${prod.availabilityProduct}">
                
                        <br> 
                
                        <label>Detalles:</label>
                        <textarea name="updateDetailsProduct" cols="30" rows="10">${prod.descriptionProduct}</textarea>
                
                        <br> 
                
                        <label>Precio [Por libra]: </label>
                        <input class="styledInput" type="number" name="updatePriceProduct" value="${prod.priceProduct}">
                
                        <br> 
                
                        <label>Estado: </label>
                        <c:choose>
                            <c:when test="${prod.statusProduct eq 'Disponible'}">
                                <select class="styledInput" name="updateStatusProduct">
                                    <option value="Disponible">Disponible</option>
                                    <option value="Suspendido">Suspendido</option>
                                </select>
                            </c:when>
        
                            <c:when test="${prod.statusProduct eq 'Suspendido'}">
                                <select class="styledInput" name="updateStatusProduct">
                                    <option value="Suspendido">Suspendido</option>
                                    <option value="Disponible">Disponible</option>
                                </select>
                            </c:when>
                            
                        </c:choose>
                
                        <br> <br>

                        <div class="center buttonDiv">
                            <input class="buttonForm" type="submit" name="productForm" value="Actualizar Producto">
                        </div>    
                    </div>           
                </form>
            </c:forEach>
            
            <div class="center cancel">
                <a class="cancelButton" href="product?navProduct=listProducts">Cancelar</a>
            </div>
            
        </main>
    </div>
</body>
</html>