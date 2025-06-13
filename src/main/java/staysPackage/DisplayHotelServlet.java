package staysPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayHotelServlet")
public class DisplayHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hotelId = request.getParameter("hotelId");
		        
		        try {
		            // Get the specific hotel by ID
		            List<StayModel> hotels = staysControl.getById(hotelId);
		            
		            if (!hotels.isEmpty()) {
		                // Set the hotel as an attribute
		                request.setAttribute("hotel", hotels.get(0));
		                
		                // Forward to the details JSP
		                RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayHotel.jsp");
		                dispatcher.forward(request, response);
		            } else {
		                // Hotel not found, redirect back with error
		                response.sendRedirect("HotelAddList.jsp?error=Hotel not found");
		            }
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.sendRedirect("HotelAddList.jsp?error=Error loading hotel details");
		        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
