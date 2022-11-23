package com.khoa.endo.controllers;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.khoa.endo.dto.UpdatePartDTO;
import com.khoa.endo.service.RepairRankForModelService;

@RestController("/api/v1/parts")
public class PartRestController {

	@Autowired
	RepairRankForModelService repairRankForModelService;
	
	@PostMapping("/updatePartList")
	private int updatePart(@RequestBody UpdatePartDTO updatePartDTO) {
		
		repairRankForModelService.updatePartList(updatePartDTO);
		
		return  Response.SC_OK;
	}
//  /api/v1/parts?sort=asc&page=1&category=1
//	@GetMapping("")
//	private List<Part> getAll(@RequestParam("sort") string sort) 
//	{
//		if (sort == null) {
//			sort = "asc"
//  	}
//		return new List<Part>(); // tra ve tat ca parts
//	}
//	
//	@GetMapping("/{partId}") // api/v1/parts/{partId}
//	private Part getById(@PathVariable("partId") int partId) 
//	{
//		return new Part(); // tra ve part theo ID
//	}
//	
//	@PostMapping("") // POST api/v1/parts
//	private ResponseEntity<Part> create(@RequestBody Part part) 
//	{
//		// luu vo db
//		return ResponseEntity.created(new Part()); // tra ve part moi tao // 201
//	}
//	
//	@PutMapping("/{partId}") // PUT/UPDATE api/v1/parts/{partId}
//	private Part update(@PathVariable("partId") int partId, @RequestBody Part part) 
//	{
//		// check ID param === part trong body kv -> update
//		return new Part(); // tra ve part vua update
//	}
//	
//	@DeleteMapping("/{partId}") // DELETE api/v1/parts/{partId}?permanent=false
//	private ResponseEntity delete(@PathVariable("partId") int partId) 
//	{
//		return ResponseEntity.ok(); //; // tra ve part vua update
//	}
//	
//	@PostMapping("/do-some-thing") // POST api/v1/parts/doST or api/v1/parts/{partId}/doST 
//	private ResponseEntity<Part> doSomeThing(@PathVariable("partId") int partId, @RequestBody DTO part) 
//	{
//		// luu vo db
//		return ResponseEntity.ok(new Part()); // tra ve part moi tao // 201
//	}
}
