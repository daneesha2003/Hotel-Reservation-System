package ReservationPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReservationGetServlet")
public class ReservationGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
			List<ReservationModel> allReservations = ReservationControl.getAllReservation();
			request.setAttribute("allReservations",allReservations);
			
			
			List<ReservationModel> totbill = ReservationControl.totalBill();
	    	request.setAttribute("totbill",totbill);
	        
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayReservation.jsp");
	        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}