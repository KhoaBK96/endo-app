package com.khoa.endo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khoa.endo.model.RepairDetail;
import com.khoa.endo.model.RepairOrder;
import com.khoa.endo.model.RepairRank;
import com.khoa.endo.service.ModelService;
import com.khoa.endo.service.RepairDetailService;
import com.khoa.endo.service.RepairOrderService;
import com.khoa.endo.service.RepairRankService;

@Controller
@RequestMapping("/api/repairOrder")
public class RepairOrderController {

	@Autowired
	RepairOrderService repairOrderService;

	@Autowired
	RepairRankService repairRankService;

	@Autowired
	ModelService modelService;
	
	@Autowired
	RepairDetailService repairDetailService;

	@GetMapping
	private String showRepairOrder(Model model) {
		
		List<RepairOrder> repairOrderList = repairOrderService.getAll();
		
		List<RepairRank> repairRankList = repairRankService.getAll();
		
		List<com.khoa.endo.model.Model> modelList = modelService.getAll();
		
		model.addAttribute("repairRankList", repairRankList);
		
		model.addAttribute("modelList", modelList);
		
		model.addAttribute("repairOrderList", repairOrderList);
		
		return "repair-order";
	}

	@GetMapping("/add")
	private String addRepairOrder(Model model) {

		RepairOrder repairOrder = new RepairOrder();

		List<RepairRank> repairRankList = repairRankService.getAll();

		List<com.khoa.endo.model.Model> modelList = modelService.getAll();

		model.addAttribute("repairRankList", repairRankList);

		model.addAttribute("modelList", modelList);
		
		model.addAttribute("repairOrder", repairOrder);

		return "add-repair-order";

	}

	@PostMapping("/save")
	private String saveRepairOrder(RepairOrder repairOrder) {

		repairOrderService.create(repairOrder);

		return "redirect:/api/repair-order";
	}

	@GetMapping("/edit")
	private String editRepairOrder(@RequestParam("id") int id, Model model) {

		RepairOrder repairOrder = repairOrderService.getById(id);

		List<RepairRank> repairRankList = repairRankService.getAll();

		List<com.khoa.endo.model.Model> modelList = modelService.getAll();

		model.addAttribute("repairRankList", repairRankList);

		model.addAttribute("modelList", modelList);

		model.addAttribute("repairOrder", repairOrder);

		return "add-repair-order";
	}

	@GetMapping("/delete")
	private String deleteRepairOrder(@RequestParam("id") int id) {

		repairOrderService.delete(id);

		return "repair-order";
	}
	
	@GetMapping("/repairDetail")
	private String showDetail(@RequestParam("id") int id, Model model) {
		
		List<RepairDetail> RepairDetailList = repairDetailService.showPartDetail(id);
		
		model.addAttribute("repairDetailList", RepairDetailList);
		
		return "repair-detail";
	}
}
