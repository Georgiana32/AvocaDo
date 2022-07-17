package net.javaguides.registration.model;

public class User {
	//private Integer id_role;
	private String name;
	private String country;
	private Integer age;
	private String email;
	private String password;
	private String number;
	
	
//	public Integer getId_role() {
//		return id_role;
//	}
//	public void setId_role(Integer id_role) {
//		this.id_role = 2;
//	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
}