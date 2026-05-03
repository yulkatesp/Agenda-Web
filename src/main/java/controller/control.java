package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.usuario;
import DAO.conexion;
import DAO.UsuarioDAO;

@WebServlet("/control")
public class control extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("🚀 Entró al doPost");


        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String contraseña = request.getParameter("password");

        usuario u = new usuario();
        u.setNombre(nombre);
        u.setUsuario(usuario);
        u.setEmail(email);
        u.setPassword(contraseña);

        conexion cn = new conexion();
        UsuarioDAO dao = new UsuarioDAO(cn);
        dao.insertarDatos(u);

        response.sendRedirect("PostRegistro.jsp");
    }
}


