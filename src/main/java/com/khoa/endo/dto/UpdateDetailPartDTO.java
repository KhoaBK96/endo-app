package com.khoa.endo.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateDetailPartDTO {
	
	private List<PartIdQuantityDTO> partIdQuantityList;
	
	private int modelId;
	
	private int repairRankId;
	
	private int repairOrderId;
}
