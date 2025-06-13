document.addEventListener('DOMContentLoaded', function() {
    
    const form = document.querySelector('form');
    const cardNumberInput = document.getElementById('cardNumber');
    const expiryInput = document.getElementById('expiry');
    const cvvInput = document.getElementById('cvv');
    const nameOnCardInput = document.getElementById('nameOnCard');
    const submitBtn = document.querySelector('.submit-btn');

    
    cardNumberInput.addEventListener('input', function(e) {
        let value = e.target.value.replace(/\s+/g, '');
        if (value.length > 16) {
            value = value.substring(0, 16);
        }
        e.target.value = value.replace(/(\d{4})/g, '$1 ').trim();
    });

    
    expiryInput.addEventListener('input', function(e) {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 2) {
            value = value.substring(0, 2) + '/' + value.substring(2, 4);
        }
        e.target.value = value;
    });

    
    cvvInput.addEventListener('input', function(e) {
        e.target.value = e.target.value.replace(/\D/g, '').substring(0, 4);
    });

    // Form submission handler
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (validateForm()) {
            
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
            
            
            setTimeout(function() {
                
                form.submit();
            }, 1500);
        }
    });

    
    function validateForm() {
        let isValid = true;
        
        // Validate card number (16 digits)
        const cardNumber = cardNumberInput.value.replace(/\s+/g, '');
        if (cardNumber.length !== 16 || !/^\d+$/.test(cardNumber)) {
            showError(cardNumberInput, 'Please enter a valid 16-digit card number');
            isValid = false;
        } else {
            clearError(cardNumberInput);
        }
        
        // Validate expiry date (MM/YY format and not expired)
        const expiry = expiryInput.value;
        if (!/^\d{2}\/\d{2}$/.test(expiry)) {
            showError(expiryInput, 'Please enter a valid expiry date (MM/YY)');
            isValid = false;
        } else {
            const [month, year] = expiry.split('/');
            const currentYear = new Date().getFullYear() % 100;
            const currentMonth = new Date().getMonth() + 1;
            
            if (month < 1 || month > 12 || 
                year < currentYear || 
                (year == currentYear && month < currentMonth)) {
                showError(expiryInput, 'Please enter a valid future expiry date');
                isValid = false;
            } else {
                clearError(expiryInput);
            }
        }
        
        // Validate CVV (3-4 digits)
        if (!/^\d{3,4}$/.test(cvvInput.value)) {
            showError(cvvInput, 'Please enter a valid CVV (3-4 digits)');
            isValid = false;
        } else {
            clearError(cvvInput);
        }
        
        // Validate name on card
        if (nameOnCardInput.value.trim().length < 2) {
            showError(nameOnCardInput, 'Please enter the name on your card');
            isValid = false;
        } else {
            clearError(nameOnCardInput);
        }
        
        return isValid;
    }

    // Helper functions for error display
    function showError(input, message) {
        const formGroup = input.closest('.form-group');
        let errorElement = formGroup.querySelector('.error-message');
        
        if (!errorElement) {
            errorElement = document.createElement('div');
            errorElement.className = 'error-message';
            formGroup.appendChild(errorElement);
        }
        
        errorElement.textContent = message;
        input.style.borderColor = '#dc3545';
    }

    function clearError(input) {
        const formGroup = input.closest('.form-group');
        const errorElement = formGroup.querySelector('.error-message');
        
        if (errorElement) {
            errorElement.remove();
        }
        
        input.style.borderColor = '#ddd';
    }

    
    [cardNumberInput, expiryInput, cvvInput, nameOnCardInput].forEach(input => {
        input.addEventListener('blur', function() {
            validateForm();
        });
    });
});