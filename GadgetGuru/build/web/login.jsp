<%@page import="jdbc.DAOLayer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="table.Login"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Criteria"%>

<%
        String u=request.getParameter("user");
        String p=request.getParameter("password");
        u=u.trim();
        p=p.trim();
        u=u.replace("'", "'\\'");
        p=p.replace("'", "'\\'");
            
             
        String q="select * from login where uname='"+u+"' and pass='"+p+"'";
        ResultSet rs=jdbc.DAOLayer.selectData(q);
        try{
        if(rs.next())//valid login
        {
           String q3="select st from status where uname='"+u+"'";
           ResultSet rs1=jdbc.DAOLayer.selectData(q3);
           if(!rs1.next()){
            String q1="insert into isLocked(uname) values('"+u+"')";
            int in=jdbc.DAOLayer.updateData(q1);
            String q2="insert into status(uname,st,time_left) values('"+u+"','F',1800)";
            int in1=jdbc.DAOLayer.updateData(q2);
            HttpSession sess = request.getSession();
            sess.setAttribute("uname", u);
            sess.setAttribute("time", 1800);
            RequestDispatcher rd;
           
              rd=request.getRequestDispatcher("inst.jsp");
              rd.forward(request,response);
           }
           else{
            String stat=rs1.getString(1);
            %>
            <%=stat%>
            <%
            if(stat.equals("F")){
                int tl;
                String query="select time_left from status where uname='"+u+"'";
                ResultSet rs2=jdbc.DAOLayer.selectData(query);
                rs2.next();
                tl=rs2.getInt(1);
                HttpSession sess = request.getSession();
                sess.setAttribute("uname", u);
                sess.setAttribute("time", tl);
                RequestDispatcher rd;
           
                rd=request.getRequestDispatcher("inst.jsp");
                rd.forward(request,response);
            }
            else{
                    request.setAttribute("msg", "YOU HAVE ALREADY PLAYED ONCE");
                    RequestDispatcher rd;
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
               }
           }
        }
        
        else//invalid login
        {
            request.setAttribute("msg", "INVALID USERID OR PASSWORD!");
            RequestDispatcher rd;
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        }catch(Exception e){
            out.print("ERROR : "+e.getMessage());
        }
%>