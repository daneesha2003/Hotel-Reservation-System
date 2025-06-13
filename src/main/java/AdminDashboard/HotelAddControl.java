package AdminDashboard;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ReservationPackage.DBConnection;

public class HotelAddControl {
	//Connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		//Insert Data Function
		public static boolean insertdata (String name, String location, String description, double singleRate, double doubleRate, double suiteRate, double deluxeRate, String rating, String amenities, String imageUrl) {
			
			boolean isSuccess = false;
			try {
				//DB Connection call
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//SQL Query
				String sql = "insert into hoteladd values(0, '"+name+"','"+location+"','"+description+"','"+singleRate+"','"+doubleRate+"','"+suiteRate+"','"+deluxeRate+"','"+rating+"','"+amenities+"', '"+imageUrl+"')";
				int rs = stmt.executeUpdate(sql);
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
		
		
		//get by Id
		public static List <HotelAddModel> getById(String Id){
			
			int convertedID = Integer.parseInt(Id);
			
			ArrayList <HotelAddModel> hoteladd = new ArrayList<>();
			
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
					String imageUrl = rs.getString(11);
					
					HotelAddModel hm = new HotelAddModel(id, name, location, description, singleRate, doubleRate, suiteRate, deluxeRate, rating, amenities, imageUrl);
					hoteladd.add(hm);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return hoteladd;
		}
		
		
		//get all data
		public static List<HotelAddModel> getAllHotels(){
			
			ArrayList <HotelAddModel> hotels = new ArrayList<>();
			
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
					String imageUrl = rs.getString(11);
					
					HotelAddModel hm = new HotelAddModel(id, name, location, description, singleRate, doubleRate, suiteRate, deluxeRate, rating, amenities, imageUrl);
					hotels.add(hm);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return hotels;
			
		}
		
		
		//update data
		public static boolean updatedata(String id, String name, String location, String description, double singleRate, double doubleRate, double suiteRate, double deluxeRate, String rating, String amenities, String imageUrl) {
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "update hoteladd set name = '"+name+"',location = '"+location+"',description = '"+description+"',singleRate = '"+singleRate+"',doubleRate = '"+doubleRate+"',suiteRate = '"+suiteRate+"',deluxeRate = '"+deluxeRate+"',rating = '"+rating+"',amenities = '"+amenities+"' ,imageUrl = '"+imageUrl+"'"
							+"where id ='"+id+"'"; 
				
				int rs = stmt.executeUpdate(sql);
				
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
						
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
		
		
		//delete data
		public static boolean deletedata(String id) {
			int convID = Integer.parseInt(id);
			
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "delete from hoteladd where id= '"+convID+"'";
				
				int rs = stmt.executeUpdate(sql);
				
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
					 
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
		
}
