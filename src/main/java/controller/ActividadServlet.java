package controller;

import model.usuario;
import DAO.conexion;
import DAO.ActividadDAO;
import model.Actividad;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Logger;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/ActividadServlet")
public class ActividadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioLogeado") == null) {
            response.sendRedirect("loginFail.jsp");
            return;
        }

        usuario u = (usuario) session.getAttribute("usuarioLogeado");

        // 📥 DATOS FORM
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");
        String horaInicio = request.getParameter("hora_inicio");
        String horaFin = request.getParameter("hora_fin");
        int idCategoria = Integer.parseInt(request.getParameter("id_categoria"));
        int estado = request.getParameter("estado") != null ? 1 : 0;

        

        


        // 🧠 MODELO
        Actividad a = new Actividad();
        a.setTitulo(titulo);
        a.setDescripcion(descripcion);
        a.setFecha(fecha);
        a.setHoraInicio(horaInicio);
        a.setHoraFin(horaFin);
        a.setEstado(estado);
        a.setIdCategoria(idCategoria);
        a.setIdUsuario(u.getId());

        // 💾 DAO
        Connection con = conexion.getConnection();
        ActividadDAO dao = new ActividadDAO(con);

        if (dao.insertarActividad(a)) {
            response.sendRedirect("Notas.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
   
}




