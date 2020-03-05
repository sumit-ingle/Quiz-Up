<!DOCTYPE html>
<html>
<head>
<title>Quiz Page</title>

<style type="text/css">
.center {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border: 3px solid #73AD21;
  padding: 50px;
}
</style>
</head>
<body>

<%@ page import="javax.sql.*" %>

<%

java.sql.Connection con;
java.sql.Statement stmt;
java.sql.ResultSet rs;
java.sql.PreparedStatement pstm;

con=null;
stmt=null;
pstm=null;
rs=null;
String sql;
String url = "jdbc:postgresql://localhost/quizdb";
String fname=request.getParameter("first_name");
String lname=request.getParameter("last_name");
String mail=request.getParameter("user_email");

try
{
	Class.forName("org.postgresql.Driver");
	con = java.sql.DriverManager.getConnection(url,"postgres","12345");
}
catch(ClassNotFoundException cnfex)
{
	cnfex.printStackTrace();
}

sql="select * from participant where mail='"+mail+"'";


	stmt = con.createStatement();
	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		out.println("<div class='center'><h1>You have already participated in the quiz</h1></div>");
	}
	else
	{
		session.setAttribute("first_name",fname);
		session.setAttribute("last_name",lname);
		session.setAttribute("user_email",mail);
		response.sendRedirect("http://localhost:8080/quiz/quizform.jsp");
	}


if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(con!=null) con.close();


%>
</body>
</html>