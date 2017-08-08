
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<link rel="stylesheet" href="pics/styling.css"/> 
<% String u = (String) session.getAttribute("uname"); %>
<script>
/*void startTimer(duration, display) {
    var timer = duration;
    var minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);
        
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;
               
        if (--timer < 0) {
            window.location.href = "result.jsp";
        } 
       
        updateTime(<!%=u%>,timer);
        
       
       }, 1000);
}
<!%!
void updateTime(String u,int t){
     String query2="update status set time_left="+t+" where uname='"+u+"'";  
     int ttt=jdbc.DAOLayer.updateData(query2);
}
 %>


window.onload = function () {
    
    <!%
     String un = (String) session.getAttribute("uname");
     String query1="select time_left from status where uname='"+un+"'";
     ResultSet rs3=jdbc.DAOLayer.selectData(query1);
     rs3.next();
     int t=rs3.getInt(1);
    %>   
    var display = document.querySelector('#timers');
    
    startTimer(<!%=t%>, display);
    
};*/
    
int fm()
{
    String s="select time_left from status where uname="+<%=u%>;
    ResultSet rss=jdbc.DAOLayer.selectData(s);
    if(rss.next())
        int tl=rss.getInt(1);
    return tl;
}
   
   
function startTime(){
    int time_left=fm();
    int m= time_left/60;
    int s= time_left%60;
    String qq;
    if(s==0){
        m=m-1;
        s=60;
        
    }
    else{
        s=s-1;
    }
    qq="update status set time_left ="+(m*s)+" where uname="+<%=u%>;
    int x= jdbc.DAOLayer.updateData(qq);
    m=checkTime(m);
    s=checkTime(s);
    document.getElementById('timers').innerHTML = m + ":" + s;
    var t=setTimeout(startTime,1000);
}
function checkTime(i){
    if(i<10){
        i="0"+i;
    }
    return i;
}


</script>


<style>

    tp {
        font-family: Raleway;
        opacity: .5;
        filter: alpha(opacity=80); 
        height:500px;
        width: 100px;
        text-align: center;
    }

    input[type=submit]:hover {
        background-color: #ff0066;
    }
 
