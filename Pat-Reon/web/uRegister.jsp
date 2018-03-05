<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="javax.swing.JOptionPane"%>
	<%
	String email = request.getParameter("regEMail");
	String uname = request.getParameter("regUserName");
	String pword = request.getParameter("regPassword");
	String cpword = request.getParameter("regCheckPW");
        String cat = request.getParameter("cat");
	if(!pword.trim().equals(cpword.trim())){
		JOptionPane.showMessageDialog(null, "Passwords do not match!", "Passwords do not match!", JOptionPane.PLAIN_MESSAGE);
		response.sendRedirect("/Pat-Reon/signup.html");
	}
	
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patreon","root","");
	String ps = "select count(*) from users where email=? or username=?";
        PreparedStatement prepStat = con.prepareStatement(ps);
        prepStat.setString(1, email);
        prepStat.setString(2, uname);
	ResultSet rs = prepStat.executeQuery();
	rs.next();
	
	if(rs.getInt("count(*)") == 0){
		rs.close();
                
                ps = "select categoryid from categories where categoryname like ?";
                prepStat = con.prepareStatement(ps);
                prepStat.setString(1, cat);
                
                rs = prepStat.executeQuery();
                rs.next();
                int uCat = rs.getInt("categoryid");
                
                rs.close();
		String register = "insert into users (username, email, password, categoryid) values(?,?,?,?)";
		prepStat = con.prepareStatement(register);
                prepStat.setString(1, uname);
                prepStat.setString(2, email);
                prepStat.setString(3, pword);
                prepStat.setInt(4, uCat);
                prepStat.executeUpdate();
		JOptionPane.showMessageDialog(null, "Registration Complete!", "Registration successful", JOptionPane.PLAIN_MESSAGE);
                Cookie ck = new Cookie("loggedIn", uname);
		ck.setMaxAge(21600);
		response.addCookie(ck);
		response.sendRedirect("/Pat-Reon/index.jsp");
                return;
	}
	%>
</body>
</html>