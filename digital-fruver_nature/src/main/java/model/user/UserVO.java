package model.user;

public class UserVO {
    private String idUser;
    private String celphoneUser, documentNumberUser, idfkRolUser;
    private String priorityUser, nameUser, lastNameUser, emailUser, typeDocumentUser, usernameUser, passwordUser;
    private String stateUser;

//Contructor de la clase Usuario
    public UserVO(){}
    public UserVO(String idUser, String celphoneUser, String documentNumberUser, String idfkRolUser,
                String priorityUser, String nameUser, String lastNameUser, String emailUser, String typeDocumentUser, String usernameUser, String passwordUser,
                String stateUser){
        
        this.idUser = idUser;
        this.celphoneUser = celphoneUser;
        this.documentNumberUser = documentNumberUser;
        this.idfkRolUser = idfkRolUser;
        
        this.priorityUser = priorityUser;
        this.nameUser = nameUser;
        this.lastNameUser = lastNameUser;
        this.emailUser = emailUser;
        this.typeDocumentUser = typeDocumentUser;
        this.usernameUser = usernameUser;
        this.passwordUser = passwordUser;
        
        this.stateUser = stateUser;
    }


//Metodos accesores

    public String getIdUser() { return idUser; }
    public void setIdUser(String idUser) { this.idUser = idUser; }


    public String getCelphoneUser() { return celphoneUser; }
    public void setCelphoneUser(String celphoneUser) { this.celphoneUser = celphoneUser; }


    public String getDocumentNumberUser() { return documentNumberUser; }
    public void setDocumentNumberUser(String documentNumberUser) { this.documentNumberUser = documentNumberUser; }


    public String getIdfkRolUser() { return idfkRolUser; }
    public void setIdfkRolUser(String idfkRolUser) { this.idfkRolUser = idfkRolUser; }




    public String getPriorityUser() { return priorityUser; }
    public void setPriorityUser(String priorityUser) { this.priorityUser = priorityUser; }


    public String getNameUser() { return nameUser; }
    public void setNameUser(String nameUser) { this.nameUser = nameUser; }


    public String getLastNameUser() { return lastNameUser; }
    public void setLastNameUser(String lastNameUser) { this.lastNameUser = lastNameUser; }


    public String getEmailUser() { return emailUser; }
    public void setEmailUser(String emailUser) { this.emailUser = emailUser; }


    public String getTypeDocumentUser() { return typeDocumentUser; }
    public void setTypeDocumentUser(String typeDocumentUser) { this.typeDocumentUser = typeDocumentUser; }


    public String getUsernameUser() { return usernameUser; }
    public void setUsernameUser(String usernameUser) { this.usernameUser = usernameUser; }


    public String getPasswordUser() { return passwordUser; }
    public void setPasswordUser(String passwordUser) { this.passwordUser = passwordUser; }




    public String getStateUser() { return stateUser; }
    public void setStateUser(String stateUser) { this.stateUser = stateUser; }
}
