<%@page import="java.sql.ResultSet"%>
<%
    String s=request.getParameter("qid");
    String q="select * from questions where qid="+s;
    ResultSet rs = jdbc.DAOLayer.selectData(q);
    rs.next();
    String res=rs.getString(2)+"#"+rs.getString(3)+"#"+rs.getString(4)+"#"+rs.getString(5)+"#"+rs.getString(6);
    out.print(res);
%>