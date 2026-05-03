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

        <h1>Mi Calendario</h1>

        <div class="calendar">
            <div class="Cal">
                <button id="prev">◀</button>
                <h2 id="monthYear"></h2>
                <button id="next">▶</button>
            </div>

            <div class="weekdays">
                <div>Lun</div><div>Mar</div><div>Mié</div>
                <div>Jue</div><div>Vie</div><div>Sáb</div><div>Dom</div>
            </div>

            <div class="days" id="days"></div>
        </div>

        <div id="tareas-dia">
            <h2>➤ Tareas del usuario</h2>
            <ul id="lista-tareas">

                <%
                    List<Actividad> actividades
                            = (List<Actividad>) request.getAttribute("actividades");

                    if (actividades == null || actividades.isEmpty()) {
                %>
                <li>No hay actividades registradas, o haz click en el botón de abajo🌸</li>
                    <%
                    } else {
                        for (Actividad a : actividades) {
                    %>
                <li>
                    🌸 <strong><%= a.getTitulo()%></strong>
                    — <%= a.getFecha()%>
                </li>
                <%
                        }
                    }
                %>

            </ul>               
        </div>


        <script src="js/calendario.js"></script>
        <footer class="footer">
            <p>Agenda Daily Planner © Katerin Espitia 2025</p>
            <p class="footer-sub">
                Organiza tu día con calma y claridad 🌸
            </p>
        </footer>
    </body>
</html>

<style>

    body {
        font-family: 'Gill Sans';
        background: #FFE9EF;
        color: #de5f92;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h1 {
        margin: 20px;
    }

    .calendar {
        background: #FFD1DE;
        border-radius: 15px;
        width: 380px;
        padding: 20px;
        box-shadow: 5px 5px #ffa0bd;
    }

    .Cal {
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #de5f92;
    }

    .Cal button {
        background: #ff7aa2;
        border: none;
        color: white;
        border-radius: 8px;
        padding: 5px 10px;
        cursor: pointer;
    }

    .weekdays, .days {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        text-align: center;
        color: #de5f92;
    }

    .weekdays div {
        font-weight: bold;
        color: #de5f92;
        margin-top: 10px;
    }

    .days div {
        margin: 5px;
        padding: 10px;
        border-radius: 8px;
        cursor: pointer;

    }

    .days div:hover {
        background: #ffe1eb;
        color: #de5f92;
    }

    .day-task {
        background: #ffb3c6;
        color: #de5f92;
        font-weight: bold;
    }

    #tareas-dia {
        max-width: 900px;
        margin: 20px auto;
        background: #FFD1DE;
        padding: 20px;
        border-radius: 15px;
        box-shadow: 5px 5px #ffa0bd;
    }

    #lista-tareas li {
        padding: 8px;
        border-bottom: 1px solid #ddd;
        list-style: none;
    }

</style>