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
public class UpdatePartDTO {
	
	private List<PartIdQuantityDTO> partIdQuantityList;
	
	private Integer modelId;
	
	private Integer repairRankId;
}
