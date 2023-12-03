package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user.UserVO;
import model.user.UserDAO;


public class User extends HttpServlet{
    UserVO newUserVO = new UserVO();
    UserDAO newUserDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String navUser = req.getParameter("navUser");
        System.out.println(navUser);

        HttpSession session = req.getSession(false);

        switch(navUser){
            case "index":
                RequestDispatcher index = req.getRequestDispatcher("./index.jsp");
                index.forward(req, resp);
                break;

            case "indexStaff":
                RequestDispatcher indexAdmin = req.getRequestDispatcher("./views/user/indexStaff.jsp");
                indexAdmin.forward(req, resp);
                break;

            case "indexClient":
                RequestDispatcher indexClient = req.getRequestDispatcher("./views/user/clientIndex.jsp");
                indexClient.forward(req, resp);
                break;

            case "login":
                RequestDispatcher login = req.getRequestDispatcher("./views/user/login.jsp");
                login.forward(req, resp);
                break;

            case "logout":
                    session.removeAttribute("username");
                    session.removeAttribute("id");
                    session.invalidate(); // Invalida la sesión actual

                    RequestDispatcher logoutIndex = req.getRequestDispatcher("./index.jsp");
                    logoutIndex.forward(req, resp);
                break;

            case "myProfile":
                RequestDispatcher myProfile = req.getRequestDispatcher("./views/user/myProfile.jsp");
                myProfile.forward(req, resp);
                break;

            case "register":
                RequestDispatcher register = req.getRequestDispatcher("./views/user/register.jsp");
                register.forward(req, resp);
                break;
            
            case "listUsers":
                System.out.println("Listando...");
                listUsers(req,resp);
                break;
        }
    }




    private void listUsers(HttpServletRequest req, HttpServletResponse resp) {
        try{
            List<UserVO> arrayUser = newUserDAO.listsUsers();
            req.setAttribute("user", arrayUser);

            System.out.println("Finalizando...");
            
            RequestDispatcher showUsers = req.getRequestDispatcher("./views/user/listUsers.jsp");
            showUsers.forward(req, resp);

            System.out.println("Se terminó de listar los usuarios.");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){
            System.out.println("Error al listar los usuarios: "+ e.getMessage().toString());
        }
    }





//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// D O   P O S T ------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userForm = req.getParameter("userForm");
        String userFormValidated = req.getParameter("userFormValue");
        System.out.println(userForm + " " + userFormValidated);

        if(userForm != null){
            switch(userForm){
                case "validateFormLogin":
                    login(req,resp);
                    break;

                case "registNewUser":
                    register(req,resp);
                    break;
                
                case "searchUserFor":
                    searchUserFor(req,resp);
                    break;

                case "inactivateUser":
                    inactivateUser(req,resp);
                    break;

                case "activateUser":
                    activateUser(req,resp);
                    break;

                case "searchOneUser":
                    searchOneUser(req,resp);
                    break;

                case "updateUser":
                    updateUser(req,resp);
                    break;

                case "updateProfile":
                    updateProfile(req,resp);
                    break;
                
                case "updateProfileStatus":
                    updateProfileStatus(req,resp);
                    break;
            }
        } else{
            switch (userFormValidated) {
                case "registNewUser":
                    register(req,resp);
                    break;

                case "updateProfile":
                    updateProfile(req,resp);
                    break;
                
                case "updateUser":
                    updateUser(req,resp);
                    break;
                default:
                    break;
            }
        }
    }



