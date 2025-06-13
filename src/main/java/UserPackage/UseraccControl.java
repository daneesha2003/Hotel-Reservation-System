package UserPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UseraccControl {
	 private static boolean isSuccess;
	    private static Connection con = null;
	    private static Statement stmt = null;
	    private static ResultSet rs = null;
	    
	    public static int insertAndGetId(String Fname, String Lname, String email, String password) {
	        int generatedId = -1;
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            
	            String sql = "INSERT INTO signup VALUES(0,'"+Fname+"', '"+Lname+"', '"+email+"', '"+password+"')";
	            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
	            
	            ResultSet generatedKeys = stmt.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                generatedId = generatedKeys.getInt(1);
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } catch(Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return generatedId;
	    }
	    
	  //login validate
	    public static List<SignupModel> loginValidate(String email, String password){
	    	
	    	ArrayList<SignupModel> user = new ArrayList<>();
	    	
	    	try {
	    		//DB control
	    		con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            
	            String sql = "select * from signup where "+" email='"+email+"' and password='"+password+"'";
	            rs = stmt.executeQuery(sql);
	            
	            if(rs.next()) {
	            	 int id = rs.getInt(1);
	            	 String Fname = rs.getString(2);
	            	 String Lname = rs.getString(3);
	            	 String gmail = rs.getString(4);
	            	 String pass = rs.getString(5);
	            	 
	            	 SignupModel u = new SignupModel(id, Fname, Lname, gmail, password);
	            	 user.add(u);
	            }
	            
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return user;
	    }
	    
	    //Display data
	    public static List<SignupModel> getById(String Id){
	        int convertedID = Integer.parseInt(Id);
	        ArrayList<SignupModel> user = new ArrayList<>();
	        
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            
	            String sql = "SELECT * FROM signup WHERE id = '"+convertedID+"'";
	            rs = stmt.executeQuery(sql);
	            
	            while (rs.next()) {
	                int id = rs.getInt(1);
	                String Fname = rs.getString(2);
	                String Lname = rs.getString(3);
	                String email = rs.getString(4);
	                String password = rs.getString(5);
	                
	                SignupModel ht = new SignupModel(id,Fname,Lname,email,password);
	                user.add(ht);
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } catch(Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return user;    
	    }
	    
	    public static List<SignupModel> getAllUser() {
	        ArrayList<SignupModel> users = new ArrayList<>();
	        
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            
	            String sql = "SELECT * FROM signup";
	            rs = stmt.executeQuery(sql);
	            
	            while (rs.next()) {
	                int id = rs.getInt(1);
	                String Fname = rs.getString(2);
	                String Lname = rs.getString(3);
	                String email = rs.getString(4);
	                String password = rs.getString(5);
	                
	                SignupModel ht = new SignupModel(id,Fname,Lname,email,password);
	                users.add(ht);
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } catch(Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return users;
	    }
	    
	  //Update data
	    public static boolean updatedata(String id, String Fname, String Lname, String email) {
	        try {
	            //DB connection
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            
	            //SQL query
	            String sql = "UPDATE signup SET Fname = '"+Fname+"', Lname = '"+Lname+"', email = '"+email+"' "
	                       + "WHERE id = '"+id+"'";
	            
	            int rs = stmt.executeUpdate(sql);
	            
	            if(rs > 0) {
	                isSuccess = true;
	            } else {
	                isSuccess = false;
	            }
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } catch(Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return isSuccess;
	    }
	    
	    //Delete data
	    public static boolean deletedata(String id) {
	    	int convID = Integer.parseInt(id);
	    	try {
	    		con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            
	            String sql = "delete from signup where id = '"+convID+"'";
	            
	            int rs = stmt.executeUpdate(sql);
	            if(rs > 0) {
	                isSuccess = true;
	            } else {
	                isSuccess = false;
	            }
	            
	    	}catch(Exception e) {
	            e.printStackTrace();
	        }
	    	return isSuccess;
	    }
}
