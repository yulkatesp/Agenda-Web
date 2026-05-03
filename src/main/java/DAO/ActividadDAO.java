package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Actividad;

public class ActividadDAO {

    private Connection con;

    public ActividadDAO(Connection con) {
        this.con = con;
    }

    public boolean insertarActividad(Actividad a) {

        String sql = "INSERT INTO actividades "
                + "(titulo, descripcion, fecha, hora_inicio, hora_fin, estado, id_categoria, id_usuario) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, a.getTitulo());
            ps.setString(2, a.getDescripcion());
            ps.setDate(3, java.sql.Date.valueOf(a.getFecha())); // 🔥 CLAVE

            if (a.getHoraInicio() == null || a.getHoraInicio().isEmpty()) {
                ps.setNull(4, java.sql.Types.TIME);
            } else {
                ps.setString(4, a.getHoraInicio());
            }

            if (a.getHoraFin() == null || a.getHoraFin().isEmpty()) {
                ps.setNull(5, java.sql.Types.TIME);
            } else {
                ps.setString(5, a.getHoraFin());
            }

            ps.setInt(6, a.getEstado());
            ps.setInt(7, a.getIdCategoria());
            ps.setInt(8, a.getIdUsuario());

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("❌ ERROR SQL INSERT ACTIVIDAD");
            e.printStackTrace();
            return false;
        }
    }

    public List<Actividad> listarPorUsuario(int idUsuario) {

        List<Actividad> lista = new ArrayList<>();

        String sql = "SELECT * FROM actividades WHERE id_usuario = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Actividad a = new Actividad();
                a.setTitulo(rs.getString("titulo"));
                a.setFecha(rs.getString("fecha"));
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public List<Actividad> listarTarea(int idUsuario) {
        List<Actividad> lista = new ArrayList<>();
        String sql = "SELECT * FROM actividades WHERE id_usuario = ? ORDER BY fecha";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Actividad a = new Actividad();
                a.setIdActividad(rs.getInt("id_actividad"));
                a.setTitulo(rs.getString("titulo"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setFecha(rs.getString("fecha"));
                a.setEstado(rs.getInt("estado"));
                lista.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void marcarEntregada(int idActividad) {
        String sql = "UPDATE actividades SET estado = 1 WHERE id_actividad = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idActividad);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int idActividad) {
        String sql = "DELETE FROM actividades WHERE id_actividad = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idActividad);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
