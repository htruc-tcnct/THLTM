package model.bean;

import java.sql.Date;

public class Music {
	public Music(String name, String authorName, Date releasedDate, String description, String username, String iD) {
		super();
		this.name = name;
		this.authorName = authorName;
		this.releasedDate = releasedDate;
		this.description = description;
		this.username = username;
		this.iD = iD;
	}
	public Music(String iD,String name, String authorName, String description ) {
		super();
		this.name = name;
		this.authorName = authorName;
		
		this.description = description;
		
		this.iD = iD;
	}
	public Music() {
		
	}
	public String getID() {
		return iD;
	}

	public void setiD(String iD) {
		this.iD = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public Date getReleasedDate() {
		return releasedDate;
	}

	public void setReleasedDate(Date releasedDate) {
		this.releasedDate = releasedDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	private String name;
	private String authorName;
	private Date releasedDate;
	private String description;
	private String username;
	private String iD;
	  @Override
	    public String toString() {
	        return "Music{" +
	                "id=" + iD +
	                ", name='" + name + '\'' +
	                ", authorName='" + authorName + '\'' +
	                '}';
	    }
}
