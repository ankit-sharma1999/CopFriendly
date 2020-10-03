package service;

import java.sql.*;

public class RecordViolation {
	
	public void record(String vName,String number, String violationType,String dLicence,String vType,String vNo,String dt,String ro,int fine) throws SQLException{
		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		String dbUrl = "jdbc:mySql://localhost:3306/copfriendly";
		String user = "student";
		String password = "student";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl,user,password);
			String sql = "Insert into violation (name,mob,vType,dLicence,violationType,vNumber,datetime,repeatedOffender,fine) "+ 
														"Values(?,?,?,?,?,?,?,?,?)";
			
			statement = connection.prepareStatement(sql);
			
			statement.setString(1,vName);
			statement.setString(2,number);
			statement.setString(3,vType);
			statement.setString(4,dLicence);
			statement.setString(5,violationType);
			statement.setString(6,vNo);
			statement.setString(7,dt);
			statement.setString(8,ro);
			
			statement.setInt(9,fine);
			
			statement.executeUpdate();
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(connection!=null)
				connection.close();
			if(statement!=null)
				statement.close();
			if(resultSet!=null)
				resultSet.close();
		}
 	}
}
