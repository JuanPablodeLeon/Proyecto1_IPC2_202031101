<%-- 
    Document   : loginsuccess
    Created on : 12/03/2025, 19:16:33
    Author     : juanpa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión Exitoso</title>
    </head>
    <body>
        <h1>Bienvenido, <%= session.getAttribute("username") %>!</h1>
        <p>Has iniciado sesión correctamente.</p>
        <a href="logout">Cerrar Sesión</a> <!-- Opcional: Agregar un enlace para cerrar sesión -->
    </body>
</html>
