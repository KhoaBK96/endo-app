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
public class RepairDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@NotNull
	private RepairOrder repairOrder;

	@ManyToOne
	private Part part;

	private Integer quantity;

	
	@JsonIgnore
	private boolean deleted;
	
	@Embedded
	private MetaData metaData;

	


	public RepairDetail(@NotNull RepairOrder repairOrder, Part part, Integer quantity) {
		super();
		this.repairOrder = repairOrder;
		this.part = part;
		this.quantity = quantity;
	}




	public RepairDetail(Integer id, @NotNull RepairOrder repairOrder, Part part, Integer quantity, boolean deleted) {
		super();
		this.id = id;
		this.repairOrder = repairOrder;
		this.part = part;
		this.quantity = quantity;
		this.deleted = deleted;
	}
	
	
}
