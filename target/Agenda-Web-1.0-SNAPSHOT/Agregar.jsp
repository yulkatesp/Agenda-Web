<%-- 
    Document   : Agregar.jsp
    Created on : 26/12/2025, 9:48:25 a. m.
    Author     : kate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="assets/styles-login.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar usuario</title>
    </head>
    <body>
        <header>
            <div class="title">Agenda Daily Planner</div>
        </header>

        <div class="container-add"><h1>¡Bienvenida! <br> Acá puedes crear una cuenta.</h1>
            <form action="postRegistro" method="POST">

                <label for="nombre">Ingresa tu nombre: </label><br><br>
                <input type="text" id="nombre" name="nombre" placeholder="Nombre" required><br><br>

                <label for="usuario">Ingresa un nombre de usuario: </label><br><br>
                <input type="text" id="usuario" name="usuario" placeholder="Usuario" required><br><br>

                <label for="email">Ingresa un correo electrónico:</label><br><br>
                <input type="email" id="email" name="email" placeholder="Correo electrónico" required><br><br>

                <label for="contraseña">Ingresa una contraseña:</label><br><br>
                <input type="password" id="contraseña" name="password" placeholder="Contraseña"><br><br>


                <input id="btn-enviar" type="submit" value="Enviar">
                <input id="btn-limpiar" type="reset" value="Limpiar">
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



