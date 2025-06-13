package staysPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestDBServlet")
public class TestDBServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        
        try {
            Connection con = DBConnection.getConnection();
            out.println("Database connection SUCCESS");
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM hoteladd");
            
            if(rs.next()) {
                out.println("Number of hotels in database: " + rs.getInt(1));
            }
            
            // List all hotels
            rs = stmt.executeQuery("SELECT * FROM hoteladd");
            while(rs.next()) {
                out.println("\nHotel ID: " + rs.getInt("id"));
                out.println("Name: " + rs.getString("name"));
            }
            
        } catch (Exception e) {
            out.println("Database ERROR: " + e.getMessage());
            e.printStackTrace(out);
        }
    }
}