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
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <h1>Employee Login Form</h1>
            <form action="<%=request.getContextPath()%>/login" method="post">
                <table style="with: 100%">
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="usuario" /></td>
                    </tr>
                    <tr>
                        <td>Constraseña</td>
                        <td><input type="password" name="contra" /></td>
                    </tr>

                </table>
                <input type="submit" value="Submit" />
            </form>
        </div>
    </body>
</html>

