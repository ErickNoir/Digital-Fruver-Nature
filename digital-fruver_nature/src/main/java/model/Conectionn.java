package model;

import java.sql.Connection;
import java.sql.DriverManager;


public class Conectionn {
    private static final String databaseURL = "jdbc:mysql://localhost:3306/digitalfruver_nature22";
    private static final String user = "root";
    private static final String password = "";
    private static Connection con;

    public static Connection conectTo(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(databaseURL, user, password);
            System.out.println("Conexión con la base de datos exitosa.");
        } catch (Exception e) {
            System.out.println("Error de conexión de base de datos: " +e.getMessage().toString());
        }

        return con;
    }

    public static void main(String[] args) {
        Conectionn.conectTo();
    }
}
