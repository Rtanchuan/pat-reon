<%-- 
    Document   : uLogin
    Created on : Feb 28, 2018, 11:22:27 PM
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
        <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="javax.swing.JOptionPane"%>
	<%
	String uname = request.getParameter("uname");
	String pword = request.getParameter("pword");
	
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patreon","root","");
	String ps = "select * from users where username=? and password=?";
        PreparedStatement prepStat = con.prepareStatement(ps);
        prepStat.setString(1, uname);
        prepStat.setString(2, pword);
	ResultSet rs = prepStat.executeQuery();
	rs.next();
        if(rs != null){
            Cookie ck = new Cookie("loggedIn", uname);
            ck.setMaxAge(21600);
            response.addCookie(ck);
            response.sendRedirect("/Pat-Reon/index.jsp");
        }else{
            JOptionPane.showMessageDialog(null, "Invalid Login Details!", "Invalid Login Details!", JOptionPane.PLAIN_MESSAGE);
            response.sendRedirect("/Pat-Reon/login.html");
        }
	%>
    </body>
</html>
