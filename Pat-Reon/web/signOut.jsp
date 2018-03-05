<%-- 
    Document   : signOut
    Created on : Feb 28, 2018, 10:03:02 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cookie cookies[] = request.getCookies();
            for(Cookie c: cookies){
                if(c.getName().equals("loggedIn")){
                    c.setValue(null);
                    c.setMaxAge(0);
                    c.setPath("/");
                    response.addCookie(c);
                    break;
                }
            }
            response.sendRedirect("/Pat-Reon/index.jsp");

        %>
    </body>
</html>
