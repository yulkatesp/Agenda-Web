<%@ page import="model.usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    usuario u = (usuario) session.getAttribute("usuarioLogeado");
    if (u == null) {
        response.sendRedirect("loginFail.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Reloj de Estudio</title>
        <link rel="stylesheet" href="assets/styles-login.css">
    </head>

    <body style="display: flex; flex-direction: column; min-height: 95vh; gap: 1px">

        <header>
            <div class="title" style="margin-top: 12px;">Agenda Daily Planner</div>
            <div class="user-info">
                ¡Hola, <strong><%= u.getUsuario()%></strong>! 🌸
            </div>
            <a class="login" href="Pagin.jsp" style="width: 60px; margin-top: 40px;"> ◀ ︎Volver</a>
        </header>

        <!-- ================= CRONÓMETRO (SERVLET) ================= -->
        <div class="card">
            <h2>Cronómetro</h2>
            <div id="time">00:00</div>

            <button type="button" onclick="start()">Iniciar</button>
            <button type="button" onclick="stop()">Pausar</button>
            <button type="button" onclick="reset()">Reset</button>
        </div>

        <!-- ================= TEMPORIZADOR ================= -->
        <div class="card">
            <h2>Temporizador (min)</h2>
            <input class="timerMin" type="number" id="timerMin" value="5">
            <div class="time" id="temporizador">00:00</div>
            <button type="button" onclick="startTimer()">Iniciar</button>
            <button type="button" onclick="resetTimer()">Reset</button>
        </div>

        <!-- ================= POMODORO ================= -->
        <div class="card">
            <h2>Pomodoro</h2>
            <div class="time" id="pomodoro">25:00</div>
            <button type="button" onclick="startPomodoro()">Iniciar</button>
            <button type="button" onclick="resetPomodoro()">Reset</button>
        </div>

        <script>
            /* ================= CRONÓMETRO (SERVLET) ================= */
            let intervalo = null;

            function start() {
                if (intervalo)
                    return;

                intervalo = setInterval(() => {
                    fetch("Reloj")
                            .then(res => res.text())
                            .then(sec => {
                                document.getElementById("time").innerText = formatMMSS(sec);
                            });
                }, 1000);
            }

            function stop() {
                clearInterval(intervalo);
                intervalo = null;
            }

            function reset() {
                stop();
                fetch("Reloj", {method: "POST"});
                document.getElementById("time").innerText = "00:00";
            }

            /* ================= TEMPORIZADOR ================= */
            let timerInterval = null;
            let timerSeconds = 0;

            function startTimer() {
                if (timerInterval)
                    return;

                let min = document.getElementById("timerMin").value;
                if (min <= 0)
                    return;

                timerSeconds = min * 60;
                updateTimer();

                timerInterval = setInterval(() => {
                    timerSeconds--;

                    if (timerSeconds <= 0) {
                        clearInterval(timerInterval);
                        timerInterval = null;
                        document.getElementById("temporizador").innerText = "00:00";
                        alert("⏰ Tiempo terminado");
                        return;
                    }

                    updateTimer();
                }, 1000);
            }

            function resetTimer() {
                clearInterval(timerInterval);
                timerInterval = null;
                document.getElementById("temporizador").innerText = "00:00";
            }

            function updateTimer() {
                document.getElementById("temporizador").innerText = formatMMSS(timerSeconds);
            }

            /* ================= POMODORO ================= */
            let pomodoroInterval = null;
            let pomodoroSeconds = 25 * 60;

            function startPomodoro() {
                if (pomodoroInterval)
                    return;

                updatePomodoro();

                pomodoroInterval = setInterval(() => {
                    pomodoroSeconds--;

                    if (pomodoroSeconds <= 0) {
                        clearInterval(pomodoroInterval);
                        pomodoroInterval = null;
                        document.getElementById("pomodoro").innerText = "00:00";
                        alert("🍅 Pomodoro terminado");
                        return;
                    }

                    updatePomodoro();
                }, 1000);
            }

            function resetPomodoro() {
                clearInterval(pomodoroInterval);
                pomodoroInterval = null;
                pomodoroSeconds = 25 * 60;
                document.getElementById("pomodoro").innerText = "25:00";
            }

            function updatePomodoro() {
                document.getElementById("pomodoro").innerText = formatMMSS(pomodoroSeconds);
            }

            /* ================= UTIL ================= */
            function formatMMSS(sec) {
                sec = parseInt(sec);
                let m = Math.floor(sec / 60);
                let s = sec % 60;
                return String(m).padStart(2, '0') + ":" + String(s).padStart(2, '0');
            }
        </script>

    </body>
</html>

<style>
    .card {
        background: #FFD1DE;
        font-family: 'Gill Sans';
        width: 320px;
        color: #d85c8b;
        margin: auto;
        padding: 25px;
        border-radius: 20px;
        box-shadow: 5px 5px #ffa0bd;
    }

    button {
        width: 100px;
        height: 27px;
        border: none;
        background-color: #ffa0bd;
        display: inline-block;
        border-radius: 20px;
        color: #a83c68;
        font-family: 'Gill Sans';
        font-size: 15px;
        padding: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #ff87aa;
        color: #FFE9EF;
    }

    #time, .time {
        border-radius: 20px;
        background-color: #FFE9EF;
        font-size: 30px;
        margin: 20px 0;
    }

    .timerMin {
        border-radius: 20px;
        border: none;
        color: #d85c8b;
        background-color: #FFE9EF;
    }
</style>
