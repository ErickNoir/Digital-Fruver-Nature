//Ventana Modal VER DETALLES DE PRODUCTO
let buttonOpenProductDetails = document.getElementById("openViewMoreProductInfo");
let productDetailsWindow = document.getElementById("modalInfoProduct");
let buttonCloseProductDetails = document.getElementById("closeViewMoreProductInfo");
let productDetailsContent = document.querySelector(".modalInfoProductContent");

buttonOpenProductDetails.addEventListener("click", () => {
    productDetailsWindow.style.display = "flex";
});

buttonCloseProductDetails.addEventListener("click", () => {
    productDetailsWindow.style.display = "none";
});

document.addEventListener("mouseup", (event) => {
    if (!productDetailsContent.contains(event.target)) {
        productDetailsWindow.style.display = "none";
    }
});



//Ventana Modal COMPRAR PRODUCTO
let buttonOpenBuyProduct = document.getElementById("openBuyProduct");
let buyProductWindow = document.getElementById("modalBuyProduct");
let buttonCloseBuyProduct = document.getElementById("closeBuyProduct");
let buyProductContent = document.querySelector(".modalBuyProductContent");

buttonOpenBuyProduct.addEventListener("click", () => {
    buyProductWindow.style.display = "flex";
});

buttonCloseBuyProduct.addEventListener("click", () => {
    buyProductWindow.style.display = "none";
});

document.addEventListener("mouseup", (event) => {
    if (!buyProductContent.contains(event.target)) {
        buyProductWindow.style.display = "none";
    }
});




//Venatana modal barra lateral
let buttonToOpenModalWindowLateralMenu = document.getElementById("burgerMenu");
let ModalWindowLateralMenu = document.getElementById("lateralNabvarModalWindow");
let buttonToCloseModalWindowForLateralMenu = document.getElementById("closeLateralNavbar");

buttonToOpenModalWindowLateralMenu.addEventListener("click", ()=> {
    ModalWindowLateralMenu.style.display="flex";
});

buttonToCloseModalWindowForLateralMenu.addEventListener("click", ()=> {
    ModalWindowLateralMenu.style.display="none";
});
document.addEventListener("mouseup", function(event){
    var ModalWindowLateralMenuContent = document.querySelector(".lateralNavbarModalContent");

    if (!ModalWindowLateralMenuContent.contains(event.target)){
        ModalWindowLateralMenu.style.display="none";
    } else{
        ModalWindowLateralMenu.style.display="flex";
    }
});





document.addEventListener("DOMContentLoaded", function () {
    var deliveryTypeSelect = document.getElementById("select1");
    var addressInputContainer = document.getElementById("adressInput");

    // Manejar el evento de cambio en el select
    deliveryTypeSelect.addEventListener("change", function () {
        // Obtener el valor seleccionado
        var selectedValue = deliveryTypeSelect.value;

        // Mostrar u ocultar el input adicional según la opción seleccionada
        if (selectedValue === "3") {
            alert("Selecciona una opcion de envio por domicilio.");
        } else if (selectedValue === "1") {
            addressInputContainer.style.display = "block";
        } else {
            addressInputContainer.style.display = "none";
        }
    });
});



document.getElementById("quantityOrder").addEventListener('input', function(event) {
    let price = parseFloat(document.getElementById("totalProductPrice").innerText);
    let quantity = parseFloat(event.target.value);
    let total = price * quantity;

    document.getElementById("totalOrder").value = total;
});

document.getElementById("makeOrderProduct").addEventListener('submit', function(event){
    event.preventDefault();

    let dateForDelivery = document.getElementById("dateForOrder").value;
    let quantity = parseFloat(document.getElementById("quantityOrder").value);
    let deliveryTrueFalse = parseInt(document.getElementById("select1").value);
    let address = document.getElementById("address").value;
    let total = parseFloat(document.getElementById("totalOrder").value);

    if (dateForDelivery === "" || isNaN(quantity) || deliveryTrueFalse === 3 || isNaN(total)) {
        alert("Por favor complete todos los campos del formulario para actualizar correctamente su perfil.");
        return;
    } else if (deliveryTrueFalse === 1 && address === "") {
        alert("Por favor ingrese la dirección hacia donde irá el pedido.");
        return;
    } else {
        let formOrdersValue = document.getElementById("formMakeOrders").value;
        document.getElementById("formOrdersValue").value = formOrdersValue;

        console.log("Formulario enviado con éxito.");
        this.submit();
    }
});