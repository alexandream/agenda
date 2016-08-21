package net.xndk.agenda.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class GroupArtistParticipation implements Serializable {
	private static final long serialVersionUID = -337077920370019391L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	private Long id;

	@ManyToOne
	private GroupParticipation groupParticipation;
	
	@ManyToOne
	private Artist artist;
	
	
	@ManyToOne
	private Role role;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public GroupParticipation getGroupParticipation() {
		return groupParticipation;
	}


	public void setGroupParticipation(GroupParticipation groupParticipation) {
		this.groupParticipation = groupParticipation;
	}


	public Artist getArtist() {
		return artist;
	}


	public void setArtist(Artist artist) {
		this.artist = artist;
	}


	public Role getRole() {
		return role;
	}


	public void setRole(Role role) {
		this.role = role;
	}
}
