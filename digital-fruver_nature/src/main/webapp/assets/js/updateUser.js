document.getElementById("updateUserForm").addEventListener("submit", function(event){
    event.preventDefault();

    let name = document.getElementById("updateNameUser").value;
    let lastname = document.getElementById("updateLastnameUser").value;
    let email = document.getElementById("updateEmailUser").value;
    let phone = document.getElementById("updatePhoneUser").value;
    let typeDoc = document.getElementById("updateTypeDocUser").value;
    let doc = document.getElementById("updateDocumentUser").value;
    let username = document.getElementById("updateUserUser").value;
    let password = document.getElementById("updatePasswordUser").value;
    let status = document.getElementById("updateStateUser").value;

    let numberInt = parseInt(phone);
    let docInt = parseInt(doc)
    let statusInt = parseInt(status);

    if (name=="" || lastname=="" || email=="" || phone=="" || typeDoc==0 || doc=="" || username=="" || password=="" || statusInt==0){
        alert("Por favor, complete todos los campos del formulario para actualizar correctamente su perfil.");
        console.log("Debe llenar todos los campos.");

    } else if(!Number.isInteger(numberInt) || !Number.isInteger(docInt)){
        alert("Por favor, ingrese solo números enteros en los el N. Documento y Telefono.");
        console.log("Campos numéricos no validos");

    } else{
        let updateProfileValue = document.getElementById("updateUserValueForm").value;
        document.getElementById("updateUserValue").value = updateProfileValue;
        console.log(updateProfileValue);

        console.log("Formulario enviado con éxito.");
        this.submit();
    }
});