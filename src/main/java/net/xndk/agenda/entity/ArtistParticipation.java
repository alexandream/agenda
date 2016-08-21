package net.xndk.agenda.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class ArtistParticipation implements Serializable {
	private static final long serialVersionUID = 5987091951880542162L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	private Long id;
	
	@ManyToOne(optional=false)
	private Event event;
	
	@ManyToOne(optional=false)
	private Artist artist;
	
	@Column(nullable=false)
	private Boolean specialParticipation;
	
	@ManyToMany
	private List<Role> roles;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public Boolean getSpecialParticipation() {
		return specialParticipation;
	}

	public void setSpecialParticipation(Boolean specialParticipation) {
		this.specialParticipation = specialParticipation;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
}
