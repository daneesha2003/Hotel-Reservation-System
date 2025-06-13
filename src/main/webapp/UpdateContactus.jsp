<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Contact</title>
<!-- Link to external CSS -->
<link rel="stylesheet" href="style/updateContactus.css">
<!-- Google Fonts: Lora -->
<link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">

<style>
/* Simple inline style for error messages */
.error {
    color: red;
    font-size: 0.9em;
    margin-top: 4px;
    display: block;
    font-family: 'Lora', serif;
}
</style>

<script>
    function validateSubmit() {
        let isValid = true;

        // Clear previous error messages
        document.getElementById("firstNameError").textContent = "";
        document.getElementById("lastNameError").textContent = "";
        document.getElementById("emailError").textContent = "";
        document.getElementById("phoneError").textContent = "";
        document.getElementById("messageError").textContent = "";

        // Get form field values - IDs must match exactly!
        const firstName = document.getElementById("FirstName").value.trim();
        const lastName = document.getElementById("LastName").value.trim();
        const email = document.getElementById("EmailAddress").value.trim();
        const phone = document.getElementById("PhoneNumber").value.trim();
        const message = document.getElementById("Message").value.trim();

        // Validate First Name
        if (firstName === "") {
            document.getElementById("firstNameError").textContent = "First name cannot be empty";
            isValid = false;
        }

        // Validate Last Name
        if (lastName === "") {
            document.getElementById("lastNameError").textContent = "Last name cannot be empty";
            isValid = false;
        }

        // Validate Email
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email === "") {
            document.getElementById("emailError").textContent = "Email cannot be empty";
            isValid = false;
        } else if (!emailPattern.test(email)) {
            document.getElementById("emailError").textContent = "Invalid email address";
            isValid = false;
        }

        // Validate Phone Number (exactly 10 digits, numeric only)
        const digitsOnly = phone.replace(/\D/g, "");
        if (phone === "") {
            document.getElementById("phoneError").textContent = "Phone number cannot be empty";
            isValid = false;
        } else if (digitsOnly.length !== 10) {
            document.getElementById("phoneError").textContent = "Phone number must have exactly 10 digits";
            isValid = false;
        } else if (phone !== digitsOnly) { // Check if input contains non-numeric characters
            document.getElementById("phoneError").textContent = "Phone number must contain only numbers";
            isValid = false;
        }

        // Validate Message
        if (message === "") {
            document.getElementById("messageError").textContent = "Message cannot be empty";
            isValid = false;
        }

        return isValid;
    }
</script>

</head>
<body>

<% 
    String idcontactus = request.getParameter("id");
    String firstName = request.getParameter("fname");
    String lastName = request.getParameter("lname");
    String emailAddress = request.getParameter("email");
    String phoneNumber = request.getParameter("phone");
    String message = request.getParameter("message");
%>

<div class="form-container">
  <h2>Update Contact</h2>
  <form action="UpdateContactusServlet" method="post" class="update-form" onsubmit="return validateSubmit()" novalidate>
       <table>
         <tr>
          <td><label for="id">ID :</label></td>
          <td><input type="text" id="id" name="id" value="<%=idcontactus %>" readonly></td>
         </tr>
         <tr>
          <td><label for="FirstName">First name :</label></td>
          <td>
              <input type="text" id="FirstName" name="FirstName" value="<%=firstName %>">
              <span class="error" id="firstNameError"></span>
          </td>
         </tr>
         <tr>
          <td><label for="LastName">Last name :</label></td>
          <td>
              <input type="text" id="LastName" name="LastName" value="<%=lastName %>">
              <span class="error" id="lastNameError"></span>
          </td>
         </tr>
         <tr>
          <td><label for="EmailAddress">Email Address :</label></td>
          <td>
              <input type="text" id="EmailAddress" name="EmailAddress" value="<%=emailAddress %>">
              <span class="error" id="emailError"></span>
          </td>
         </tr>
         <tr>
          <td><label for="PhoneNumber">Phone number:</label></td>
          <td>
              <input type="text" id="PhoneNumber" name="PhoneNumber" value="<%=phoneNumber %>">
              <span class="error" id="phoneError"></span>
          </td>
         </tr>
         <tr>
          <td><label for="Message">Message :</label></td>
          <td>
              <textarea id="Message" name="Message" rows="5"><%=message %></textarea>
              <span class="error" id="messageError"></span>
          </td>
         </tr>
         <tr>
          <td colspan="2" class="submit-cell">
            <input type="submit" value="Submit" class="submit-btn">
          </td>        
         </tr>
       </table>
  </form>
</div>

</body>
</html>
