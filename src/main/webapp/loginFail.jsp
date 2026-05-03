<%-- 
    Document   : loginFail
    Created on : 30/12/2025, 5:35:16 p. m.
    Author     : kate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="assets/styles-login.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logeo Fallido</title>
    </head>
    <body>
        <header>
            <div class="title">Agenda Daily Planner</div>
        </header>

        <div class="container">

            <img class="logo" src="assets/Error.png" style=" width:100px; height:100px; margin-left: 180px;">

            <div class="error">
                <p>¡Parece que hubo un error al ingresar las credenciales!</p>
                <a class="login" href="index.jsp" style="margin-left: 50px; margin-top: 10px; align-items: center; width: 128px; padding: 10px 10px;">Verifica nuevamente</a>
                <p>Si aún no tienes una cuenta, no te preocupes, puedes crear una en el siguiente enlace <3</p>
            </div>


            <button class= "btn-login">

                <a class="login" href="Agregar.jsp" target="target">Crear cuenta</a>

            </button>
        </div>


        <footer class="footer">
            <p>Agenda Daily Planner © Katerin Espitia 2025</p>
            <p class="footer-sub">
                Organiza tu día con calma y claridad 🌸
            </p>
        </footer>
    </body>
</html>
