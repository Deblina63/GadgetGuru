<%
    String u=(String)session.getAttribute("uname");
    String q_no=(String)session.getAttribute("level");
    int q=Integer.parseInt(q_no)-1;
    RequestDispatcher rd;
    rd = request.getRequestDispatcher("resquiz.jsp?btn="+q);
    rd.forward(request, response);
%>