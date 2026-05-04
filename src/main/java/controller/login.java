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

@WebServlet("/login")
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        conexion cn = new conexion();
        UsuarioDAO dao = new UsuarioDAO(cn);

        usuario u = dao.login(usuario, password);

        if (u != null) {
            // LOGIN OK
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuarioLogeado", u);

            response.sendRedirect("Pagin.jsp");
        } else {
            // LOGIN FAIL
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}

