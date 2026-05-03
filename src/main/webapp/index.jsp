<%-- 
    Document   : index
    Created on : 15/12/2025
    Author     : kate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agenda Daily Planner</title>
    <link rel="stylesheet" href="assets/styles-login.css">
</head>

<body>

    <header>
        <div class="title">Agenda Daily Planner</div>
    </header>

    <form action="login" method="POST">
        <div class="container">

            <img class="logo" src="assets/Logo.png">

            <section>
                <img style="margin-left: 45px; margin-top:30px; width:54px; height:50px;" 
                     src="assets/User.png">

                <div class="usr">
                    <input class="in-usr" 
                           type="text" 
                           name="usuario" 
                           placeholder="Usuario"
                           required>
                </div>
            </section>

            <section>
                <img style="margin-left: 48px; margin-top:30px; width:47px; height:47px;" 
                     src="assets/Passw.png">

                <div class="passw">
                    <input class="in-passw" 
                           type="password" 
                           name="password" 
                           placeholder="Password"
                           required>
                </div>
            </section>

            <button class="login" type="submit" style="margin-left: 140px; margin-top: 50px;">
                Iniciar sesión
            </button>

        </div>
    </form>

    <div style="text-align:center; margin-top:15px;">
        <p style="color: #d85c8b; font-family: 'Gill Sans', 'Segoe UI', sans-serif;">Si no tienes una cuenta puedes crear una</p>
        <a class="login" href="Agregar.jsp">Crear cuenta</a>
    </div>

    <footer class="footer">
        <p>Agenda Daily Planner © Katerin Espitia 2025</p>
        <p class="footer-sub">
            Organiza tu día con calma y claridad 🌸
        </p>
    </footer>

</body>
</html>



