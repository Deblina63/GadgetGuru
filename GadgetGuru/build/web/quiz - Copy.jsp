
<%@page import="java.sql.ResultSet"%>
<link rel="stylesheet" href="pics/styling.css"/> 
<style>

    tp {

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
    String u = (String) session.getAttribute("uname");

    HttpSession s = request.getSession(false);
    if (s != null && u != null) {
        u = u.toUpperCase();
        HttpSession sess = request.getSession();
        sess.setAttribute("uname", u);

%>
<body background="pics/map1.jpg">
    <div class="tp">
        <center>
            <h1>WELCOME <%=u%></h1>
        </center>
    </div>

    <form action="resquiz.jsp" method="POST">


        <pre> <%
            String q = "select a1 from isLocked where uname='" + u + "'";
            ResultSet r1 = jdbc.DAOLayer.selectData(q);
            String q2 = "select a2 from isLocked where uname='" + u + "'";
            ResultSet r2 = jdbc.DAOLayer.selectData(q2);
            String q3 = "select a3 from isLocked where uname='" + u + "'";
            ResultSet r3 = jdbc.DAOLayer.selectData(q3);
            String q4 = "select a4 from isLocked where uname='" + u + "'";
            ResultSet r4 = jdbc.DAOLayer.selectData(q4);
            String q5 = "select a5 from isLocked where uname='" + u + "'";
            ResultSet r5 = jdbc.DAOLayer.selectData(q5);
            String q6 = "select a6 from isLocked where uname='" + u + "'";
            ResultSet r6 = jdbc.DAOLayer.selectData(q6);
            String q7 = "select a7 from isLocked where uname='" + u + "'";
            ResultSet r7 = jdbc.DAOLayer.selectData(q7);
            String q8 = "select a8 from isLocked where uname='" + u + "'";
            ResultSet r8 = jdbc.DAOLayer.selectData(q8);
            String q9 = "select a9 from isLocked where uname='" + u + "'";
            ResultSet r9 = jdbc.DAOLayer.selectData(q9);
            String q10 = "select a10 from isLocked where uname='" + u + "'";
            ResultSet r10 = jdbc.DAOLayer.selectData(q10);
            String q11 = "select a11 from isLocked where uname='" + u + "'";
            ResultSet r11 = jdbc.DAOLayer.selectData(q11);
            String q12 = "select a12 from isLocked where uname='" + u + "'";
            ResultSet r12 = jdbc.DAOLayer.selectData(q12);
            String q13 = "select a13 from isLocked where uname='" + u + "'";
            ResultSet r13 = jdbc.DAOLayer.selectData(q13);
            String q14 = "select a14 from isLocked where uname='" + u + "'";
            ResultSet r14 = jdbc.DAOLayer.selectData(q14);
            String q15 = "select a15 from isLocked where uname='" + u + "'";
            ResultSet r15 = jdbc.DAOLayer.selectData(q15);
            String q16 = "select a16 from isLocked where uname='" + u + "'";
            ResultSet r16 = jdbc.DAOLayer.selectData(q16);
            String q17 = "select a17 from isLocked where uname='" + u + "'";
            ResultSet r17 = jdbc.DAOLayer.selectData(q17);
            String q18 = "select a18 from isLocked where uname='" + u + "'";
            ResultSet r18 = jdbc.DAOLayer.selectData(q18);
            String q19 = "select a19 from isLocked where uname='" + u + "'";
            ResultSet r19 = jdbc.DAOLayer.selectData(q19);
            String q20 = "select a20 from isLocked where uname='" + u + "'";
            ResultSet r20 = jdbc.DAOLayer.selectData(q20);
            String q21 = "select a21 from isLocked where uname='" + u + "'";
            ResultSet r21 = jdbc.DAOLayer.selectData(q21);
            String q22 = "select a22 from isLocked where uname='" + u + "'";
            ResultSet r22 = jdbc.DAOLayer.selectData(q22);
            String q23 = "select a23 from isLocked where uname='" + u + "'";
            ResultSet r23 = jdbc.DAOLayer.selectData(q23);
            String q24 = "select a24 from isLocked where uname='" + u + "'";
            ResultSet r24 = jdbc.DAOLayer.selectData(q24);
            String q25 = "select a25 from isLocked where uname='" + u + "'";
            ResultSet r25 = jdbc.DAOLayer.selectData(q25);
            String q26 = "select a26 from isLocked where uname='" + u + "'";
            ResultSet r26 = jdbc.DAOLayer.selectData(q26);
            String q27 = "select a27 from isLocked where uname='" + u + "'";
            ResultSet r27 = jdbc.DAOLayer.selectData(q27);
            String q28 = "select a28 from isLocked where uname='" + u + "'";
            ResultSet r28 = jdbc.DAOLayer.selectData(q28);
            String q29 = "select a29 from isLocked where uname='" + u + "'";
            ResultSet r29 = jdbc.DAOLayer.selectData(q29);
            String q30 = "select a30 from isLocked where uname='" + u + "'";
            ResultSet r30 = jdbc.DAOLayer.selectData(q30);
            r1.last();
            r2.last();
            r3.last();
            r4.last();
            r5.last();
            r6.last();
            r7.last();
            r8.last();
            r9.last();
            r10.last();
            r11.last();
            r12.last();
            r13.last();
            r14.last();
            r15.last();
            r16.last();
            r17.last();
            r18.last();
            r19.last();
            r20.last();
            r21.last();
            r22.last();
            r23.last();
            r24.last();
            r25.last();
            r26.last();
            r27.last();
            r28.last();
            r29.last();
            r30.last();
            if (r1.getInt(1) == 0) {
            %>                 <input type="submit" class="button grey" name="btn" value="1"/>          
            <%} else if (r1.getString(1).equals("9999")) {
            %>                 <input name="btn" class="button red" type="submit" value="1"/>   
            <%} else {
            %>                  <input name="btn" class="button green" type="submit" value="1"/>   
            <%}
                if (r2.getInt(1) == 0) {
            %>        <input type="submit" class="button grey" name="btn" value="2"/>          
            <%} else {
            %>        <input name="btn" class="button green" type="submit" value="2"/>   
            <%}
                if (r3.getInt(1) == 0) {
            %>                     
            <input type="submit" class="button grey" name="btn" value="3"/>          
            <%} else if (r1.getString(1).equals("9999")) {
            %>                 
            <input name="btn" class="button red" type="submit" value="3"/>   
            <%} else {
            %>
            <input name="btn" class="button green" type="submit" value="3"/>   
            <%}
                if (r4.getInt(1) == 0) {
            %>    <input type="submit" class="button grey" name="btn" value="4"/>          
            <%} else {
            %>    <input name="btn" class="button green" type="submit" value="4"/>   
            <%}
                if (r5.getInt(1) == 0) {
            %><input type="submit" class="button grey" name="btn" value="5"/>          
            <%} else {%>
   <input name="btn" class="button green" type="submit" value="5"/>   
            <%}
                if (r6.getInt(1) == 0) {
            %>                     
   <input type="submit" class="button grey" name="btn" value="6"/>          
            <%} else {
            %>
   <input name="btn" class="button green" type="submit" value="6"/>   
            <%}
                if (r7.getInt(1) == 0) {
            %>                     
    <input type="submit" class="button grey" name="btn" value="7"/>          
            <%} else {
            %>
    <input name="btn" class="button green" type="submit" value="7"/>   
            <%}
                if (r8.getInt(1) == 0) {
            %>    <input type="submit" class="button grey" name="btn" value="8"/>          
            <%} else {
            %>    <input name="btn" class="button green" type="submit" value="8"/>   
            <%}
                if (r9.getInt(1) == 0) {
            %>        <input type="submit" class="button grey" name="btn" value="9"/>          
            <%} else {
            %>        <input name="btn" class="button green" type="submit" value="9"/>   
            <%}
                if (r10.getInt(1) == 0) {
            %>             <input type="submit" class="button grey" name="btn" value="10"/>          
            <%} else {
            %>             <input name="btn" class="button green" type="submit" value="10"/>   
            <%}
                if (r11.getInt(1) == 0) {
            %>                     
                <input type="submit" class="button grey" name="btn" value="11"/>          
            <%} else {
            %>                     
                <input name="btn" class="button green" type="submit" value="11"/>   
            <%}
                if (r12.getInt(1) == 0) {
            %>                     
                   <input type="submit" class="button grey" name="btn" value="12"/>          
            <%} else {
            %>
                   <input name="btn" class="button green" type="submit" value="12"/>   
            <%}
                if (r13.getInt(1) == 0) {
            %>                   <input type="submit" class="button grey" name="btn" value="13"/>          
            <%} else {
            %>                   <input name="btn" class="button green" type="submit" value="13"/>   
            <%}
                if (r14.getInt(1) == 0) {
            %>                        <input type="submit" class="button grey" name="btn" value="14"/>          
            <%} else {
            %>                        <input name="btn" class="button green" type="submit" value="14"/>   
            <%}
                if (r14.getInt(1) == 0) {
            %>                     
                          <input type="submit" class="button grey" name="btn" value="15"/>          
            <%} else {
            %>
                          <input name="btn" class="button green" type="submit" value="15"/>   
            <%}
                if (r16.getInt(1) == 0) {
            %>                          <input type="submit" class="button grey" name="btn" value="16"/>          
            <%} else {
            %>                          <input name="btn" class="button green" type="submit" value="16"/>   
            <%}
                if (r17.getInt(1) == 0) {
            %>                                   <input type="submit" class="button grey" name="btn" value="17"/>          
            <%} else {
            %>                                   <input name="btn" class="button green" type="submit" value="17"/>   
            <%}
                if (r18.getInt(1) == 0) {
            %>                                          <input type="submit" class="button grey" name="btn" value="18"/>          
            <%} else {
            %>                                          <input name="btn" class="button green" type="submit" value="18"/>   
            <%}
                if (r19.getInt(1) == 0) {
            %>                                              <input type="submit" class="button grey" name="btn" value="19"/>          
            <%} else {
            %>                                              <input name="btn" class="button green" type="submit" value="19"/>   
            <%}
                if (r20.getInt(1) == 0) {
            %>                                          <input type="submit" class="button grey" name="btn" value="20"/>          
            <%} else {
            %>                                          <input name="btn" class="button green" type="submit" value="20"/>   
            <%}
                if (r21.getInt(1) == 0) {
            %>                                               <input type="submit" class="button grey" name="btn" value="21"/>          
            <%} else {
            %>                                               <input name="btn" class="button green" type="submit" value="21"/>   
            <%}
                if (r22.getInt(1) == 0) {
            %>                                                   <input type="submit" class="button grey" name="btn" value="22"/>          
            <%} else {
            %>                                                   <input name="btn" class="button green" type="submit" value="22"/>   
            <%}
                if (r23.getInt(1) == 0) {
            %>                                                           <input type="submit" class="button grey" name="btn" value="23"/>          
            <%} else {
            %>                                                           <input name="btn" class="button green" type="submit" value="23"/>   
            <%}
                if (r24.getInt(1) == 0) {
            %>                                                              <input type="submit" class="button grey" name="btn" value="24"/>          
            <%} else {
            %>                                                              <input name="btn" class="button green" type="submit" value="24"/>   
            <%}
                if (r25.getInt(1) == 0) {
            %>                                                                   <input type="submit" class="button grey" name="btn" value="25"/>          
            <%} else {
            %>                                                                   <input name="btn" class="button green" type="submit" value="25"/>   
            <%}
                if (r26.getInt(1) == 0) {
            %>                     
                                                                      <input type="submit" class="button grey" name="btn" value="26"/>          
            <%} else {
            %>
                                                                      <input name="btn" class="button green" type="submit" value="26"/>   
            <%}
                if (r27.getInt(1) == 0) {
            %>                     
                                                                        <input type="submit" class="button grey" name="btn" value="27"/>          
            <%} else {
            %>
                                                                        <input name="btn" class="button green" type="submit" value="27"/>   
            <%}
                if (r28.getInt(1) == 0) {
            %>                     
                                                                           <input type="submit" class="button grey" name="btn" value="28"/>          
            <%} else {
            %>
                                                                           <input name="btn" class="button green" type="submit" value="28"/>   
            <%}
                if (r29.getInt(1) == 0) {
            %>                     
                                                                          <input type="submit" class="button grey" name="btn" value="29"/>          
            <%} else {
            %>
                                                                          <input name="btn" class="button green" type="submit" value="29"/>   
            <%}

                if (r30.getInt(1) == 0) {
            %>                                                                  <input type="submit" class="button grey" name="btn" value="30"/>          
            <%} else {
            %>                                                                  <input name="btn" class="button green" type="submit" value="30"/>   
            <%}%>                                                        <a href="result.jsp"><img src="pics/finish1.png" height="70" width="70"/></a>

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