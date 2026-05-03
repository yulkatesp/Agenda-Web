/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DAO;

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

/**
 *
 * @author kate
 */
@WebServlet("/VerActividades")
public class VerActividadesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        usuario u = (session != null) ? (usuario) session.getAttribute("usuarioLogeado") : null;

        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Connection con = conexion.getConnection();
        ActividadDAO dao = new ActividadDAO(con);

        List<Actividad> actividades = dao.listarPorUsuario(u.getId());

        // 👉 mandar la lista al JSP
        request.setAttribute("actividades", actividades);
        request.getRequestDispatcher("Calendario.jsp").forward(request, response);
    }
}
