<div align="center">

# Sistema de Gestión de Tareas y Actividades

Aplicación web fullstack desarrollada para la gestión de pendientes y tareas dentro de una organización. Implementa arquitectura MVC para administrar actividades, usuarios y permisos de manera eficiente.

---
![Java](https://img.shields.io/badge/Java-8+-orange)
![JSP](https://img.shields.io/badge/JSP-Dynamic%20Web-blue)
![Servlets](https://img.shields.io/badge/Servlets-JavaEE-green)
![HTML](https://img.shields.io/badge/HTML-5-red)
![CSS](https://img.shields.io/badge/CSS-3-blue)
![MySQL](https://img.shields.io/badge/MySQL-Database-lightblue)
![NetBeans](https://img.shields.io/badge/NetBeans-IDE-purple)
![MVC](https://img.shields.io/badge/Arquitectura-MVC-black)

</div>

## Descripción

Este sistema permite gestionar tareas y actividades mediante una interfaz web, ofreciendo funcionalidades completas de autenticación, control de acceso y operaciones CRUD.

Está diseñado bajo el patrón **Modelo - Vista - Controlador (MVC)**, asegurando una estructura organizada, escalable y mantenible.

---

## Demo video

[![Demo del proyecto](src/main/webapp/assets/Portada.png)]([https://youtu.be/0bS4qOZti9Q](https://youtu.be/JRyC3fmDpYU))

Haz click en la imagen para ver el video.

---

## Funcionalidades principales

* Autenticación de usuarios
* Gestión de usuarios
* Control de roles y permisos
* Gestión de tareas y actividades
* Operaciones CRUD completas
* Organización estructurada bajo MVC

---

## Estructura del proyecto

```
/src        → Lógica del negocio (Modelo, Controladores)
/web        → Vistas (JSP, HTML, CSS)
/nbproject  → Configuración de NetBeans
```

---

## Arquitectura del Proyecto (MVC)

El sistema sigue el patrón **Modelo - Vista - Controlador (MVC)**, separando responsabilidades para mejorar la mantenibilidad y escalabilidad.

### Estructura general

```plaintext
Agenda-Web/
│
├──  Web Pages (Vista)
│   ├── META-INF/
│   ├── WEB-INF/
│   ├── assets/              → Recursos estáticos (CSS, imágenes, etc.)
│   ├── js/
│   │   └── calendario.js    → Lógica en frontend
│   ├── index.jsp            → Página principal
│   ├── Agregar.jsp
│   ├── Calendario.jsp
│   ├── Notas.jsp
│   ├── Tareas.jsp
│   ├── Reloj.jsp
│   ├── Pagin.jsp
│   ├── PostRegistro.jsp
│   └── loginFail.jsp
│
├──  Source Packages
│   │
│   ├──  model (Modelo)
│   │   ├── Actividad.java   → Entidad de actividades
│   │   └── Usuario.java     → Entidad de usuarios
│   │
│   ├──  DAO (Acceso a datos)
│   │   ├── conexion.java            → Conexión a BD
│   │   ├── TestConnection.java      → Prueba de conexión
│   │   ├── UsuarioDAO.java          → CRUD de usuarios
│   │   ├── ActividadDAO.java        → CRUD de actividades
│   │   └── VerActividadesServlet.java
│   │
│   ├──  controller (Controlador)
│   │   ├── login.java
│   │   ├── postRegistro.java
│   │   ├── control.java
│   │   ├── ActividadServlet.java
│   │   ├── EliminarActividadServlet.java
│   │   ├── EstadoActividadServlet.java
│   │   ├── EventosServlet.java
│   │   ├── RelojServlet.java
│   │   └── TareasServlet.java
│
├──  Test Packages
├──  Dependencies
└──  Project Files
```

---

###  Flujo de la aplicación

1. El usuario interactúa con las vistas (**JSP**)
2. Las peticiones son enviadas a los **Servlets (Controladores)**
3. Los controladores procesan la lógica y llaman a los **DAO**
4. Los DAO interactúan con la base de datos
5. La información regresa a la vista para ser mostrada

---

###  Separación de responsabilidades

* **Vista (JSP, JS, CSS):** Interfaz de usuario
* **Controlador (Servlets):** Manejo de peticiones y lógica
* **Modelo (Java Classes):** Representación de datos
* **DAO:** Acceso y manipulación de la base de datos

---

## Características técnicas

* Implementación de **patrón MVC**
* Separación de responsabilidades
* Uso de **JSP + Servlets**
* Conexión a base de datos relacional
* Manejo de sesiones para autenticación

---

## Cómo ejecutar el proyecto

1. Clonar el repositorio:

```bash
git clone https://github.com/tuusuario/tu-repo.git
```

2. Abrir en NetBeans

3. Configurar la base de datos (MySQL o la que uses)

4. Ejecutar en servidor (Tomcat recomendado)

---

## Requisitos

* Java JDK 8 o superior
* Apache Tomcat
* NetBeans IDE
* Motor de base de datos (MySQL recomendado)

---

## Autora

**Katerin Espitia** — Desarrolladora del proyecto

[![GitHub](https://img.shields.io/badge/GitHub-yulkatesp-181717?style=for-the-badge&logo=github)](https://github.com/yulkatesp)

---

## Licencia

Este proyecto es de uso académico.
