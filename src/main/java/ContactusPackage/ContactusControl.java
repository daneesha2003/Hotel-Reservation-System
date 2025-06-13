package ContactusPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ContactusControl {
	
	 private static Connection con = null;
	    private static Statement stmt = null;

	    // INSERT DATA function
	    public static boolean insertdata(String FirstName, String LastName, String EmailAddress, 
	                                    String PhoneNumber, String Message) {
	        boolean isSuccess = false;
	        
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();

	            String sql = "INSERT INTO contactus VALUES (0,'" + FirstName + "','" + LastName + 
	                        "','" + EmailAddress + "','" + PhoneNumber + "','" + Message + "')";

	            int rowsAffected = stmt.executeUpdate(sql);
	            
	            if (rowsAffected > 0) {
	                isSuccess = true;
	            }
	        } 
	        catch (Exception e) {
	            e.printStackTrace();
	        } 
	        finally {
	            try {
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } 
	            catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return isSuccess;
	    }
	    
	    // GET THE DATA using id 
	    public static List<ContactusModel> getById(String ID) {
	        int convertedID = Integer.parseInt(ID);
	        ArrayList<ContactusModel> contact = new ArrayList<>();
	        ResultSet rs = null;

	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();

	            String sql = "select * from contactus where idcontactus ='" + convertedID + "'";
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                int idcontactus = rs.getInt(1); 
	                String FirstName = rs.getString(2);
	                String LastName = rs.getString(3);
	                String EmailAddress = rs.getString(4);
	                String PhoneNumber = rs.getString(5);
	                String Message = rs.getString(6);
	                
	                ContactusModel cm = new ContactusModel(idcontactus, FirstName, LastName, EmailAddress, PhoneNumber, Message);
	                contact.add(cm);
	            }
	        } 
	        catch (Exception e) {
	            e.printStackTrace();
	        } 
	        finally {
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } 
	            catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return contact;
	    }

	    // READ data method 
	    public static List<ContactusModel> getAllcontact() {
	        ArrayList<ContactusModel> contacts = new ArrayList<>();
	        ResultSet rs = null;

	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();

	            String sql = "SELECT * FROM contactus ORDER BY idcontactus DESC LIMIT 1";
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                int idcontactus = rs.getInt(1);
	                String FirstName = rs.getString(2);
	                String LastName = rs.getString(3);
	                String EmailAddress = rs.getString(4);
	                String PhoneNumber = rs.getString(5);
	                String Message = rs.getString(6);

	                ContactusModel cm = new ContactusModel(idcontactus, FirstName, LastName, EmailAddress, PhoneNumber, Message);
	                contacts.add(cm);
	            }
	        } 
	        catch (Exception e) {
	            e.printStackTrace();
	        } 
	        finally {
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } 
	            catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return contacts;
	    }
	    
	    // UPDATE data function
	    public static boolean updatedata(String idcontactus, String FirstName, String LastName, 
	                                    String EmailAddress, String PhoneNumber, String Message) {
	        boolean isSuccess = false;
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();

	            String sql = "UPDATE contactus SET FirstName='" + FirstName + "', LastName='" + LastName + 
	                         "', EmailAddress='" + EmailAddress + "', PhoneNumber='" + PhoneNumber + 
	                         "', Message='" + Message + "' WHERE idcontactus=" + idcontactus;

	            int rowsAffected = stmt.executeUpdate(sql);

	            if (rowsAffected > 0) {
	                isSuccess = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (stmt != null) stmt.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return isSuccess;
	    }
	    

	    // DELETE data function
	    public static boolean deleteData(String id)
	    {
	        boolean isSuccess = false; // Added declaration
	        int convID = Integer.parseInt(id);
	        
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            
	          
	            //SQL QUERY for the delete data 
	            String sql = "delete from contactus where idcontactus = '" + convID + "'";
	            int rowsAffected = stmt.executeUpdate(sql);
	            
	            if(rowsAffected > 0) {
	                isSuccess = true;
	            }
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	        finally { // Added resource cleanup
	            try {
	                if(stmt != null) stmt.close();
	                if(con != null) con.close();
	            } 
	            
	            
	            //Catching any errors
	            catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return isSuccess;
	    }

}
