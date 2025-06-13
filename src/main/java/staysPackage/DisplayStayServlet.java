package staysPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DisplayStayServlet")
public class DisplayStayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("DisplayStayServlet called"); // Debug
        
        try {
            // Get all hotels
            List<StayModel> hotels = staysControl.getAllHotels();
            System.out.println("Fetched " + hotels.size() + " hotels"); // Debug
            
            // Set attributes
            request.setAttribute("hotels", hotels); // Fixed attribute name
            
            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("HotelAddList.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Error in DisplayStayServlet: ");
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("error", "Failed to load hotels: " + e.getMessage());
            
            // Forward to error page or back to JSP
            request.getRequestDispatcher("HotelAddList.jsp").forward(request, response);
            
        }
    }
}
