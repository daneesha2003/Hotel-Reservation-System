package ReservationPackage;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String roomType = request.getParameter("roomType");
		LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
		LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));
		int totalLengthStay = Integer.parseInt(request.getParameter("totalLengthStay"));
		String specialRequest = request.getParameter("specialRequest");
		
		boolean isTrue;
		
		isTrue = ReservationControl.updatedata(id, firstName, lastName, email, phone, roomType, checkIn, checkOut, totalLengthStay, specialRequest);
		

		if(isTrue == true) {
			List<ReservationModel> reservationDetails = ReservationControl.getById(id);
			request.setAttribute("reservationDetails", reservationDetails);
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='ReservationGetServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
