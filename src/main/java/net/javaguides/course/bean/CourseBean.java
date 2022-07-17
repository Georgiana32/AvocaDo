package net.javaguides.course.bean;

public class CourseBean {
	protected int id;
	protected String course_name;
	protected String course_description;
	protected String content;
	protected String course_link;
	protected String course_pic;
	
	public CourseBean() {}
	
	public CourseBean(String course_name, String course_description, String content, String course_link, String course_pic) {
		this.course_name = course_name;
		this.course_description = course_description;
		this.content = content;
		this.course_link = course_link;
		this.course_pic = course_pic;
		}
	
	public CourseBean(int id, String course_name, String course_description, String content, String course_link, String course_pic) {
		this.id = id;
		this.course_name = course_name;
		this.course_description = course_description;
		this.content = content;
		this.course_link = course_link;
		this.course_pic = course_pic;
		}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getCourse_description() {
		return course_description;
	}

	public void setCourse_description(String course_description) {
		this.course_description = course_description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCourse_link() {
		return course_link;
	}

	public void setCourse_link(String course_link) {
		this.course_link = course_link;
	}

	public String getCourse_pic() {
		return course_pic;
	}

	public void setCourse_pic(String course_pic) {
		this.course_pic = course_pic;
	}
	
}

