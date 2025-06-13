package ReservationPackage;


public class RoomBill extends CalculateBill {
	
	// Constructor
    public RoomBill(String roomType) {
        super(roomType);
    }
    
    // Implement the calculateRoomCharges method
    @Override
    public double calculateRoomCharges(int nights) {
        double ratePerNight;
        
        
        // Define rates based on room type
        switch (roomType.toLowerCase()) {
            case "single":
                ratePerNight = 38965.0;
                break;
            case "double":
                ratePerNight = 43876.0;
                break;
            case "suite":
                ratePerNight = 50983.0;
                break;
            case "deluxe":
                ratePerNight = 60988.0;
                break;    
            default:
                throw new IllegalArgumentException("Invalid room type");
        }

        // Calculate room charges
        return ratePerNight * nights;
    }

}
