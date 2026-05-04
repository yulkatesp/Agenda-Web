package controller;

import DAO.ActividadDAO;
import DAO.conexion;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.util.List;
import model.Actividad;
import model.usuario;

@WebServlet("/EventosServlet")
public class EventosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Obtener la sesión y el usuario correctamente
        HttpSession session = request.getSession(false);
        usuario u = (session != null) ? (usuario) session.getAttribute("usuarioLogeado") : null;

        if (u == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        // 2. Consultar base de datos
        Connection con = conexion.getConnection();
        ActividadDAO dao = new ActividadDAO(con);
        List<Actividad> actividades = dao.listarPorUsuario(u.getId());

        // 3. Configurar respuesta JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < actividades.size(); i++) {
            Actividad a = actividades.get(i);

            // Escapamos comillas dobles en el título para no romper el JSON
            String tituloEscapado = a.getTitulo().replace("\"", "\\\"");

            json.append("{")
                    .append("\"title\":\"").append(tituloEscapado).append("\",")
                    .append("\"start\":\"").append(a.getFecha()).append("\",")
                    .append("\"fecha\":\"").append(a.getFecha()).append("\"")
                    .append("}");

            if (i < actividades.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        response.getWriter().write(json.toString());
    }
}
