package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.usuario;

public class UsuarioDAO {

    private conexion cnn;

    public UsuarioDAO(conexion cnn) {
        this.cnn = cnn;
    }

    public String insertarDatos(usuario u) {

        String sql = "INSERT INTO usuarios (nombre, usuario, email, password) VALUES (?, ?, ?, ?)";

        try {
            Connection con = cnn.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getUsuario());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPassword());

            ps.executeUpdate();

            return "Usuario insertado correctamente";

        } catch (SQLException e) {
            e.printStackTrace();
            return "Error al insertar usuario";
        }
    }
    
    public usuario login(String usuario, String password) {

    usuario u = null;
    String sql = "SELECT * FROM usuarios WHERE usuario = ? AND password = ?";

    try (Connection con = cnn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, usuario);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            u = new usuario();
            u.setId(rs.getInt("id_usuario"));
            u.setNombre(rs.getString("nombre"));
            u.setUsuario(rs.getString("usuario"));
            u.setEmail(rs.getString("email"));
        }

    } catch (SQLException e) {
        System.out.println("Error login: " + e.getMessage());
    }

    return u;
}

}

