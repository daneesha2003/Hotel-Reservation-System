package staysPackage;

public class StayModel {

	private int id;
    private String name;
    private String location;
    private String description;
    private double singleRate;
    private double doubleRate;
    private double suiteRate;
    private double deluxeRate;
    private String rating;
    private String amenities;
    
    
	public StayModel(int id, String name, String location, String description, double singleRate, double doubleRate,
			double suiteRate, double deluxeRate, String rating, String amenities) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.description = description;
		this.singleRate = singleRate;
		this.doubleRate = doubleRate;
		this.suiteRate = suiteRate;
		this.deluxeRate = deluxeRate;
		this.rating = rating;
		this.amenities = amenities;
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getSingleRate() {
		return singleRate;
	}
	public void setSingleRate(double singleRate) {
		this.singleRate = singleRate;
	}
	public double getDoubleRate() {
		return doubleRate;
	}
	public void setDoubleRate(double doubleRate) {
		this.doubleRate = doubleRate;
	}
	public double getSuiteRate() {
		return suiteRate;
	}
	public void setSuiteRate(double suiteRate) {
		this.suiteRate = suiteRate;
	}
	public double getDeluxeRate() {
		return deluxeRate;
	}
	public void setDeluxeRate(double deluxeRate) {
		this.deluxeRate = deluxeRate;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getAmenities() {
		return amenities;
	}
	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}
	
  
    
}