// INICIAR SESION - USUARIO --------------------------------------------------------------------------------------------------------------------------
    private void login(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("enteredLogUsername")!=null) { newUserVO.setUsernameUser((req.getParameter("enteredLogUsername"))); }
        if (req.getParameter("enteredLogPassword")!=null) { newUserVO.setPasswordUser((req.getParameter("enteredLogPassword"))); }
        String usernameLogin = req.getParameter("enteredLogUsername");
        String passwordLogin = req.getParameter("enteredLogPassword");

        try {
            newUserDAO.login(newUserVO);

            if (newUserVO != null) {
                if (usernameLogin.equals(newUserVO.getUsernameUser()) && passwordLogin.equals(newUserVO.getPasswordUser()) && "Activo".equals(newUserVO.getStateUser())) {

                    HttpSession session = req.getSession(true);
                    session.setAttribute("id", newUserVO.getIdUser());
                    session.setAttribute("name", newUserVO.getNameUser());
                    session.setAttribute("lastname", newUserVO.getLastNameUser());
                    session.setAttribute("email", newUserVO.getEmailUser());
                    session.setAttribute("phone", newUserVO.getCelphoneUser());
                    session.setAttribute("typeDoc", newUserVO.getTypeDocumentUser());
                    session.setAttribute("document", newUserVO.getDocumentNumberUser());
                    session.setAttribute("username", newUserVO.getUsernameUser());
                    session.setAttribute("password", newUserVO.getPasswordUser());
                    session.setAttribute("role", newUserVO.getIdfkRolUser());
                    session.setAttribute("status", newUserVO.getStateUser());

                    if("1".equals(newUserVO.getIdfkRolUser())){
                        System.out.println("Bienvenido al sistema, administrador.");
                        System.out.println("------------------------------------");
                        RequestDispatcher indexAdmin = req.getRequestDispatcher("./views/user/indexStaff.jsp");
                        indexAdmin.forward(req, resp);

                    } else if("2".equals(newUserVO.getIdfkRolUser())){
                        System.out.println("Bienvenido al sistema, empleado.");
                        System.out.println("------------------------------------");
                        RequestDispatcher emplAdmin = req.getRequestDispatcher("./views/user/indexStaff.jsp");
                        emplAdmin.forward(req, resp);
                    } else if("3".equals(newUserVO.getIdfkRolUser())){
                        System.out.println("Bienvenido al sistema, cliente.");
                        System.out.println("------------------------------------");

                        String value = "listProductsForClient";
                        String clientIndexUrl = "product?navProduct=" + URLEncoder.encode(value, "UTF-8");
                        resp.sendRedirect(clientIndexUrl);
                    } else{
                        System.out.println("Error al validar el rol");
                        System.out.println("-------------------------------------");
                        RequestDispatcher login = req.getRequestDispatcher("./views/user/login.jsp");
                        login.forward(req, resp);
                    }
                    
                } else{
                    System.out.println("(Servlet) Acceso denegado.");
                    System.out.println("-------------------------------------");
                    RequestDispatcher login = req.getRequestDispatcher("./views/user/login.jsp");
                    login.forward(req, resp);
                }
                
            } else {
                System.out.println("Usuario no encontrado.");
                System.out.println("------------------------------------");
                RequestDispatcher login = req.getRequestDispatcher("./views/user/login.jsp");
                login.forward(req, resp);
            }

        } catch(Exception x){
            System.out.println("(Servlet) La consulta no pudo ser ejecutada" + x.getMessage().toString()); 
        }
    }


// REGISTRARSE - USUARIO --------------------------------------------------------------------------------------------------------------------------
    private void register(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("nameUser")!=null) { newUserVO.setNameUser((req.getParameter("nameUser"))); }
        if (req.getParameter("lastnameUser")!=null) { newUserVO.setLastNameUser((req.getParameter("lastnameUser"))); }
        if (req.getParameter("emailUser")!=null) { newUserVO.setEmailUser((req.getParameter("emailUser"))); }
        if (req.getParameter("phoneUser")!=null) { newUserVO.setCelphoneUser((req.getParameter("phoneUser"))); }
        if (req.getParameter("typeDocUser")!=null) { newUserVO.setTypeDocumentUser((req.getParameter("typeDocUser"))); }
        if (req.getParameter("documentUser")!=null) { newUserVO.setDocumentNumberUser((req.getParameter("documentUser"))); }
        if (req.getParameter("userUser")!=null) { newUserVO.setUsernameUser((req.getParameter("userUser"))); }
        if (req.getParameter("passwordUser")!=null) { newUserVO.setPasswordUser((req.getParameter("passwordUser"))); }
        if (req.getParameter("typeUser")!=null) { newUserVO.setIdfkRolUser((req.getParameter("typeUser"))); }

        String typeUser = req.getParameter("typeUser");
        System.out.println("Validando estado..." + typeUser); 

            if("2".equals(typeUser)){
                System.out.println("Definendo estado como inactivo..."); 
                newUserVO.setStateUser("Inactivo");
            }else if("3".equals(typeUser)){
                System.out.println("Definendo estado como activo..."); 
                newUserVO.setStateUser("Activo");
            }else{
                System.out.println("Error definiendo el estado.");
            }
        
        
        try {
            newUserDAO.register(newUserVO);
            System.out.println("El registro fue exitoso.");

            RequestDispatcher login = req.getRequestDispatcher("./views/user/login.jsp");
            login.forward(req, resp);
        } catch (Exception x) {
            System.out.println("(Servlet) La consulta no pudo ser ejecutada" + x.getMessage().toString()); 
        }
    }



