let date = new Date();
let tasks = [];

// 🔥 Un solo fetch
fetch("EventosServlet", {
    credentials: "same-origin"
})
.then(res => res.json())
.then(data => {
    tasks = data;
    renderCalendar();
    renderLista(); // 👈 MOSTRAR TODAS
})
.catch(err => console.error("Error:", err));

function renderCalendar() {
    const daysContainer = document.getElementById("days");
    const monthYear = document.getElementById("monthYear");

    daysContainer.innerHTML = "";

    const year = date.getFullYear();
    const month = date.getMonth();

    monthYear.textContent = date.toLocaleDateString("es-ES", {
        month: "long",
        year: "numeric"
    });

    const firstDay = new Date(year, month, 1).getDay();
    const offset = firstDay === 0 ? 6 : firstDay - 1;
    const lastDate = new Date(year, month + 1, 0).getDate();

    for (let i = 0; i < offset; i++) {
        daysContainer.appendChild(document.createElement("div"));
    }

    for (let d = 1; d <= lastDate; d++) {
        const fullDate = `${year}-${String(month + 1).padStart(2, '0')}-${String(d).padStart(2, '0')}`;

        const dayDiv = document.createElement("div");
        dayDiv.textContent = d;

        // 🔹 solo resaltar
        if (tasks.some(t => t.fecha === fullDate)) {
            dayDiv.classList.add("day-task");
        }

        daysContainer.appendChild(dayDiv);
    }
}

function renderLista() {
    const lista = document.getElementById("lista-tareas");
    lista.innerHTML = "";

    if (tasks.length === 0) {
        lista.innerHTML = "<li>No hay tareas registradas 🌸</li>";
        return;
    }

    tasks.forEach(t => {
        const li = document.createElement("li");
        li.innerHTML = `🌸 <strong>${t.title}</strong> — ${t.fecha}`;
        lista.appendChild(li);
    });
}

document.getElementById("prev").onclick = () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
};

document.getElementById("next").onclick = () => {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
};
