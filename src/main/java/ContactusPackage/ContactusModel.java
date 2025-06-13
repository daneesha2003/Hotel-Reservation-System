package ContactusPackage;

public class ContactusModel {
	
	//Genarate variables for table

		private int idcontactus;
		private String FirstName;
		private String LastName;
		private String EmailAddress;
		private String PhoneNumber;
		private String Message;
		
		public ContactusModel(int idcontactus, String firstName, String lastName, String emailAddress,
				String phoneNumber, String message) {
			super();
			this.idcontactus = idcontactus;
			FirstName = firstName;
			LastName = lastName;
			EmailAddress = emailAddress;
			PhoneNumber = phoneNumber;
			Message = message;
		}
		public int getIdcontactus() {
			return idcontactus;
		}
		public void setIdcontactus(int idcontactus) {
			this.idcontactus = idcontactus;
		}
		public String getFirstName() {
			return FirstName;
		}
		public void setFirstName(String firstName) {
			FirstName = firstName;
		}
		public String getLastName() {
			return LastName;
		}
		public void setLastName(String lastName) {
			LastName = lastName;
		}
		public String getEmailAddress() {
			return EmailAddress;
		}
		public void setEmailAddress(String emailAddress) {
			EmailAddress = emailAddress;
		}
		public String getPhoneNumber() {
			return PhoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			PhoneNumber = phoneNumber;
		}
		public String getMessage() {
			return Message;
		}
		public void setMessage(String message) {
			Message = message;
		}
		
		
}
