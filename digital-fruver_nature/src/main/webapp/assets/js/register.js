document.getElementById("registerForm").addEventListener("submit", function(event){
    event.preventDefault();

    let name = document.getElementById("nameUser").value;
    let lastname = document.getElementById("lastnameUser").value;
    let email = document.getElementById("emailUser").value;
    let phone = document.getElementById("phoneUser").value;
    let typeDoc = document.getElementById("typeDocUser").value;
    let doc = document.getElementById("documentUser").value;
    let username = document.getElementById("userUser").value;
    let password = document.getElementById("passwordUser").value;
    let confirmPassword = document.getElementById("confirmPasswordUser").value;
    let typeUser = document.getElementById("typeUser").value;

    let numberInt = parseInt(phone);
    let docInt = parseInt(doc)

    if (name=="" || lastname=="" || email=="" || phone=="" || typeDoc==0 || doc=="" || username=="" || password=="" || confirmPassword=="" || typeUser==0){
        alert("Por favor, complete todos los campos del formulario para actualizar correctamente su perfil.");
        console.log("Debe llenar todos los campos.");

    } else if(!Number.isInteger(numberInt) || !Number.isInteger(docInt)){
        alert("Por favor, ingrese solo números enteros en los el N. Documento y Telefono.");
        console.log("Campos numéricos no validos");

    } else if( password != confirmPassword){
        alert("Las contraseñas deben coincidir para actualizar correctamente su perfil.");
        console.log("Las contraseñas no coinciden.");

    } else{
        let userFormValue = document.querySelector("button[name='userForm']").value;
        document.getElementById("userFormValue").value = userFormValue;
        console.log("Formulario enviado con éxito.");
        this.submit();
    }
});