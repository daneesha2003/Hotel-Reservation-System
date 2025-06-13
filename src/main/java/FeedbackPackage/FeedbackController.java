package FeedbackPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FeedbackController {
	
	//connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Insert Data Function
	public static boolean insertdata(String name, String email, String feedback, int rating) {
		boolean isSuccess = false;
		try {
			//DB Connection Call
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query (specify columns and add rating)
			String sql = "insert into feedback (id, name, email, feedback, rating) values (0, '"+name+"','"+email+"','"+feedback+"',"+rating+")";
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<FeedbackModel> getById(String Id) {
		int converedID = Integer.parseInt(Id);
		ArrayList<FeedbackModel> Feedback = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from feedback where id='"+converedID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String feedback = rs.getString(4);
				int rating = rs.getInt(5); // NEW
				FeedbackModel bk = new FeedbackModel(id, name, email, feedback, rating); // NEW
				Feedback.add(bk);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return Feedback;
	}

	//Get All Data
	public static List<FeedbackModel> getAllFeedback() {
		ArrayList<FeedbackModel> Feedbacks = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from feedback";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String feedback = rs.getString(4);
				int rating = rs.getInt(5); // NEW
				FeedbackModel bk = new FeedbackModel(id, name, email, feedback, rating); // NEW
				Feedbacks.add(bk);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return Feedbacks;
	}
	 
	//Update Data
	public static boolean updatedata(String id, String name, String email, String feedback, int rating) {
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "update feedback set name='"+name+"',email='"+email+"',feedback='"+feedback+"',rating="+rating+" where id='"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	 
	//Delete Data
	public static boolean deletedata(String id) {
		int convID = Integer.parseInt(id);
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "delete from feedback where id='"+convID+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
