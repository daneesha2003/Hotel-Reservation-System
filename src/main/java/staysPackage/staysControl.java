package staysPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class staysControl {
	//Connect DB
			private static Connection con = null;
			private static Statement stmt = null;
			private static ResultSet rs = null;
			
			//get by Id
			public static List <StayModel> getById(String Id){
				
				int convertedID = Integer.parseInt(Id);
				
				ArrayList <StayModel> hoteladd = new ArrayList<>();
				
				try {
					//DBConnection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					//Query
					String sql = "select * from hoteladd where id = '"+convertedID+"'";
					
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						int id = rs.getInt(1);
						String name = rs.getString(2);
						String location = rs.getString(3);
						String description = rs.getString(4);
						double singleRate = rs.getDouble(5);
						double doubleRate = rs.getDouble(6);
						double suiteRate = rs.getDouble(7);
						double deluxeRate = rs.getDouble(8);
						String rating = rs.getString(9);
						String amenities = rs.getString(10);
						
						
						StayModel hm = new StayModel(id, name, location, description, singleRate, doubleRate, suiteRate, deluxeRate, rating, amenities);
						hoteladd.add(hm);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return hoteladd;
			}
			
			
			//get all data
			public static List<StayModel> getAllHotels(){
				
				ArrayList <StayModel> hotels = new ArrayList<>();
				
				try {
					//DBConnection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					//Query
					String sql = "SELECT * FROM hoteladd";
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						int id = rs.getInt(1);
						String name = rs.getString(2);
						String location = rs.getString(3);
						String description = rs.getString(4);
						double singleRate = rs.getDouble(5);
						double doubleRate = rs.getDouble(6);
						double suiteRate = rs.getDouble(7);
						double deluxeRate = rs.getDouble(8);
						String rating = rs.getString(9);
						String amenities = rs.getString(10);
						
						
						StayModel hm = new StayModel(id, name, location, description, singleRate, doubleRate, suiteRate, deluxeRate, rating, amenities);
						hotels.add(hm);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return hotels;
				
			}
			

			
}
