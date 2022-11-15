package com.khoa.endo.model;

import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
public class RepairOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@NotNull
	private String code;
	
	@ManyToOne
	@NotNull
	private Model model;
	
	@NotNull
	private Status status;
	
	@NotNull
	private String hospital;
	
	@ManyToOne
	private RepairRank repairRank;
	
	@OneToMany(mappedBy = "repairOrder", fetch = FetchType.LAZY)
	private List<RepairDetail> repairDetail;
	
	@JsonIgnore
	private boolean deleted;
	
	@Embedded
	private MetaData metaData;

	@Override
	public String toString() {
		return "RepairOrder [id=" + id + ", code=" + code + ", status=" + status + ", hospital=" + hospital
				+ ", deleted=" + deleted + "]";
	} 

	
	
	
}
