<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html { 
  background: url(bg.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

h1{
  font-size: 2.5em;
  line-height: 10%;
  color: red;
  text-shadow:
   -1px -1px 0 #000,  
   1px -1px 0 #000,
   -1px 1px 0 #000,
   1px 1px 0 #000;

}

.head, .background {
	width:80%;
}

div.head{
	background: rgba(255, 255, 255, 0.9);
	border: 1px solid black;
	margin:auto;
	padding: 1px 40px;
}

h3{
font-family:Georgia,serif;
}

div.background {
  margin: auto;
  background-color: #ffffff;
  border: 1px solid black;
  background: rgb(0, 0, 0);
  background: rgba(255, 255, 255, 0.9);
  padding: 40px;
}

button[name="subbtn"]{
	color: white; 
    padding: 16px 32px;
    text-align: center;
    font-size: 16px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
	background-color: #E1FFC0;
	text-decoration:none;
    border: 2px solid #4CAF50;
}

button[name="subbtn"]:hover {
    background-color: white;
    color: black;
    border: 2px solid #4CAF50;
}
</style>
</head>
<body >
<%@ page import="java.io.*,java.util.*" %>
<div class="head"><center><h1 line-height:70%>QUIZ UP!</h1></CENTER></div><br>
<div class="background">
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

String ref="";
try
{
	ref=request.getHeader("Referer");
}
catch(Exception e)
{
	e.printStackTrace();
}
if(session.getAttribute("user_email")==null || session.getAttribute("user_email")=="")
{

%>
<p style="text-align:center;font-size:2em;">ACCESS RESTRICTED</p>
<%
}
else
{
	Date d1=new Date();
	double startMilli;
	startMilli=d1.getTime();
	session.setAttribute("startMilli",startMilli);
	session.setAttribute("startDate",d1);
%>

<form name="quiz" method="post" action="verify.jsp">
<h3>Q.1  Which of these is not valid HTML?</h3>
<input type="radio" name="ans1" value="a" > font face="verdana,arial"<br>
<input type="radio" name="ans1" value="b">fontface="verdana"<br>
<input type="radio" name="ans1" value="c">font face="verdana"<br>

<h3>Q.2What is JSP?</h3>
<input type="radio" name="ans2" value="a" > JavaServerPages<br>
<input type="radio" name="ans2" value="b">JavaStaticPages<br>
<input type="radio" name="ans2" value="c">JavaScriptPages<br>

<h3>Q.3  Why should you specify a background color if you are using an image for the actual background of your page ?</h3>
<input type="radio" name="ans3" value="a" > The background color will be shown until the image loads<br>
<input type="radio" name="ans3" value="b">In case the image doesnt fit right<br>
<input type="radio" name="ans3" value="c"> So the text shows up better<br>

<h3>Q.4 When a JSP page is compiled, what is it turned into ?</h3>
<input type="radio" name="ans4" value="a" >Applet <br>
<input type="radio" name="ans4" value="b">Servlet <br>
<input type="radio" name="ans4" value="c">Application<br>

<h3>Q.5  Which tag is used to insert images into your web page ?
</h3>
<input type="radio" name="ans5" value="a" > pic<br>
<input type="radio" name="ans5" value="b"> scr <br>
<input type="radio" name="ans5" value="c">img<br>

<h3>Q.6 Which property will open a page in a new window?</h3>
<input type="radio" name="ans6" value="a" >  target="_self"<br>
<input type="radio" name="ans6" value="b"> target="_blank" <br>
<input type="radio" name="ans6" value="c">target="_top"<br>

<h3>Q.7 The background image will scroll when the user scrolls down the page, unless you add which property to the "body" tag?</h3>
<input type="radio" name="ans7" value="a" > bgproperties="holdstill" <br>
<input type="radio" name="ans7" value="b">bgproperties="fixed"  <br>
<input type="radio" name="ans7" value="c">bgproperties="stationary"<br>

<h3>Q.8 JavaServerPages are processed by ?</h3>
<input type="radio" name="ans8" value="a" > JSP container <br>
<input type="radio" name="ans8" value="b">JVM<br>
<input type="radio" name="ans8" value="c">WEB SERVER<br>

<h3>Q.9Which of the following server control shows data in a tabular format and allows sorting, paging, edit, delete each record?</h3>
<input type="radio" name="ans9" value="a" > ListBox  <br>
<input type="radio" name="ans9" value="b">GridView<br>
<input type="radio" name="ans9" value="c">Repeater<br>

<h3>Q.10 By using which of the following attribute, HTML elements are transformed to HTML server control?</h3>
<input type="radio" name="ans10" value="a" >runat="client"<br>
<input type="radio" name="ans10" value="b">runat="server"<br>
<input type="radio" name="ans10" value="c">runat="browser"<br><br>

<center><button type="submit" name="subbtn"><font color="green">SUBMIT</button></center>
</form>

<%
}
%>


</div>

</body>
</html>