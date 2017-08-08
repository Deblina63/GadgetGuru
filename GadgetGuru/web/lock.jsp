<%
    String answer=request.getParameter("opno");
    String qn=request.getParameter("qid");
    String u=(String)session.getAttribute("uname");
    String q1="update isLocked set a"+qn+"='"+answer+"'where uname='"+u+"'";
    String q2="update status set a"+qn+"='"+answer+"'where uname='"+u+"'";
    
    out.print(1);
    int ur=jdbc.DAOLayer.updateData(q1);
    int ur1=jdbc.DAOLayer.updateData(q2);
%>