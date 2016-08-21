package net.xndk.agenda.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class GroupParticipation implements Serializable {
	private static final long serialVersionUID = -2180528682359883651L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	private Long id;

	@ManyToOne(optional=false)
	private Event event;
	
	@ManyToOne(optional=false)
	private Group group;
	
	@Column(nullable=false)
	private Boolean specialParticipation;
	
	@OneToMany(mappedBy="groupParticipation")
	private List<GroupArtistParticipation> artistParticipations;

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

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public Boolean getSpecialParticipation() {
		return specialParticipation;
	}

	public void setSpecialParticipation(Boolean specialParticipation) {
		this.specialParticipation = specialParticipation;
	}

	public List<GroupArtistParticipation> getArtistParticipations() {
		return artistParticipations;
	}

	public void setArtistParticipations(List<GroupArtistParticipation> artistParticipations) {
		this.artistParticipations = artistParticipations;
	}
}
