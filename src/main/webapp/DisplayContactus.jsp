<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us Table</title>
<!-- Link to external CSS -->
<link rel="stylesheet" href="style/displayContactus.css">

<!-- Google Fonts: Lora -->
<link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
</head>
<body>



   <h2>Reach to us!</h2>
   <div class="table-container">
   <table>
    <thead>
      <tr>
         <th>ID</th>
         <th>First Name</th>
         <th>Last Name</th>
         <th>Email</th>
         <th>Phone Number</th>
         <th>Message</th>
         <th>Action</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="contact" items="${allcontacts}">
       <tr>
            <td>${contact.idcontactus}</td>
            <td>${contact.firstName}</td>
            <td>${contact.lastName}</td>
            <td>${contact.emailAddress}</td>
            <td>${contact.phoneNumber}</td>
            <td>${contact.message}</td> 
            <td>
              <a href="UpdateContactus.jsp?id=${contact.idcontactus}&amp;fname=${contact.firstName}&amp;lname=${contact.lastName}&amp;email=${contact.emailAddress}&amp;phone=${contact.phoneNumber}&amp;message=${contact.message}">
                <button>Update</button>
              </a>
              
              <form action="DeleteContactusServlet" method="post" style="display:inline;">
                <input type="hidden" name="id" value="${contact.idcontactus}">
                <button type="submit">Delete</button>
              </form>
            </td> 
       </tr>
    </c:forEach>
    </tbody>
  </table>
  </div>
   
</body>
</html>