// ACTUALIZAR PERFIL - USUARIO -----------------------------------------------------------------------------------------------------------------------------
    private void updateProfile(HttpServletRequest req, HttpServletResponse resp) {  
        if (req.getParameter("idUpdateProfile")!=null) { newUserVO.setIdUser(req.getParameter("idUpdateProfile")); }
        if (req.getParameter("nameUpdateProfile")!=null) { newUserVO.setNameUser(req.getParameter("nameUpdateProfile")); }
        if (req.getParameter("lastnameUpdateProfile")!=null) { newUserVO.setLastNameUser(req.getParameter("lastnameUpdateProfile")); }
        if (req.getParameter("emailUpdateProfile")!=null) { newUserVO.setEmailUser(req.getParameter("emailUpdateProfile")); }
        if (req.getParameter("phoneUpdateProfile")!=null) { newUserVO.setCelphoneUser(req.getParameter("phoneUpdateProfile")); }
        if (req.getParameter("typeDocUpdateProfile")!=null) { newUserVO.setTypeDocumentUser(req.getParameter("typeDocUpdateProfile")); }
        if (req.getParameter("documentUpdateProfile")!=null) { newUserVO.setDocumentNumberUser(req.getParameter("documentUpdateProfile")); }
        if (req.getParameter("usernameUpdateProfile")!=null) { newUserVO.setUsernameUser(req.getParameter("usernameUpdateProfile")); }
        if (req.getParameter("passwordUpdateProfile")!=null) { newUserVO.setPasswordUser(req.getParameter("passwordUpdateProfile")); }

        try{
            newUserDAO.updateProfile(newUserVO);
            System.out.println("La actualización de perfil fue exitoso.");
            System.out.println("------------------------------------------------------------------------");

            RequestDispatcher updatedProfile = req.getRequestDispatcher("./views/user/myProfile.jsp");
            updatedProfile.forward(req, resp);
        }catch (Exception x){
            System.out.println("(Servlet) La actualización de perfil no pudo ser ejecutada" + x.getMessage().toString());
        }
    }
    //actualizar el estado
    private void updateProfileStatus(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("idUpdateProfileStatus")!=null) { newUserVO.setIdUser(req.getParameter("idUpdateProfileStatus")); }
        try{
            newUserDAO.updateProfileSatus(newUserVO);
            System.out.println("La actualización de estado de perfil fue exitoso.");
            System.out.println("------------------------------------------------------------------------");

            RequestDispatcher login = req.getRequestDispatcher("./views/user/login.jsp");
            login.forward(req, resp);
        }catch (Exception x){
            System.out.println("(Servlet) La actualización del estado de perfil no pudo ser ejecutada" + x.getMessage().toString());
        }
    }





// BUSCAR USUARIO - ADMINISTRADOR --------------------------------------------------------------------------------------------------------------------------
    private void searchUserFor(HttpServletRequest req, HttpServletResponse resp){
        String dataForSearch = null;
        String typeDataSearchFor = null;

        if(req.getParameter("searchData")!= null){ dataForSearch = req.getParameter("searchData"); }
        if(req.getParameter("searchFor")!= null){ typeDataSearchFor = req.getParameter("searchFor"); }

        try{
            List<UserVO> arrayUserSearch = newUserDAO.searchUser(dataForSearch, typeDataSearchFor);
            req.setAttribute("user", arrayUserSearch);

            System.out.println("Finalizando...");

            RequestDispatcher showUsersSearch = req.getRequestDispatcher("./views/user/listUserForSearch.jsp");
            showUsersSearch.forward(req, resp);

            System.out.println("Se terminó de buscar el usuario.");
            System.out.println("------------------------------------------------------------------------");

        } catch(Exception x){
            System.out.println("(Servlet) Error al buscar el usuario: "+ x.getMessage().toString());
        }
    }



