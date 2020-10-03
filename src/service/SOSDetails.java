package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
public class SOSDetails {
	public ArrayList<SOS> getSOSDetails() throws SQLException {

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		ArrayList<SOS> al =  new ArrayList<>();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/copfriendly", "student" , "student");
			
			myStmt = myConn.createStatement();
			
			myRs = myStmt.executeQuery("select id, name, mob, location from sos");
			
			while(myRs.next()) {
				SOS e = new SOS();
				
				e.setName(myRs.getString("name"));
				e.setMob(myRs.getString("mob")); 
				e.setLocation(myRs.getString("location")); 
				e.setId(myRs.getInt("id")); 
				
				
				al.add(e);
			}
			
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		finally {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close();
			}
		}
		return al;
		
	}
}
