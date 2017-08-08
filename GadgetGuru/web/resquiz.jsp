<link rel="stylesheet" href="pics/Site.css"/>
<%@page import="java.sql.ResultSet"%>
<style>
    h2 {
      font-size: 30px;
      text-transform: uppercase;
      color: black;
      font-weight: 600;

  }
    .tp {

        opacity: 0.8;
        width: 1200px;
	height:430px;
        filter: alpha(opacity=80); 
        text-align: left;
        float: center;
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
    height: 8%;
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
</style>
<%
    String u = (String) session.getAttribute("uname");
    String un=u;
    HttpSession sess = request.getSession();
    sess.setAttribute("uname", u);
    
    u = u.toUpperCase();
%>
<%!
    public String check(boolean b) {
        return b ? "checked" : "";
    }
%>
<body background="pics/Contest.jpg">
    <a href="quiz.jsp"><img src="pics/back1.png" height="50" width="100"/></a> 
    
        <br>
            <h1>WELCOME <%=u%></h1>
        
    

    <link rel="stylesheet" href="res/Site.css"/>
<div class="tp">
    <%
        String b = request.getParameter("btn");
        sess.setAttribute("level", b);
        int l = Integer.parseInt((String) session.getAttribute("level"));
        String q1 = "select a" + b + " from isLocked where uname='" + un + "'";
        String q = "select * from questions where qid=" + l;
        int id = 0;
        String op1 = "";
        String op2 = "";
        String op3 = "";
        String op4 = "";
        String ans = "";
        boolean t1 = false;
        boolean t2 = false;
        boolean t3 = false;
        boolean t4 = false;
        ResultSet rs = jdbc.DAOLayer.selectData(q);
        ResultSet rs1 = jdbc.DAOLayer.selectData(q1);
        if (rs1.last()) {
            
            if ((rs1.getInt(1) != 0 && rs1.getInt(1) != 99)) {
                if (rs.next()) {
                    id = rs.getInt(1);
                    q = rs.getString(2);
                    op1 = rs.getString(3);
                    op2 = rs.getString(4);
                    op3 = rs.getString(5);
                    op4 = rs.getString(6);
                    ans = rs.getString(7);
                }
                if (rs1.getString(1).equals(op1)) {
                    t1 = true;
                } else if (rs1.getString(1).equals(op2)) {
                    t2 = true;
                } else if (rs1.getString(1).equals(op3)) {
                    t3 = true;
                } else if (rs1.getString(1).equals(op4)) {
                    t4 = true;
                }

    %>
    <pre>


                                                                                                
                                                                                        
                                                                                    
                                                                                    <font size="6">LEVEL :<%=id%></font>
   <form>
        <center>        
            <font size="6"><%=q%></font>
            <br>
            <br>
            <input type="radio" name="r1" value="<%=op1%>" disabled="true" <%=check(t1)%>/><font size="6"><%=op1%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="r1" value="<%=op2%>" disabled="true" <%=check(t2)%>/><font size="6"><%=op2%></font><br>
            <input type="radio" name="r1" value="<%=op3%>" disabled="true" <%=check(t3)%>/><font size="6"><%=op3%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="r1" value="<%=op4%>" disabled="true" <%=check(t4)%>/><font size="6"><%=op4%></font><br><br>
            <br>
            <font size="6" color="red">LOCKED!</font><br></h2>
            <%
            if(l==1){
            %>
            <a href="next.jsp"><img src="pics/post.png" heigh="70" width="70"/></a>
            <%
            }
            else if(l==30){
            %>
            <a href="prev.jsp"><img src="pics/pre.png" heigh="70" width="70"/></a>
            <%
            }
            else{
            %>  <a href="prev.jsp"><img src="pics/pre.png" heigh="70" width="70"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="next.jsp"><img src="pics/post.png" heigh="70" width="70"/></a>
            <%
            }
            %>
            
        </center>    
            </pre>
    </form>

    <%} else {
        
        String qq = "update isLocked set a" + b + "='99' where uname='" + un + "'";
        String q3 = "update status set a" + b + "='99' where uname='" + un + "'";
        int ur = jdbc.DAOLayer.updateData(qq);
        int ur1 = jdbc.DAOLayer.updateData(q3);
        if (rs.next()) {
            id = rs.getInt(1);
            q = rs.getString(2);
            op1 = rs.getString(3);
            op2 = rs.getString(4);
            op3 = rs.getString(5);
            op4 = rs.getString(6);
            ans = rs.getString(7);
        }

    %>
    <pre>


                                                                                               
                                                                                        
                                                                                        
                                                                                    <font size="6">LEVEL :<%=id%></font>              
<form method="POST" action="lock.jsp">
        <center><br><br> 
            <font size="6"><%=q%></font>
            <br>
            <br>
            <input type="radio" name="r1" value="<%=op1%>"/><font size="6"><%=op1%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="r1" value="<%=op2%>"/><font size="6"><%=op2%></font><br>
            <input type="radio" name="r1" value="<%=op3%>"/><font size="6"><%=op3%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="r1" value="<%=op4%>"/><font size="6"><%=op4%></font><br><br>


            <input type="submit" class="button red" value="LOCK"><br>
            <%
            if(l==1){
            %>
            <a href="next.jsp"><img src="pics/post.png" heigh="70" width="70"/></a>
            <%
            }
            else if(l==30){
            %>
            <a href="prev.jsp"><img src="pics/pre.png" heigh="70" width="70"/></a>
            <%
            }
            else{
            %>  <a href="prev.jsp"><img src="pics/pre.png" heigh="70" width="70"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="next.jsp"><img src="pics/post.png" heigh="70" width="70"/></a>
            <%
            }
            %>
        </center> 
        </pre>
    </div>
    </form>
    <%
            }

        }

    %>