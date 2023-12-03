//Ventana modal para MENU EN BARRA LATERAL
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