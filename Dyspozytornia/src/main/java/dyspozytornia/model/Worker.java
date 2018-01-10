package dyspozytornia.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="w_worker")
public class Worker implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String name;
	private String address;
	private String telephone;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	private boolean pass;
	
	public Worker() {}

	public Worker( String name, String address,String telephone, Date dateCreated, boolean pass) {
		super();
		this.name = name;
		this.address = address;
		this.telephone = telephone;
		this.dateCreated = dateCreated;
		this.pass = pass;
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

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public boolean isPass() {
		return pass;
	}

	public void setPass(boolean pass) {
		this.pass = pass;
	}
	
	@Override
	public String toString() {
		return "Task [id=" + id + ", name=" + name + ", address=" + address + ", telephone=" + telephone + ", dateCreated=" + dateCreated
				+ ", pass=" + pass + "]";
	}	
	
	
}
