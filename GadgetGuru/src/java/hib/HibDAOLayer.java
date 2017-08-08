
package hib;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import table.*;

public class HibDAOLayer {
    private static Configuration cfg;
    private static SessionFactory sf;
    
    static{
        cfg = new Configuration();
        
        cfg.addAnnotatedClass(table.Login.class);
        
        //ADD NEW ENTITIES LATER
        cfg.configure();
        
        sf=cfg.buildSessionFactory();
    }
    public static Configuration getHibConfig(){
        return cfg;
    }
    
    public static SessionFactory getHibSessionFactory(){
        return sf;
    }
    
    public static Session getHibSession(){
        Session session=sf.openSession();
        return session;
    }
    
}
