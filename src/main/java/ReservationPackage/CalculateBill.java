package ReservationPackage;

public abstract class CalculateBill {
	
protected String roomType;
    
    public CalculateBill(String roomType) {
        this.roomType = roomType;
    }
    
    // Abstract method to calculate room charges (to be defined in subclasses)
    public abstract double calculateRoomCharges(int nights);
    
    // Method to calculate total amount
    public double getTotalAmount(int nights) {
        double roomCharges = calculateRoomCharges(nights);
        double taxes = roomCharges * 0.1;        // 10% tax
        return roomCharges + taxes;
    }
}
