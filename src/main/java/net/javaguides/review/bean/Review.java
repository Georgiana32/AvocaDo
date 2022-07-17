package net.javaguides.review.bean;

public class Review {
	private int id;
	private int user_id;
	private String user_name;
	private int course_id;
	private String review_text;

	public Review(int user_id, int course_id, String review_text) {
		this.setUser_id(user_id);
		this.setCourse_id(course_id);
		this.setReview_text(review_text);
		}
	
	public Review(int user_id, String review_text, String user_name) {
		this.setUser_name(user_name);
		this.setUser_id(user_id);
		this.setReview_text(review_text);
		}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getReview_text() {
		return review_text;
	}

	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

}
