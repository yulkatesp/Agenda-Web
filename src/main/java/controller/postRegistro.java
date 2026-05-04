/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author kate
 */
@WebServlet(name = "postRegistro", urlPatterns = {"/postRegistro"})
public class postRegistro extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        usuario u = new usuario();
        u.setUsuario(usuario);
        u.setNombre(nombre);
        u.setEmail(email);
        u.setPassword(password);

        conexion cn = new conexion();
        UsuarioDAO dao = new UsuarioDAO(cn);
        dao.insertarDatos(u);
        
        usuario usuarioLogeado = dao.login(usuario, password);

// CREAR SESIÓN
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuarioLogeado", usuarioLogeado);

// REDIRIGIR
        response.sendRedirect("PostRegistro.jsp");

    }

}
