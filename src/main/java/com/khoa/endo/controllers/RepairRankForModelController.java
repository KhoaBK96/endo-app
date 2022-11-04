package com.khoa.endo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		List<com.khoa.endo.model.Model> modelRepairList = modelService.getAll();
		
		List<RepairRank> repairRankList = repairRankService.getAll();
		
		model.addAttribute("repairRankList", repairRankList);
		
		model.addAttribute("modelRepairList", modelRepairList);

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
		
		return "repair-part";
	}
	
	
	
}
