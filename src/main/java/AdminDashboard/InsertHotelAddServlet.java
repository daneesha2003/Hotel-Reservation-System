package AdminDashboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/InsertHotelAddServlet")
public class InsertHotelAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		double singleRate = Double.parseDouble(request.getParameter("singleRate"));
		double doubleRate = Double.parseDouble(request.getParameter("doubleRate"));
		double suiteRate = Double.parseDouble(request.getParameter("suiteRate"));
		double deluxeRate = Double.parseDouble(request.getParameter("deluxeRate"));
		String rating = request.getParameter("rating");
		String amenities = request.getParameter("amenities");
		String imageUrl = request.getParameter("imageUrl");
		
		boolean isTrue;
		
		isTrue = HotelAddControl.insertdata(name, location, description, singleRate, doubleRate, suiteRate, deluxeRate, rating, amenities, imageUrl);
				 
		if(isTrue == true) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='HotelAddGetServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}

