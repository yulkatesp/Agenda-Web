package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class conexion {

    private static final String URL =
        "jdbc:mysql://localhost:3306/agenda_diaria"
      + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    private static final String USER = "root";
    private static final String PASS = "Rocky2603*"; // tu contraseña si tienes

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("✅ Conexión exitosa");
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ Error de conexión");
            e.printStackTrace();   // 👈 ESTO ES CLAVE
            return null;
}

    }
    
    public static void main(String[] args) {
    conexion.getConnection();
}

    public PreparedStatement prepareStatement(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}



