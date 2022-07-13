package BonFire.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="tbl_contact")
public class Contact extends BaseEntity {
	@Column(name="first_name", length=45, nullable = true)
	private String first_name;
	
	@Column(name="last_name", length=45, nullable = true)
	private String last_name;
	
	@Column(name="email", length=45, nullable = true)
	private String email;
	
	@Column(name="request_type", length=45, nullable = true)
	private String request_type;

	@Column(name="message", length=1000, nullable = false)
	private String message;

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequest_type() {
		return request_type;
	}

	public void setRequest_type(String request_type) {
		this.request_type = request_type;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
	
	
}
