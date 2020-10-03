package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
public class EmergencyDetails {
	public ArrayList<Emergency> getEmergencyDetails() throws SQLException {

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		ArrayList<Emergency> al =  new ArrayList<>();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/copfriendly", "student" , "student");
			
			myStmt = myConn.createStatement();
			
			myRs = myStmt.executeQuery("select sl, priority, location, numberOfPeople, accidentType from emergency ORDER BY priority DESC");
			
			while(myRs.next()) {
				Emergency e = new Emergency();
				
				e.priority = myRs.getInt("priority");
				e.location = myRs.getString("location");
				e.noPeople = myRs.getInt("numberOfPeople");
				e.accidentType = myRs.getString("accidentType");
				e.sl  = myRs.getInt("sl");
				
				
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
