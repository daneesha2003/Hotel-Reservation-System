package FeedbackPackage;

public class FeedbackModel {
    private int id;
    private String name;
    private String email;
    private String feedback;
    private int rating; 

    // Updated constructor including rating
    public FeedbackModel(int id, String name, String email, String feedback, int rating) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.feedback = feedback;
        this.rating = rating;
    }

    // Getters and Setters
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

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getFeedback() {
        return feedback;
    }
    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }
}
