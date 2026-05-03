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
import model.usuario;

@WebServlet("/EstadoActividadServlet")
public class EstadoActividadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        usuario u = (usuario) session.getAttribute("usuarioLogeado");

        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int idActividad = Integer.parseInt(request.getParameter("id"));

        Connection con = conexion.getConnection();
        ActividadDAO dao = new ActividadDAO(con);

        dao.marcarEntregada(idActividad);

        // 👇 volvemos a la lista
        response.sendRedirect("TareasServlet");
    }
}
