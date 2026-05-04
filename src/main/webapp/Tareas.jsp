<%@ page import="java.util.List" %>
<%@ page import="model.Actividad" %>
<%@page import="java.util.List"%>
<%@page import="model.Actividad"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="model.usuario" %>



<%

    usuario u = (usuario) session.getAttribute("usuarioLogeado");

    if (u == null) {

        response.sendRedirect("loginFail.jsp");

        return;

    }

%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Agenda Daily Planner</title>
        <link rel="stylesheet" href="assets/styles-login.css">
    </head>

    <body>

        <header>
            <div class="title" style="margin-top: 12px;">Agenda Daily Planner</div>
            <div class="user-info">
                ¡Hola, <strong><%= u.getUsuario()%></strong>! 🌸
            </div>
            <a class="login" href="Pagin.jsp" style="width: 60px; margin-top: 40px;"> ◀ ︎Volver</a>

        </header>
            
            <div class="titulo" style="margin-top: 20px; margin-left: 500px; position: sticky; ">Tareas</div>

        <div class="tareas">
            <%    List<Actividad> tareas = (List<Actividad>) request.getAttribute("tareas");
                for (Actividad a : tareas) {
            %>
            <div class="tarea <%= a.getEstado() == 1 ? "entregada" : ""%>">
                <h3><%= a.getTitulo()%></h3>
                <p><%= a.getDescripcion()%></p>
                <small><%= a.getFecha()%></small>

                <div class="acciones">
                    <% if (a.getEstado() == 0) {%>
                    <a href="EstadoActividadServlet?id=<%= a.getIdActividad()%>" style="color: #de5f92;">• Entregar</a>
                    <% }%>
                    <a href="EliminarActividadServlet?id=<%= a.getIdActividad()%>" style="color: #de5f92;">• Eliminar</a>
                </div>
            </div>
            <% }%>
        </div>

    </body>
</html>



<style>
    .tareas {
        width: 80%;
        margin-left: 330px;
        max-width: 900px;
        color: #d85c8b;
        font-family: 'Gill Sans';
        margin-top: 50px;
    }

    .tarea {
        background: #FFD1DE;
        padding: 15px;
        border-radius: 12px;
        margin-bottom: 15px;
        box-shadow: 5px 5px #FF9CB5;
    }

    .tarea.entregada {
        opacity: 0.6;
        text-decoration: line-through;
    }

    .acciones a {
        margin-right: 10px;
        text-decoration: none;
        font-weight: bold;
    }


</style>