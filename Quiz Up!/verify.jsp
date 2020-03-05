<!DOCTYPE html>
<html>
<head>
<title>Quiz Summary</title>

<style>
html { 
  background: url(bg3.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

table.maintable{
	width: 80%;
	border: 1px solid #737373;
	border-collapse: collapse;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table.maintable tr:nth-child(even){
	background-color: #f2f2f2;
}

table.maintable tr:nth-child(odd){
	background-color: white;
}

table.maintable td {
    padding: 15px;
    text-align: left;
	border: 1px solid #737373;
}

table.maintable th {
	background-color: #8BC34A;
    color: white;
    font-size: 2em;
    padding: 15px;
}

</style>

</head>
<body>
<%@ page import="java.text.DecimalFormat,java.util.*" %>
<%@ page import="javax.sql.*" %>

<%
java.sql.Connection con;
java.sql.Statement stmt;
java.sql.ResultSet rs;

con=null;
stmt=null;
rs=null;
Date d2 = new Date();
double diff_time, time_sec, time_min, startMilli;
startMilli=(double)session.getAttribute("startMilli");
diff_time = d2.getTime()-startMilli;
time_sec = diff_time / 1000 % 60;
time_min = time_sec/60;

DecimalFormat twoDForm = new DecimalFormat("#.###");
time_min=Double.valueOf(twoDForm.format(time_min));

String sql;
String url = "jdbc:postgresql://localhost/quizdb";
int i=1;
int correct_count=0;
String ufname = (String)session.getAttribute("first_name");
String ulname = (String)session.getAttribute("last_name");
String umail = (String)session.getAttribute("user_email");
String user_ans[]=new String[11];
String db_ans[]=new String[11];

try
{
	Class.forName("org.postgresql.Driver");
	con = java.sql.DriverManager.getConnection(url,"postgres","12345");
}
catch(ClassNotFoundException cnfex)
{
	cnfex.printStackTrace();
}

sql = "insert into participant values('"+umail+"','"+ufname+"','"+ulname+"')";
try
{
	stmt=con.createStatement();
	stmt.executeQuery(sql);
}catch(Exception e){e.printStackTrace();}

sql="select answer from answers";

for(i=1;i<11;i++)
{
	if(request.getParameter("ans"+i)!=null)
		user_ans[i]=request.getParameter("ans"+i);
	else
		user_ans[i]="x";
}
i=1;
try
{
	rs=stmt.executeQuery(sql);
	while(rs.next())
	{
		db_ans[i]=rs.getString("answer");
		i++;
	}
}
catch(Exception e){e.printStackTrace();}

for(i=1;i<11;i++)
{
	if(user_ans[i].equals(db_ans[i]))
		correct_count++;
}

String startdate=session.getAttribute("startDate").toString();
String date2=d2.toString();
sql="insert into user_score values('"+umail+"',"+correct_count+","+time_min+")";
try{
	stmt.executeQuery(sql);
}catch(Exception e){e.printStackTrace();}
%>

<table class="maintable">
<th colspan="2">YOUR SCORE</th>
<tr><td>Your name</td><td><% out.println(session.getAttribute("first_name")+" "+session.getAttribute("last_name")); %></td></tr>
<tr><td>Your email</td><td><%= umail %></td></tr>
<tr><td>Correct answers</td><td><%= correct_count %></td></tr>
<tr><td>Time taken</td><td><% out.println(time_min+" minutes");%></td></tr>
<tr><td>Start time</td><td><% out.println(startdate); %></td></tr>
<tr><td>End time</td><td><% out.println(date2); %></td></tr>
</table>


<%
session.invalidate();
if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(con!=null) con.close();


%>
</body>
</html>