// DEFINIR ESTADO DE USUARIO - ADMINISTRADOR --------------------------------------------------------------------------------------------------------------------------
    //INACTIVAR
    private void inactivateUser(HttpServletRequest req, HttpServletResponse resp){
        if(req.getParameter("defineStatusUser")!= null){ newUserVO.setIdUser(req.getParameter("defineStatusUser"));}
        if(req.getParameter("defineStatus")!= null){ newUserVO.setStateUser(req.getParameter("defineStatus"));}

        try{
            newUserDAO.inactivateUser(newUserVO);
            System.out.println("Finalizando...");

            RequestDispatcher showUsers = req.getRequestDispatcher("./views/user/listUsers.jsp");
            showUsers.forward(req, resp);

            System.out.println("La inactivación del usuario fue exitosa.");
            System.out.println("------------------------------------------------------------------------");
        } catch(Exception x){
            System.out.println("(Servlet) Error al inactivar el usuario: "+ x.getMessage().toString());
        }
    }

    //ACTIVAR
    private void activateUser(HttpServletRequest req, HttpServletResponse resp){
        if(req.getParameter("defineStatusUser")!= null){ newUserVO.setIdUser(req.getParameter("defineStatusUser"));}
        if(req.getParameter("defineStatus")!= null){ newUserVO.setStateUser(req.getParameter("defineStatus"));}

        try{
            newUserDAO.activateUser(newUserVO);
            System.out.println("Finalizando...");

            RequestDispatcher showUsers = req.getRequestDispatcher("./views/user/listUsers.jsp");
            showUsers.forward(req, resp);

            System.out.println("La activación del usuario fue exitosa.");
            System.out.println("------------------------------------------------------------------------");
        } catch(Exception x){
            System.out.println("(Servlet) Error al activar el usuario: "+ x.getMessage().toString());
        }
    }



// BUSCAR UN USUARIO - ADMINISTRADOR --------------------------------------------------------------------------------------------------------------------------
    private void searchOneUser(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("Buscando usuario...");

        if(req.getParameter("searchUserToEdit")!= null){ newUserVO.setIdUser(req.getParameter("searchUserToEdit"));}

        try{
            List<UserVO> arrayOneUser = newUserDAO.listOneUser(newUserVO);
            req.setAttribute("user", arrayOneUser);

            System.out.println("Finalizando...");
            
            RequestDispatcher formToUpdateUser = req.getRequestDispatcher("./views/user/updateUser.jsp");
            formToUpdateUser.forward(req, resp);

            System.out.println("Se terminó de listar los datos del usuario buscado.");
            System.out.println("------------------------------------------------------------------------");
        }catch(Exception e){
            System.out.println("(Servlet) Error al listar los datos del usuario buscado: "+ e.getMessage().toString());
        }
    }



// ACTUALIZAR USUARIO - ADMINISTRADOR --------------------------------------------------------------------------------------------------------------------------
    private void updateUser(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("updateIDUser")!=null) { newUserVO.setIdUser(req.getParameter("updateIDUser")); }
        if (req.getParameter("updateNameUser")!=null) { newUserVO.setNameUser(req.getParameter("updateNameUser")); }
        if (req.getParameter("updateLastnameUser")!=null) { newUserVO.setLastNameUser(req.getParameter("updateLastnameUser")); }
        if (req.getParameter("updateEmailUser")!=null) { newUserVO.setEmailUser(req.getParameter("updateEmailUser")); }
        if (req.getParameter("updatePhoneUser")!=null) { newUserVO.setCelphoneUser(req.getParameter("updatePhoneUser")); }
        if (req.getParameter("updateTypeDocUser")!=null) { newUserVO.setTypeDocumentUser(req.getParameter("updateTypeDocUser")); }
        if (req.getParameter("updateDocumentUser")!=null) { newUserVO.setDocumentNumberUser(req.getParameter("updateDocumentUser")); }
        if (req.getParameter("updateUserUser")!=null) { newUserVO.setUsernameUser(req.getParameter("updateUserUser")); }
        if (req.getParameter("updatePasswordUser")!=null) { newUserVO.setPasswordUser(req.getParameter("updatePasswordUser")); }
        if (req.getParameter("updateTypeUser")!=null) { newUserVO.setIdfkRolUser(req.getParameter("updateTypeUser")); }
        if (req.getParameter("updateStateUser")!=null) { newUserVO.setStateUser(req.getParameter("updateStateUser")); }

        try {
            newUserDAO.updateUser(newUserVO);
            System.out.println("La actualización del usuario fue exitosa.");

            RequestDispatcher showUsers = req.getRequestDispatcher("./views/user/listUsers.jsp");
            showUsers.forward(req, resp);
        } catch (Exception x) {
            System.out.println("(Servlet) La consulta de actualización no pudo ser ejecutada: " + x.getMessage().toString()); 
        }
    }
}