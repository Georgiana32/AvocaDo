package net.javaguides.user.bean;

public class UserBean {
	protected int id;
	protected String name;
	protected String email;
	protected String country;
	protected int age;
	protected int number;
	
	public UserBean() {}
	
	public UserBean(String name, String email, String country, int age, int number) {
		super();
		this.name = name;
		this.email = email;
		this.country = country;
		this.age = age;
		this.number = number;
	}
	
	public UserBean(int id, String name, String email, String country, int age, int number) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.country = country;
		this.age = age;
		this.number = number;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	
}