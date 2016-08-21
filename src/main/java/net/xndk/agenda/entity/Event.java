package net.xndk.agenda.entity;

import static javax.persistence.FetchType.EAGER;
import static javax.persistence.GenerationType.SEQUENCE;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Event implements Serializable {
	private static final long serialVersionUID = -6418699531875245005L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	private Long id;
	
	private Calendar date;
	
	private BigDecimal price;
	
	@Lob
	private String notes;
	
	@ManyToOne
	private Series series;
	
	@ManyToOne(optional=false)
	private Venue venue;
	
	@OneToMany(mappedBy="event", fetch=EAGER)
	private List<ArtistParticipation> artists;
	
	@OneToMany(mappedBy="event", fetch=EAGER)
	private List<GroupParticipation> groups;

	@ManyToMany
	private List<ProgrammeItem> programme;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Calendar getDate() {
		return date;
	}

	public void setDate(Calendar date) {
		this.date = date;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Series getSeries() {
		return series;
	}

	public void setSeries(Series series) {
		this.series = series;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}
}