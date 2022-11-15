package com.khoa.endo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.khoa.endo.dto.UpdatePartDTO;
import com.khoa.endo.service.RepairRankForModelService;

@RestController
public class PartRestController {
	
	
	@Autowired
	RepairRankForModelService repairRankForModelService;
	
	@PostMapping("/api/repairRankForModel/updatePartList")
	private String updatePart(@RequestBody UpdatePartDTO updatePartDTO) {
		
		repairRankForModelService.updatePartList(updatePartDTO);
		
		return "";
	}
}
