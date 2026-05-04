package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/Reloj")
public class RelojServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔐 VALIDAR SESIÓN
        if (session.getAttribute("usuarioLogeado") == null) {
            response.sendRedirect("loginFail.jsp");
            return;
        }

        // ⏱️ TIEMPO EN SESIÓN
        Integer segundos = (Integer) session.getAttribute("segundos");
        if (segundos == null) {
            segundos = 0;
        }

        segundos++;
        session.setAttribute("segundos", segundos);

        response.setContentType("text/plain");
        response.getWriter().print(segundos);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        session.setAttribute("segundos", 0);
    }
}


