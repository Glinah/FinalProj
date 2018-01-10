package dyspozytornia.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="c_cars")
public class Car {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String brand;
	private String model;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	private boolean pass;
	
	
	public Car() {}
	
	public Car( String brand, String model, Date dateCreated, boolean pass) {
		super();
		this.brand = brand;
		this.model = model;
		this.dateCreated = dateCreated;
		this.pass = pass;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
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
		return "Task [id=" + id + ", brand=" + brand + ", model=" + model + ", dateCreated=" + dateCreated
				+ ", pass=" + pass + "]";
	}	
	
	
	
	
	
}
