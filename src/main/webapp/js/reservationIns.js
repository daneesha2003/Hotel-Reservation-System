function validateForm() {
    
    var email = document.getElementById('myEmail').value.trim();
    var mobilenumber = document.getElementById('mobileNumber').value.trim();
    
    // Regular Expression Patterns
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var phonePattern = /^0\d{9}$/; // Sri Lankan format (10 digits starting with 0)


    // Validate Email
    if (email === "") {
        alert("Email must be filled out");
        document.getElementById('myEmail').focus();
        return false;
    } else if (!emailPattern.test(email)) {
        alert("Please enter a valid email address");
        document.getElementById('myEmail').focus();
        return false;
    }
    
    // Validate Phone Number
    if (mobilenumber === "") {
        alert("Phone number must be filled out");
        document.getElementById('mobileNumber').focus();
        return false;
    } else if (!phonePattern.test(mobilenumber)) {
        alert("Please enter a valid 10-digit phone number starting with 0");
        document.getElementById('mobileNumber').focus();
        return false;
    }

    // If all validations pass
    return true;
}