</style>
<%
    
    String query="select time_left from status where uname='"+u+"'";
    ResultSet rs2=jdbc.DAOLayer.selectData(query);
    rs2.next();
    int tt=rs2.getInt(1);
    int min=tt/60;
    int sec=tt%60;
    HttpSession s = request.getSession(false);
    if (s != null && u != null) {
        u = u.toUpperCase();
        HttpSession sess = request.getSession();
        sess.setAttribute("uname", u);

%>
<body onload="startTime()">
    
    
    <div class="tp"s>
        <center>
            <h1>WELCOME <%=u%></h1>
        </center>
        <font size="6" align="left">Time Left: </font>
    </div>
        
  <div id="timers"></div>

    <form action="resquiz.jsp" method="POST">


        <pre> <%
            String q = "select * from isLocked where uname='" + u + "'";
            ResultSet r1 = jdbc.DAOLayer.selectData(q);
            r1.last();
            if (r1.getInt(2) == 0) {
            %><input type="submit" class="button grey" name="btn" value="1"/>          
            <%} else if (r1.getString(2).equals("99")) {
            %><input name="btn" class="button red" type="submit" value="1"/>   
            <%} else {
            %><input name="btn" class="button green" type="submit" value="1"/>   
            <%}
                if (r1.getInt(3) == 0) {
            %>        <input type="submit" class="button grey" name="btn" value="2"/>          
            <%}else if (r1.getString(3).equals("99")) {
            %>        <input name="btn" class="button red" type="submit" value="2"/>   
            <%} else {
            %>        <input name="btn" class="button green" type="submit" value="2"/>   
            <%}
                if (r1.getInt(4) == 0) {
            %>                  <input type="submit" class="button grey" name="btn" value="3"/>          
            <%} else if (r1.getString(4).equals("99")) {
            %>                  <input name="btn" class="button red" type="submit" value="3"/>   
            <%} else {
            %>                  <input name="btn" class="button green" type="submit" value="3"/>   
            <%}
                if (r1.getInt(5) == 0) {
            %>                          <input type="submit" class="button grey" name="btn" value="4"/>          
            <%}else if (r1.getString(5).equals("99")) {
            %>                          <input name="btn" class="button red" type="submit" value="4"/>   
            <%} else {
            %>                          <input name="btn" class="button green" type="submit" value="4"/>   
            <%}
                if (r1.getInt(6) == 0) {
            %>                                  <input type="submit" class="button grey" name="btn" value="5"/>          
            <%}else if (r1.getString(6).equals("99")) {
            %>                                  <input name="btn" class="button red" type="submit" value="5"/>   
            <%} else {%>
                                                <input name="btn" class="button green" type="submit" value="5"/>   
            <%}
                if (r1.getInt(7) == 0) {
            %>                                          <input type="submit" class="button grey" name="btn" value="6"/>          
            <%}else if (r1.getString(7).equals("99")) {
            %>                                          <input name="btn" class="button red" type="submit" value="6"/>   
            <%} else {
            %>                                          <input name="btn" class="button green" type="submit" value="6"/>   
            <%}
                if (r1.getInt(8) == 0) {
            %>                                              <input type="submit" class="button grey" name="btn" value="7"/>          
            <%}else if (r1.getString(8).equals("99")) {
            %>                                              <input name="btn" class="button red" type="submit" value="7"/>   
            <%} else {
            %>                                              <input name="btn" class="button green" type="submit" value="7"/>   
            <%}
                if (r1.getInt(9) == 0) {
            %>                                                  <input type="submit" class="button grey" name="btn" value="8"/>          
            <%}else if (r1.getString(9).equals("99")) {
            %>                                                  <input name="btn" class="button red" type="submit" value="8"/>   
            <%} else {
            %>                                                  <input name="btn" class="button green" type="submit" value="8"/>   
            <%}
                if (r1.getInt(10) == 0) {
            %>                                                      <input type="submit" class="button grey" name="btn" value="9"/>          
            <%}else if (r1.getString(10).equals("99")) {
            %>                                                      <input name="btn" class="button red" type="submit" value="9"/>   
            <%} else {
            %>                                                      <input name="btn" class="button green" type="submit" value="9"/>   
            <%}
                if (r1.getInt(11) == 0) {
            %>                                                         <input type="submit" class="button grey" name="btn" value="10"/>          
            <%}else if (r1.getString(11).equals("99")) {
            %>                                                         <input name="btn" class="button red" type="submit" value="10"/>   
            <%} else {
            %>                                                         <input name="btn" class="button green" type="submit" value="10"/>   
            <%}
                if (r1.getInt(12) == 0) {
            %>                                                            <input type="submit" class="button grey" name="btn" value="11"/>          
            <%}else if (r1.getString(12).equals("99")) {
            %>                                                            <input name="btn" class="button red" type="submit" value="11"/>   
            <%} else {
            %>                                                            <input name="btn" class="button green" type="submit" value="11"/>   
            <%}
            if (r1.getInt(13) == 0) {
            %>                                                              <input type="submit" class="button grey" name="btn" value="12"/>          
            <%}else if (r1.getString(13).equals("99")) {
            %>                                                              <input name="btn" class="button red" type="submit" value="12"/>   
            <%} else {
            %>                                                              <input name="btn" class="button green" type="submit" value="11"/>   
            <%}
                if (r1.getInt(14) == 0) {
            %>                                                                 <input type="submit" class="button grey" name="btn" value="13"/>          
            <%}else if (r1.getString(14).equals("99")) {
            %>                                                                 <input name="btn" class="button red" type="submit" value="13"/>   
            <%} else {
            %>                                                                 <input name="btn" class="button green" type="submit" value="13"/>   
            <%}
                if (r1.getInt(15) == 0) {
            %>                                                                  <input type="submit" class="button grey" name="btn" value="14"/>          
            <%}else if (r1.getString(15).equals("99")) {
            %>                                                                  <input name="btn" class="button red" type="submit" value="14"/>   
            <%} else {
            %>                                                                  <input name="btn" class="button green" type="submit" value="14"/>   
            <%}
                if (r1.getInt(16) == 0) {
            %>                                                                <input type="submit" class="button grey" name="btn" value="15"/>          
            <%}else if (r1.getString(16).equals("99")) {
            %>                                                                <input name="btn" class="button red" type="submit" value="15"/>   
            <%} else {
            %>                                                                <input name="btn" class="button green" type="submit" value="15"/>   
            <%}
                if (r1.getInt(17) == 0) {
            %>                                                                   <input type="submit" class="button grey" name="btn" value="16"/>          
            <%}else if (r1.getString(17).equals("99")) {
            %>                                                                   <input name="btn" class="button red" type="submit" value="16"/>   
            <%} else {
            %>                                                                   <input name="btn" class="button green" type="submit" value="16"/>   
            <%}
                if (r1.getInt(18) == 0) {
            %>                                                                  <input type="submit" class="button grey" name="btn" value="17"/>          
            <%}else if (r1.getString(18).equals("99")) {
            %>                                                                  <input name="btn" class="button red" type="submit" value="17"/>   
            <%} else {
            %>                                                                  <input name="btn" class="button green" type="submit" value="17"/>   
            <%}
                if (r1.getInt(19) == 0) {
            %>                                                                    <input type="submit" class="button grey" name="btn" value="18"/>          
            <%}else if (r1.getString(19).equals("99")) {
            %>                                                                    <input name="btn" class="button red" type="submit" value="18"/>   
            <%} else {
            %>                                                                    <input name="btn" class="button green" type="submit" value="18"/>   
            <%}
                if (r1.getInt(20) == 0) {
            %>                                                                       <input type="submit" class="button grey" name="btn" value="19"/>          
            <%}else if (r1.getString(20).equals("99")) {
            %>                                                                       <input name="btn" class="button red" type="submit" value="18"/>   
            <%} else {
            %>                                                                       <input name="btn" class="button green" type="submit" value="19"/>   
            <%}
                if (r1.getInt(21) == 0) {
            %>                                                                         <input type="submit" class="button grey" name="btn" value="20"/>          
            <%}else if (r1.getString(21).equals("99")) {
            %>                                                                         <input name="btn" class="button red" type="submit" value="20"/>   
            <%} else {
            %>                                                                         <input name="btn" class="button green" type="submit" value="20"/>   
            <%}
                if (r1.getInt(22) == 0) {
            %>                                                                          <input type="submit" class="button grey" name="btn" value="21"/>          
            <%}else if (r1.getString(22).equals("99")) {
            %>                                                                          <input name="btn" class="button red" type="submit" value="21"/>   
            <%} else {
            %>                                                                          <input name="btn" class="button green" type="submit" value="21"/>   
            <%}
                if (r1.getInt(23) == 0) {
            %>                                                                              <input type="submit" class="button grey" name="btn" value="22"/>          
            <%}else if (r1.getString(23).equals("99")) {
            %>                                                                              <input name="btn" class="button red" type="submit" value="22"/>   
            <%} else {
            %>                                                                              <input name="btn" class="button green" type="submit" value="22"/>   
            <%}
                if (r1.getInt(24) == 0) {
            %>                                                                                  <input type="submit" class="button grey" name="btn" value="23"/>          
            <%}else if (r1.getString(24).equals("99")) {
            %>                                                                                  <input name="btn" class="button red" type="submit" value="23"/>   
            <%} else {
            %>                                                                                  <input name="btn" class="button green" type="submit" value="23"/>   
            <%}
                if (r1.getInt(25) == 0) {
            %>                                                                                      <input type="submit" class="button grey" name="btn" value="24"/>          
            <%}else if (r1.getString(25).equals("99")) {
            %>                                                                                      <input name="btn" class="button red" type="submit" value="24"/>   
            <%} else {
            %>                                                                                      <input name="btn" class="button green" type="submit" value="24"/>   
            <%}
                if (r1.getInt(26) == 0) {
            %>                                                                                            <input type="submit" class="button grey" name="btn" value="25"/>          
            <%}else if (r1.getString(26).equals("99")) {
            %>                                                                                            <input name="btn" class="button red" type="submit" value="25"/>   
            <%} else {
            %>                                                                                            <input name="btn" class="button green" type="submit" value="25"/>   
            <%}
                if (r1.getInt(27) == 0) {
            %>                                                                                               <input type="submit" class="button grey" name="btn" value="26"/>          
            <%}else if (r1.getString(27).equals("99")) {
            %>                                                                                               <input name="btn" class="button red" type="submit" value="26"/>   
            <%} else {
            %>                                                                                               <input name="btn" class="button green" type="submit" value="26"/>   
            <%}
                if (r1.getInt(28) == 0) {
            %>                                                                                                   <input type="submit" class="button grey" name="btn" value="27"/>          
            <%}else if (r1.getString(28).equals("99")) {
            %>                                                                                                   <input name="btn" class="button red" type="submit" value="27"/>   
            <%} else {
            %>                                                                                                   <input name="btn" class="button green" type="submit" value="27"/>   
            <%}
                if (r1.getInt(29) == 0) {
            %>                                                                                                      <input type="submit" class="button grey" name="btn" value="28"/>          
            <%}else if (r1.getString(29).equals("99")) {
            %>                                                                                                      <input name="btn" class="button red" type="submit" value="28"/>   
            <%} else {
            %>                                                                                                      <input name="btn" class="button green" type="submit" value="28"/>   
            <%}
                if (r1.getInt(30) == 0) {
            %>                                                                                                              <input type="submit" class="button grey" name="btn" value="29"/>          
            <%}else if (r1.getString(30).equals("99")) {
            %>                                                                                                              <input name="btn" class="button red" type="submit" value="29"/>   
            <%} else {
            %>                                                                                                              <input name="btn" class="button green" type="submit" value="29"/>   
            <%}
            if (r1.getInt(31) == 0) {
            %>                                                                                                                      <input type="submit" class="button grey" name="btn" value="30"/>                 
            <%}else if (r1.getString(31).equals("99")) {
            %>                                                                                                                      <input name="btn" class="button red" type="submit" value="30"/>         
            <%} else {
            %>                                                                                                                      <input name="btn" class="button green" type="submit" value="30"/>       
            <%}%>                                                                                                                              <a href="result.jsp"><img src="pics/finish1.png" height="40" width="40"/></a>         

        </pre>      


    </form>

</body>

<!form method="POST" action="result.jsp">
<!input type="submit" value="SUBMIT"/>
<!--/form-->
<%
    } else {
        request.setAttribute("msg", "PLEASE LOGIN TO CONTINUE!!");
        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
        rd.forward(request, response);
    }
%>