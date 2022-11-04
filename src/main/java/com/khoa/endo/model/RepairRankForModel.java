package com.khoa.endo.model;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RepairRankForModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@NotNull
	private Model model;
	
	@ManyToOne
	@NotNull
	private RepairRank repairRank;
	
	@ManyToOne
	@NotNull
	private Part part;
	
	@NotNull
	private Integer quantity;
	
	@JsonIgnore
	private boolean deleted;
	
	@Embedded
	private MetaData metaData; 

	@Override
	public String toString() {
		return "RepairRankForModel [id=" + id + ", model=" + model + ", repairRank=" + repairRank + ", part=" + part
				+ ", quantity=" + quantity + ", deleted=" + deleted + "]";
	}
	
	
}
