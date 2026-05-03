<%@ page import="model.usuario" %>

<%
    usuario u = (usuario) session.getAttribute("usuarioLogeado");

    if (u == null) {
        response.sendRedirect("loginFail.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="assets/styles-login.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <header>
            <div class="title">Agenda Daily Planner</div>
            <div class="user-info">
                ¡Hola, <strong><%= u.getUsuario()%></strong>! 🌸
            </div>
        </header>

        <div class="titulo">¿Qué tenemos para hoy?</div>


        <div class="container-item">
            <form action="login" method="POST">
                
                <a class="btn-crud" role="button" href="Notas.jsp" target="_self">
                    <img class="add-logo" src="assets/Edit.png">
                </a>

                <a class="btn-calendario" href="Calendario.jsp">
                    <img class="add-logo" src="assets/Calendario.png">
                </a>

                <a class="btn-temporizador" href="Reloj.jsp">
                    <img class="add-logo" src="assets/Temporizador.png">
                </a>

                <a class="btn-tareas" href="TareasServlet">
                    <img class="add-logo" src="assets/Tareas.png">
                </a>
            </form>

        </div>

        <footer class="footer">
            <p>Agenda Daily Planner © Katerin Espitia 2025</p>
            <p class="footer-sub">
                Organiza tu día con calma y claridad 🌸
            </p>
        </footer>

    </body>
</html>





