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
        <title>Notas</title>
    </head>
    <body>
        <header>
            <div class="title">Agenda Daily Planner</div>
            <div class="user-info">
                ¡Hola, <strong><%= u.getUsuario()%></strong>! 🌸
            </div>
            <a class="login" href="Pagin.jsp" style="width: 60px; margin-top: 40px;"> ◀ ︎Volver</a>
        </header>
        <div class="titulo" style="margin-top: 40px;">Agrega una tarea</div>
        <div class="container-tarea">
            <form action="<%= request.getContextPath() %>/ActividadServlet" method="POST" class="form-tarea">


                <div class="campo">
                    <label class="item">Título</label>
                    <input class="textos" type="text" name="titulo" required>
                </div>

                <div class="campo">
                    <label class="item">Descripción</label>
                    <textarea class="textos" name="descripcion"></textarea>
                </div>

                <div class="campo">
                    <label class="item">Fecha</label>
                    <input class="textos" type="date" name="fecha" required>
                </div>

                <div class="campo">
                    <label class="item">Hora inicio</label>
                    <input class="textos" type="time" name="hora_inicio">
                </div>

                <div class="campo">
                    <label class="item">Hora fin</label>
                    <input class="textos" type="time" name="hora_fin">
                </div>

                <div class="campo">
                    <label class="item">Categoría</label>
                    <select class="textos" name="id_categoria">
                        <option value="1">Estudio</option>
                        <option value="2">Trabajo</option>
                        <option value="3">Personal</option>
                    </select>
                </div>

                <div class="campo checkbox">
                    <label>
                        <input type="checkbox" name="estado" value="1">
                        Marcar como completada
                    </label>
                </div>

                <div class="acciones">
                    <button class="login" type="submit" style="margin-top: -490px">Guardar actividad</button>
                </div>

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

<style>
    body {
        overflow-y: hidden;
    }

    .container-tarea {
        background-color: #FFD1DE;
        width: 1200px;
        height: 450px;
        margin: 80px auto;
        border-radius: 20px;
        box-shadow: 5px 5px #ffa0bd;
        min-height: 150px; /* opcional */
        padding: 30px 50px;
    }

    .item {
        margin-top: 50px;
    }

    .form-tarea {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 25px;
        color: #de5f92;
        font-size: 20px;
    }

    .campo {
        display: flex;
        flex-direction: column;
        gap: 8px;
        font-family: 'Gill Sans';
        border-radius: 20px;
    }

    .textos {
        background-color: #FFE9EF;
        border: none;
        font-family: 'Gill Sans';
        margin-top: -470px;
        color: #de5f92;
        border-radius: 20px;
        padding: 10px 15px;
        font-size: 15px;
    }

    textarea.textos {
        resize: none;
        height: 80px;
    }

    /* Checkbox ocupa toda la fila */
    .checkbox {
        grid-column: span 3;
    }

    /* Botón centrado */
    .acciones {
        grid-column: span 3;
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }


</style>