<html>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Raleway" />
<link rel="stylesheet" href="pics/styling.css"/>
<title>Instruction</title>

<script>
    history.forward();
</script>
<style>

h2 {
      font-size: 30px;
      text-transform: uppercase;
      color: #cc0052;
      font-weight: 600;

  }
  h6 {
      font-size: 30px;
      text-transform: uppercase;
      color: brown;
      font-weight: 600;

  }
  h3 {
	  font-size: 25px;
    color: #cc0052;
}
  h4 {
      font-size: 22px;
      line-height: 1.375em;
      color: #4d0017;
      font-weight: 400;
      margin-bottom: 30px;
  } 
 h5 {
      font-size: 17px;
      line-height: 1.375em;
      color: #800028;
      font-weight: 400;
      margin-bottom: 30px;
  }   

.menu_nav {
	margin:0 auto;
	padding:0;
	height:59px;
}
.menu_nav ul {
	list-style:none;
	padding:23px 0 0;
	height:36px;
	float:left;
}
.menu_nav ul li {
	margin:0;
	padding:0 13px;
	float:left;
}
.menu_nav ul li a {
	display:block;
	margin:0;
	padding:10px 20px;
	font-size:12px;
	line-height:16px;
	font-weight:normal;
	color:#747474;
	text-decoration:none;
	text-align:center;
	text-transform:uppercase;
	background:none;
}
.menu_nav ul li.active a, .menu_nav ul li a:hover {
	text-decoration:none;
	color:#fff;
	background:#cc0052;
}

textarea:focus, input:focus, input[type]:focus, .uneditable-input:focus {   
    outline: none !important;
    border-color: #cc0052;
    box-shadow: 0 0 15px #719ECE;
}
input[type=text], select {
    width: 40%;
    padding: 5px 5px;
    margin: 8px 0;
    display: inline-block;
    border: 2px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=password], select {
    width: 40%;
    padding: 5px 5px;
    margin: 8px 0;
    display: inline-block;
    border: 2px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

 
input[type=submit] {
    width: 10%;
    height: 5%;
    background-color: #ff0066;
    color: white;
    font-size: 20px;
    padding: 5px 5px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #b30047;
}

tp {
        font-family: Raleway;
        opacity: .5;
        filter: alpha(opacity=80); 
        height:500px;
        width: 100px;
        text-align: center;
    }
</style>
<%
    HttpSession s = request.getSession(false);
    String u=(String)session.getAttribute("uname");
    
    
    if(u!=null && s!=null){
        HttpSession sess = request.getSession();
        sess.setAttribute("uname", u);
        u=u.toUpperCase();
%>
<body background="pics/Instruction.jpg">
    
<pre>
    
<div class="nm1"> WELCOME <%=u%></div>  <br><pre><font size="5">                    







                       You have to answer 20 questions in 20 mins.<br>
                       For each correct answer you get 4 points, and for each wrong answer 
                       1 mark will be deducted.<br>
                       Once you lock an answer you cannot change it.<br>
                       Your answer will not be considered if you donot lock the answer.<br>
                       Click on the submit button to get the final score if you have completed.<br>
                       The final score will be automatically displayed once the time limit is over.</font></pre>
                                         <div class="nm2">  ALL THE BEST..!</div></center>
                                         <center><a href="quiz.jsp"/><font size="4"><input name="start" type="submit" class="btn btn-danger" value="START"/></font></a></center></pre>

</body>

<br><br>
<%
    }
    else{
              request.setAttribute("msg", "PLEASE LOGIN TO CONTINUE!!");
              RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
              rd.forward(request,response); 
        }

%>