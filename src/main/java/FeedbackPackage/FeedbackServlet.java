package FeedbackPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
        String ratingStr = request.getParameter("rating"); // Get rating as String


        int rating = 0;
        try {
            rating = Integer.parseInt(ratingStr);
        } catch (NumberFormatException e) {
            response.getWriter().println("<script> alert('Invalid rating value'); window.location.href='feedback.jsp'; </script>");
            return;
        }

        boolean isTrue;
        isTrue = FeedbackController.insertdata(name, email, feedback, rating);

        if(isTrue) {
            String alertMessage = "Thank you for your feedback!";
            response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='FeedbackGetAll'</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}
