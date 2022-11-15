package com.khoa.endo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.khoa.endo.dto.UpdateDetailPartDTO;
import com.khoa.endo.service.RepairDetailService;

@RestController
public class RepairDetailRestController {
	
	@Autowired
	RepairDetailService repairDetailService;
	
	@PostMapping("/api/repairDetail/addRepairDetail") 
	private String updateRepairDetail(@RequestBody UpdateDetailPartDTO updateDetailPartDTO) {
		
		repairDetailService.updateRepairDetail(updateDetailPartDTO);
		
		return "";
	}
}
