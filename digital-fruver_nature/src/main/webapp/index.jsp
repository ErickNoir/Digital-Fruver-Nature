<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="./assets/img/logo.png">
    <title>Digital-Fruver Nature</title>
    <link rel="stylesheet" href="./assets/css/index.css">
    <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <header>
            <nav class="clientNav">
                <div class="navbarButtons">
                    <div><a class="navButton principalNavButton" href="user?navUser=index">Inicio</a></div>
                    <div><a class="navButton" href="#productos">Productos</a></div>
                    <div><a class="navButton" href="./#">Nosotros</a></div>
                    <div><a class="navButton specialNavButton" href="user?navUser=login">Iniciar sesión</a></div>
                    <div><a class="navButton specialNavButton" href="user?navUser=register">Registrarse</a></div>
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

        <div class="carousel">
            <img src="./assets/img/banner.jpg">
            <div class="texImgCarousel1"><h2>¡Bienvenido!</h2></div>
        </div>


        <main>
            <div class="productsSection">
                <h2 id="productos">Productos</h2>
                <hr>
    
                <div class="cardsContainer">
                    <div class="card">
                        <h3>Uchuva</h3>
                        <img src="./assets/img/uchuva.webp">
                        <h3 class="cardPrice">$ 5000 x L</h3>
    
                        <form action="" method="POST">
                            <input type="text" name="#" value="${prod.idProduct}" hidden>
                            <button class="cardButton" type="submit">Ver producto</button>
                        </form>
                    </div>  
    
                    
                    <!--Mas productos debajo...-->
    
                    <div class="card">
                        <h3>Gulupa</h3>
                        <img src="./assets/img/gulupa.jpg">
                        <h3 class="cardPrice">$ 6000 x L</h3>
    
                        <form action="" method="POST">
                            <input type="text" name="#" value="${prod.idProduct}" hidden>
                            <button class="cardButton" type="submit">Ver producto</button>
                        </form>
                    </div>
    
                    <div class="card">
                        <h3>Rambutan</h3>
                        <img src="./assets/img/rambutan.jpg">
                        <h3 class="cardPrice">$ 9500 x L</h3>
    
                        <form action="" method="POST">
                            <input type="text" name="#" value="${prod.idProduct}" hidden>
                            <button class="cardButton" type="submit">Ver producto</button>
                        </form>
                    </div>
    
                    <div class="card">
                        <h3>Mango</h3>
                        <img src="./assets/img/mango.jpg">
                        <h3 class="cardPrice">$ 1300 x L</h3>
    
                        <form action="" method="POST">
                            <input type="text" name="#" value="${prod.idProduct}" hidden>
                            <button class="cardButton" type="submit">Ver producto</button>
                        </form>
                    </div>
    
                    <div class="card">
                        <h3>Maracuyá</h3>
                        <img src="./assets/img/maracuya.webp">
                        <h3 class="cardPrice">$ 3900 x L</h3>
    
                        <form action="" method="POST">
                            <input type="text" name="#" value="${prod.idProduct}" hidden>
                            <button class="cardButton" type="submit">Ver producto</button>
                        </form>
                    </div>
    
                    <div class="card">
                        <h3>Granadilla</h3>
                        <img src="./assets/img/granadilla.jpg">
                        <h3 class="cardPrice">$ 4000 x L</h3>
    
                        <form action="" method="POST">
                            <input type="text" name="#" value="${prod.idProduct}" hidden>
                            <button class="cardButton" type="submit">Ver producto</button>
                        </form>
                    </div>
                    <!--////-->
                </div>
            </div>
        </main>

        <!--Ventana modal, Barra de bavegación lateral-->
        <div class="lateralNabvarModalWindow" id="lateralNabvarModalWindow">
            <div class="lateralNavbarModalContent">
                <div id="closeLateralNavbar"><i class="fa-solid fa-xmark"></i></div>
                <div class="lateralNabvarButtons">
                    <div><a class="navButton principalNavButton" href="user?navUser=index">Inicio</a></div>
                    <div><a class="navButton" href="#productos">Productos</a></div>
                    <div><a class="navButton" href="./#">Nosotros</a></div>
                    <div><a class="navButton specialNavButton" href="user?navUser=login">Iniciar sesión</a></div>
                    <div><a class="navButton specialNavButton" href="user?navUser=register">Registrarse</a></div>
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
    <script src="./assets/js/index.js"></script>
</body>
</html>