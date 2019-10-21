package com.examcell.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.log4j.Logger;

public class DBManager {
	
	

	//private static final Logger LOGGER = Logger.getLogger( DBManager.class);
	public static Connection getConnection() {
		Connection connection = null;
		try 
		{
			Class.forName(ApplicationProperties.getPropertyValue("db.driver"));
            connection = DriverManager.getConnection(ApplicationProperties.getPropertyValue("db.host"), 
            ApplicationProperties.getPropertyValue("db.user"), 
            ApplicationProperties.getPropertyValue("db.password"));
        }
        catch (Exception e)
		{
            //LOGGER.error("Exception occured in DBManager", e);
         }
		
		return connection;
	}


	public static void closeConnection(Connection connection) {
		try {
			if (connection != null)
				connection.close();
		} catch (SQLException e) {

			//LOGGER.error("Exception occured in DBManager", e);

		}
	}
}

