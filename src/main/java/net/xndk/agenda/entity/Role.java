package net.xndk.agenda.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Entity
public class Role implements Serializable {
	private static final long serialVersionUID = -1065821912542676520L;
	
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	private Long id;
	
	private String description;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}   
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
   
}
