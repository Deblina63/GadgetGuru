package jdbc;
import java.sql.*;

public class DAOLayer {
    private static Connection con;
    
    static{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/cad";
            con=DriverManager.getConnection(url, "root", "deblina");
        }
        catch(Exception e){
            System.out.println("CONNECTION ERROR : "+e.getMessage());
        }
    }
    
    public static Connection getCon(){
        return con;
    }
    
    public static int updateData(String dmlQuery){
        try{
            Statement st= con.createStatement();
            int ur= st.executeUpdate(dmlQuery);
            return ur;
        }
        catch(Exception e){
            System.out.println("UPDATE ERROR : "+e.getMessage());
            return -1;
        }
    }
    
    public static ResultSet selectData(String projQuery){
        try{
            Statement st= con.createStatement();
            ResultSet rs= st.executeQuery(projQuery);
            return rs;
        }
        catch(Exception e){
            System.out.println("SELECT ERROR : "+e.getMessage());
            return null;
        }
    }
    
    public static PreparedStatement getPS(String incQuery){
    try{
            PreparedStatement ps= con.prepareStatement(incQuery);
            return ps;
        }
        catch(Exception e){
            System.out.println("PS ERROR : "+e.getMessage());
            return null;
        }
    }
}
