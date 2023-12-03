<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">

    <link rel="icon" href="./assets/img/logo.png">
    <title>Registrar Producto</title>

    <link rel="stylesheet" href="./assets/css/registProduct.css">
</head>
<body>
    <div class="container">

        <header>
            <div class="logoHeader">
                <img src="assets/img/logo.png">
            </div>
            <div class="textHeader center">
                <h4>Digital-Fruver Nature</h4>
                <h2>Registrar producto</h2>
            </div>
        </header>
        

        <main>
            <form action="product" method="POST" enctype="multipart/form-data">
                <label>Nombre: </label>
                <input class="styledInput" type="text" name="nameNewProduct">
        
                <br> 
            
                <label>Imagen: </label>
                <input type="file" name="photoNewProduct">
        
                <br> 
        
                <label>Disponibilidad [En libras]:</label>
                <input class="styledInput" type="number" name="stockNewProduct">
        
                <br> 
        
                <label>Detalles:</label>
                <textarea name="detailsNewProduct" cols="30" rows="10"></textarea>
        
                <br> 
        
                <label>Precio [Por libra]: </label>
                <input class="styledInput" type="number" name="priceNewProduct">
        
                <br> 
        
                <label>Estado: </label>
                <select class="styledInput" name="statusNewProduct">
                    <option value="Disponible">Disponible</option>
                    <option value="Suspendido">Suspendido</option>
                </select>
        
                <br> <br>
                
                <div class="center">
                    <input class="buttonForm"  type="submit" name="productForm" value="Registrar Producto">
                </div>
                
            </form>


            <div class="center cancel">
                <a class="cancelButton" href="product?navProduct=listProducts">Cancelar</a>
            </div>

        </main>
    </div>
</body>
</html>