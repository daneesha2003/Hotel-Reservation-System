package ReservationPackage;

import java.time.LocalDate;

public class ReservationModel {
	
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String roomType;
	private LocalDate checkIn;
	private LocalDate checkOut;
	private int totalLengthStay;
	private String specialRequest;
	private double roomCharges;
	private double taxes;
	private double totalAmount;
	
	public ReservationModel(int id, String firstName, String lastName, String email, String phone, String roomType,
			LocalDate checkIn, LocalDate checkOut, int totalLengthStay, String specialRequest) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.roomType = roomType;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.totalLengthStay = totalLengthStay;
		this.specialRequest = specialRequest;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public LocalDate getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(LocalDate checkIn) {
		this.checkIn = checkIn;
	}

	public LocalDate getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(LocalDate checkOut) {
		this.checkOut = checkOut;
	}

	public int getTotalLengthStay() {
		return totalLengthStay;
	}

	public void setTotalLengthStay(int totalLengthStay) {
		this.totalLengthStay = totalLengthStay;
	}

	public String getSpecialRequest() {
		return specialRequest;
	}

	public void setSpecialRequest(String specialRequest) {
		this.specialRequest = specialRequest;
	}
	
	public double getRoomCharges() {
	    return roomCharges;
	}

	public void setRoomCharges(double roomCharges) {
	    this.roomCharges = roomCharges;
	}

	public double getTaxes() {
	    return taxes;
	}

	public void setTaxes(double taxes) {
	    this.taxes = taxes;
	}

	public double getTotalAmount() {
	    return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
	    this.totalAmount = totalAmount;
	}
	

}
