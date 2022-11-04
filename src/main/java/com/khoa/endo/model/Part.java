package com.khoa.endo.model;

import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
public class Part {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotNull
	private String code;

	@NotNull
	private String name;

	@NotNull
	private Double price;
	
	@OneToMany(mappedBy = "part",  fetch = FetchType.LAZY)
	private List<RepairRankForModel> repairRankForModelList;
	
	@Embedded
	private MetaData metaData;
	
	@JsonIgnore
	private boolean deleted;

	@Override
	public String toString() {
		return "Part [id=" + id + ", code=" + code + ", name=" + name + ", price=" + price + ", deleted=" + deleted
				+ "]";
	}

	
	
	
}
