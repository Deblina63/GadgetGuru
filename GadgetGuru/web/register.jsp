<%@page import="jdbc.DAOLayer"%>
<%@page import="java.sql.ResultSet"%>
<%
        String n=request.getParameter("name");
        String p=request.getParameter("pass");
        String cp=request.getParameter("cpass");
        p=p.trim();
        cp=cp.trim();
        p=p.replace("'", "'\\'");
        cp=cp.replace("'", "'\\'");
        n=n.trim();
        n=n.replace("'","'\\'");
        
        String q1="select * from login where uname='"+n+"'";
        ResultSet rs=DAOLayer.selectData(q1);
        
            if(rs.next()){
                request.setAttribute("errmsg", "You already have an account!");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request,response); 
            }
        else
        {
            if(p.length()<5){
                request.setAttribute("errmsg", "PASSWORD MUST BE OF AT LEAST 5 CHARACTERS! Try again...");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request,response); 
                }
            else{
                if(p.equals(cp)==false){
                request.setAttribute("errmsg", "CONFIRM PASSWORD DOESNOT MATCH! Try again...");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request,response); 
                }
                else{
                    String q="insert into login(uname,pass) values('"+n+"','"+p+"')";
                    int i=DAOLayer.updateData(q);
                    if(i>0){
                        request.setAttribute("msg", "PLEASE LOGIN TO CONTINUE..");
                        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                        rd.forward(request,response); 
                        }
                    
                }
                    
                
            }
            
            }
            %>