//Ventana modal para actualizar ESTADO del usuario
let buttonToOpenModalWindowForProfileStatus = document.getElementById("openProfileStatusModal");
let ModalWindowSatusProfile = document.getElementById("profileStatusModalWindow");
let buttonToCloseModalWindowForProfileStatus = document.getElementById("closeModalWindowSatusProfile");

buttonToOpenModalWindowForProfileStatus.addEventListener("click", ()=> {
    ModalWindowSatusProfile.style.display="flex";
});

buttonToCloseModalWindowForProfileStatus.addEventListener("click", ()=> {
    ModalWindowSatusProfile.style.display="none";
});

document.addEventListener("mouseup", function(event){
    var ModalWindowSatusProfileContent = document.querySelector(".profileStatusModalContent");

    if (!ModalWindowSatusProfileContent.contains(event.target)){
        ModalWindowSatusProfile.style.display="none";
    } else{
        ModalWindowSatusProfile.style.display="flex";
    }
});


//Ventana modal para ACTUALIZAR usuario
let buttonToOpenModalWindowForProfileUpdate = document.getElementById("openUpdateProfileModal");
let ModalWindowUpdateProfile = document.getElementById("modalWindowUpdateProfile");
let buttonToCloseModalWindowForProfileUpdate = document.getElementById("closeUpdateProfileModal");

buttonToOpenModalWindowForProfileUpdate.addEventListener("click", ()=> {
    ModalWindowUpdateProfile.style.display="flex";
});

buttonToCloseModalWindowForProfileUpdate.addEventListener("click", ()=> {
    ModalWindowUpdateProfile.style.display="none";
});

document.addEventListener("mouseup", function(event){
    var ModalWindowUpdateProfileContent = document.querySelector(".modalContentUpdateProfile");

    if (!ModalWindowUpdateProfileContent.contains(event.target)){
        ModalWindowUpdateProfile.style.display="none";
    } else{
        ModalWindowUpdateProfile.style.display="flex";
    }
});


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






document.getElementById("updateProfileForm").addEventListener("submit", function(event){
    event.preventDefault();

    let name = document.getElementById("nameUpdateProfile").value;
    let lastname = document.getElementById("lastnameUpdateProfile").value;
    let email = document.getElementById("emailUpdateProfile").value;
    let phone = document.getElementById("phoneUpdateProfile").value;
    let typeDoc = document.getElementById("typeDocUpdateProfile").value;
    let documentt = document.getElementById("documentUpdateProfile").value;
    let username = document.getElementById("usernameUpdateProfile").value;
    let password = document.getElementById("passwordUpdateProfile").value;
    let cPassword = document.getElementById("password2UpdateProfile").value;

    if(name=="" || lastname==""  || email==""  || phone==""  || typeDoc==""  || documentt==""  || username==""  || password==""  || cPassword=="" ){
        alert("Por favor, complete todos los campos del formulario para actualizar correctamente su perfil.");
        console.log("Debe llenar todos los campos.");
        return;
    } else if(password != cPassword){
        alert("Las contraseñas deben coincidir para actualizar correctamente su perfil.");
        console.log("Las contraseñas no coinciden.");
        return;
    } else{
        let updateProfileValue = document.getElementById("updateProfileFormValue").value;
        document.getElementById("updateProfileValue").value = updateProfileValue;
        console.log("Formulario enviado con éxito.");
        this.submit();
    }
});