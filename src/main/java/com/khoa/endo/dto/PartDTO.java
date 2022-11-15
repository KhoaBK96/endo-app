package com.khoa.endo.dto;

import com.khoa.endo.model.Part;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PartDTO {
	
	private Part part;
	
	private int quantity;

	public PartDTO(Part part) {
		super();
		this.part = part;
	}
	
	
}
