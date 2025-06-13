package ReservationPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class ReservationControl {
	
	//Connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		//Insert Data Function
		public static boolean insertdata (String firstName, String lastName, String email, String phone, String roomType, LocalDate checkIn, LocalDate checkOut, int totalLengthStay, String specialRequest) {
			
			boolean isSuccess = false;
			try {
				//DB Connection call
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//SQL Query
				String sql = "insert into reservation values(0, '"+firstName+"','"+lastName+"','"+email+"','"+phone+"','"+roomType+"','"+checkIn+"','"+checkOut+"','"+totalLengthStay+"','"+specialRequest+"')";
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
		
		
		
		//GetById
		public static List <ReservationModel> getById(String Id){
			
			int convertedID = Integer.parseInt(Id);
			
			ArrayList <ReservationModel> reservation = new ArrayList<>();
			
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql = "select * from reservation where id = '"+convertedID+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String firstName = rs.getString(2);
					String lastName = rs.getString(3);
					String email = rs.getString(4);
					String phone = rs.getString(5);
					String roomType = rs.getString(6);
					LocalDate checkIn = rs.getTimestamp(7).toLocalDateTime().toLocalDate();
					LocalDate checkOut = rs.getTimestamp(8).toLocalDateTime().toLocalDate();
					int totalLengthStay = rs.getInt(9);
					String specialRequest = rs.getString(10);
					
					ReservationModel rm = new ReservationModel(id,firstName,lastName,email,phone,roomType,checkIn,checkOut,totalLengthStay,specialRequest);
					reservation.add(rm);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return reservation;
		}
		
		//get all data
		public static List<ReservationModel> getAllReservation(){
			
			ArrayList <ReservationModel> reservations = new ArrayList<>();
			
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql = "SELECT * FROM reservation ORDER BY id DESC LIMIT 1";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String firstName = rs.getString(2);
					String lastName = rs.getString(3);
					String email = rs.getString(4);
					String phone = rs.getString(5);
					String roomType = rs.getString(6);
					LocalDate checkIn = rs.getTimestamp(7).toLocalDateTime().toLocalDate();
					LocalDate checkOut = rs.getTimestamp(8).toLocalDateTime().toLocalDate();
					int totalLengthStay = rs.getInt(9);
					String specialRequest = rs.getString(10);
					
					ReservationModel rm = new ReservationModel(id,firstName,lastName,email,phone,roomType,checkIn,checkOut,totalLengthStay,specialRequest);
					reservations.add(rm);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return reservations;
			
		}
		
		//update data
		public static boolean updatedata(String id, String firstName, String lastName, String email, String phone,String roomType, LocalDate checkIn, LocalDate checkOut,int totalLengthStay, String specialRequest) {
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "update reservation set firstName = '"+firstName+"',lastName = '"+lastName+"',email = '"+email+"',phone = '"+phone+"',roomType = '"+roomType+"',checkIn = '"+checkIn+"',checkOut = '"+checkOut+"',totalLengthStay = '"+totalLengthStay+"',specialRequest = '"+specialRequest+"'"
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
		
		//Delete data
		public static boolean deletedata(String id) {
			int convID = Integer.parseInt(id);
			
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "delete from reservation where id= '"+convID+"'";
				
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
		

		//Calculate bill
		public static List<ReservationModel> totalBill(){
			
			ArrayList <ReservationModel> bill = new ArrayList<>();
			
			try {
				//DBConnection
				con = DBConnection.getConnection();
		        stmt = con.createStatement();
		        
		        String sql = "SELECT * FROM reservation ORDER BY id DESC LIMIT 1";
		        rs = stmt.executeQuery(sql);
		        
		        if (rs.next()) {
		            int id = rs.getInt(1);
		            String firstName = rs.getString(2);
		            String lastName = rs.getString(3);
		            String email = rs.getString(4);
		            String phone = rs.getString(5);
		            String roomType = rs.getString(6);
		            LocalDate checkIn = rs.getTimestamp(7).toLocalDateTime().toLocalDate();
		            LocalDate checkOut = rs.getTimestamp(8).toLocalDateTime().toLocalDate();
		            int totalLengthStay = rs.getInt(9);
		            String specialRequest = rs.getString(10);

		            CalculateBill billCalculator = new RoomBill(roomType);
		            double roomCharges = billCalculator.calculateRoomCharges(totalLengthStay);
		            double taxes = roomCharges * 0.1;
		            double totalAmount = roomCharges + taxes;

		            ReservationModel rm = new ReservationModel(
		                id, firstName, lastName, email, phone, roomType, 
		                checkIn, checkOut, totalLengthStay, specialRequest
		            );
		            rm.setRoomCharges(roomCharges);
		            rm.setTaxes(taxes);
		            rm.setTotalAmount(totalAmount);
		            bill.add(rm);
		        }
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return bill;
			
			
			
		}



}
