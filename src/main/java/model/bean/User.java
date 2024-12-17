package model.bean;

public class User {
	public User(String username, String fullName, int age, String phoneNumber) {
		super();
		this.username = username;
		this.fullName = fullName;
		this.age = age;
		this.phoneNumber = phoneNumber;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	private String username;
	private String fullName;
	private int age;
	private String phoneNumber;
}
