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
public class RepairRank {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotNull(message = "model không được để trống ")
	private String name;
	
	@OneToMany(mappedBy = "repairRank", fetch = FetchType.LAZY)
	private List<RepairRankForModel> repairRankForModelList;
	
	@OneToMany(mappedBy = "repairRank", fetch = FetchType.LAZY)
	private List<RepairOrder> repairOrders;
	
	@JsonIgnore
	private boolean deleted;
	
	@Embedded
	private MetaData metaData;

	@Override
	public String toString() {
		return "RepairRank [id=" + id + ", name=" + name + ", deleted=" + deleted + "]";
	} 

	

}
