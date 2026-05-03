/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

@WebServlet("/TareasServlet")
public class TareasServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        usuario u = (usuario) session.getAttribute("usuarioLogeado");

        // 🔐 VALIDACIÓN QUE FALTABA
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Connection con = conexion.getConnection();
        ActividadDAO dao = new ActividadDAO(con);

        List<Actividad> tareas = dao.listarTarea(u.getId());

        request.setAttribute("tareas", tareas);
        request.getRequestDispatcher("Tareas.jsp").forward(request, response);
    }
}
