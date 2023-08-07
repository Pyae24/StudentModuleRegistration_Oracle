package com.example.studentmoduleregistration_oracle;

import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Singleton;
import javax.annotation.PostConstruct;
import java.sql.Connection;
import java.sql.DriverManager;

@Singleton(name = "OracleClientProviderEJB")
//connecting with oracle database
public class OracleClientProviderBean {
    final static String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    final static String DB_USER = "gusto";
    final static String DB_PASSWORD = "gusto";
    private Connection oracleClient = null;
    public OracleClientProviderBean() {
    }
    @Lock(LockType.READ)
    public Connection getOracleClient() {
        return oracleClient;
    }

    @PostConstruct
    public void init()  {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            oracleClient = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            if (oracleClient != null)   {
                System.out.println("Connection Successful");
                System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
            }
            else    {
                System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                System.out.println("Connection Failed");
            }
        }catch (Exception e)    {
            e.printStackTrace();
        }
    }
}
