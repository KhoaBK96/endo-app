package com.khoa.endo.controllers;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khoa.endo.dto.PartDTO;
import com.khoa.endo.model.Part;
import com.khoa.endo.model.RepairRank;
import com.khoa.endo.model.RepairRankForModel;
import com.khoa.endo.service.ModelService;
import com.khoa.endo.service.PartService;
import com.khoa.endo.service.RepairRankForModelService;
import com.khoa.endo.service.RepairRankService;

@Controller
@RequestMapping("/api/repairRankForModel")
public class RepairRankForModelController {

	@Autowired
	RepairRankForModelService repairRankForModelService;

	@Autowired
	ModelService modelService;

	@Autowired
	RepairRankService repairRankService;
	
	@Autowired
	PartService partService;
	
	@GetMapping
	private String showRepairRankForModel(Model model) {

		List<RepairRankForModel> repairRankForModels = repairRankForModelService.getAll();
		
		model.addAttribute("repairRankForModels", repairRankForModels);

		return "repair-rank-for-model";
	}

	@GetMapping("/add")
	private String createRepairRankForModel(Model model) {

		RepairRankForModel repairRankForModel = new RepairRankForModel();

		List<com.khoa.endo.model.Model> modelRepairList = modelService.getAll();

		List<RepairRank> repairRankList = repairRankService.getAll();
		
		model.addAttribute("repairRankForModel", repairRankForModel);

		model.addAttribute("modelList", modelRepairList);

		model.addAttribute("repairRankList", repairRankList);
		
		return "add-repair-rank-for-model";
	}

	
	@PostMapping("/showPartList")
	private String getPart(RepairRankForModel repairRankForModel, Model model) {
		
		Integer modelId = repairRankForModel.getModel().getId();
		
		Integer rankId = repairRankForModel.getRepairRank().getId();
					
		List<RepairRankForModel> foundRepairRankForModelList = repairRankForModelService.showRepairRankForModel(modelId, rankId);		
		
		model.addAttribute("repairRankForModelList", foundRepairRankForModelList);	
		
		model.addAttribute("modelId", modelId);
		
		model.addAttribute("rankId", rankId);
		
		return "repair-rank-for-model-part";
		
	}
	
	@GetMapping("/editPart")
	private String addPart(@RequestParam("modelId") int modelId, @RequestParam("rankId") int rankId, Model model) {
		
		List<Part> partList = partService.getAll();
		
		com.khoa.endo.model.Model modelRepair = modelService.getById(modelId);
		
		RepairRank rank = repairRankService.getById(rankId);
		
		model.addAttribute("partList", partList);	
		model.addAttribute("modelRepair", modelRepair);	
		model.addAttribute("rank", rank);
		
		HashMap<String, PartDTO> partMap = new HashMap<String, PartDTO>();
		
		
		for(Integer i=0; i< partList.size(); i++) {
			Part part = partList.get(i);
			
			PartDTO partDTO = new PartDTO(part);
			partMap.put(part.getName(), partDTO);
			
		}
		
		List<RepairRankForModel> foundRepairRankForModelList = repairRankForModelService.showRepairRankForModel(modelId, rankId);
		
		for(Integer i=0; i<foundRepairRankForModelList.size(); i++) {
			Part part = foundRepairRankForModelList.get(i).getPart();
			Integer quantity = foundRepairRankForModelList.get(i).getQuantity();
			
			PartDTO partDTO = partMap.get(part.getName());
			partDTO.setQuantity(quantity);
		}
		
		Collection<PartDTO> partQuantityList = partMap.values();
		model.addAttribute("partQuantityList", partQuantityList);
		
		return "repair-part";
	}
	
}
