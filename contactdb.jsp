
contactdb.jsp

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection = null;
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel","root", "root");

PreparedStatement ps =connection.prepareStatement("insert into contacts (name,city,message)values(?,?,?)");

ps.setString(1,request.getParameter("firstname")+" "+request.getParameter("lastname"));
ps.setString(2,request.getParameter("country"));
ps.setString(3,request.getParameter("subject"));

int i=ps.executeUpdate();

if(i>0)
{%>
	<script>
	alert("Inquiry Submitted successfully, We Will contact you soon!!!");
	
	location.href="index.html";
	</script>
<%


}
else
{%>
<script>
	alert("Please try again !!!");

	location.href="contact.html";
	
	</script>
<%

}






%>