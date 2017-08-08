<%@page import="java.sql.ResultSet"%>
<html>
<link rel="stylesheet" href="pics/styling.css"/> 
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Raleway" />
<title>RESULT</title>

<script>
    history.forward();
</script>
<style>
div.background {
    
    
  
    background: url("pics/Scoreboard.jpg");
    
}


h2 {
      font-size: 30px;
      text-transform: uppercase;
      color: white;
      font-weight: 600;

  }
  h3 {
	  font-size: 25px;
    color: white;
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
    width: 15%;
    background-color: #ff0066;
    color: white;
    padding: 5px 5px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #b30047;
}


</style>

<%
    
    String u=(String)session.getAttribute("uname");
    HttpSession sess = request.getSession();
    sess.setAttribute("uname", null);
    
    if(u!=null){
        u=u.toUpperCase();
%>
    
<body background="pics/Scoreboard.jpg">
     <%
        String q2="update status set st='T' where uname='"+u+"'";
        int ur=jdbc.DAOLayer.updateData(q2);
        String q="select * from isLocked where uname='"+u+"'";
        ResultSet rs=jdbc.DAOLayer.selectData(q);
        int cnt=1;
        int score=0;
        int right=0;
        int wrong=0;
        if(rs.last()){
            while(cnt<=30){
                int qid=cnt;
                String q1="select ans from questions where qid="+qid;
                ResultSet rs1=jdbc.DAOLayer.selectData(q1);
                if(rs1.next()){
                    if(rs.getInt(qid+1)!=99){
                    if(rs.getInt(qid+1)==rs1.getInt(1))
                        right=right+1;
                    else if(rs.getInt(qid+1)!=0)
                        wrong=wrong+1;
                    }
                }
                cnt=cnt+1;
            }
            int attempt=right+wrong;
            score=(4*right)-wrong;
    %>
    <img id="logo" src="pics/logo_1.jpg"/>
    <pre> 
    <h2>                                      RESULT</h2>
                                <div class="nm3"><%=u%></div>
    <h3>                               Total number of questions attempted=<%=attempt%><br><br>
                                     Number of correct answers=<%=right%>
                                    Number of incorrect answers=<%=wrong%><br><br>
                                            Your score=<%=score%><br><br></h3>
					 
    </pre>
<%
    String ss="insert into score values('"+u+"',"+score+")";
    int ut=jdbc.DAOLayer.updateData(ss);
        }

%>


</body>
<%
    }
    else{
              request.setAttribute("msg", "PLEASE LOGIN TO CONTINUE!!");
              RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
              rd.forward(request,response); 
        }
%>

<br><br>
