<%-- 
    Document   : logIn
    Created on : 12/03/2025, 15:46:54
    Author     : juanpa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div align="center">
            <h1>Iniciar Sesión</h1>
            <form action="<%=request.getContextPath()%>/login" method="post">
                <table style="with: 100%">
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="username" /></td> <!-- Cambiar "usuario" a "username" -->
                    </tr>
                    <tr>
                        <td>Contraseña</td>
                        <td><input type="password" name="password" /></td> <!-- Cambiar "contra" a "password" -->
                    </tr>
                </table>
                <input type="submit" value="Iniciar Sesión" />
            </form>
            <%-- Mostrar mensaje de error si existe --%>
            <% if (request.getSession().getAttribute("error") != null) { %>
                <p style="color: red;"><%= request.getSession().getAttribute("error") %></p>
            <% } %>
        </div>
    </body>
</html>

