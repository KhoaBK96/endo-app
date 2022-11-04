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
import com.khoa.endo.model.RepairDetail;
import com.khoa.endo.model.RepairOrder;
import com.khoa.endo.service.PartService;
import com.khoa.endo.service.RepairDetailService;
import com.khoa.endo.service.RepairOrderService;

@Controller
@RequestMapping("/api/repairDetail")
public class RepairDetailController {

	@Autowired
	RepairDetailService repairDetailService;

	@Autowired
	PartService partService;

	@Autowired
	RepairOrderService repairOrderService;

	@GetMapping
	private String showRepairDetail(Model model) {

		List<RepairDetail> repairDetailList = repairDetailService.getAll();
		
		model.addAttribute("repairDetailList", repairDetailList);
		
		return "repair-detail";
	}

	@GetMapping("/add")
	private String addRepairDetail(Model model) {

		RepairDetail repairDetail = new RepairDetail();

		List<Part> partList = partService.getAll();

		List<RepairOrder> repairOrderList = repairOrderService.getAll();

		model.addAttribute("repairDetail", repairDetail);

		model.addAttribute("partList", partList);

		model.addAttribute("repairOrderList", repairOrderList);

		return "add-repair-detail";
	}

	@PostMapping("/save")
	private String saveRepairDetail(RepairDetail repairDetail) {

		repairDetailService.create(repairDetail);

		return "redirect:/api/repairDetail";
	}

	@GetMapping("/edit")
	private String editRepairDetail(@RequestParam("id") int id, Model model) {

		RepairDetail foundRepairDetail = repairDetailService.getById(id);

		List<Part> partList = partService.getAll();

		List<RepairOrder> repairOrderList = repairOrderService.getAll();

		model.addAttribute("foundRepairDetail", foundRepairDetail);
		
		model.addAttribute("partList", partList);

		model.addAttribute("repairOrderList", repairOrderList);

		return "add-repair-detail";
	}

	@GetMapping("/delete")
	private String deleteRepairDetail(@RequestParam("id") int id, Model model) {

		repairDetailService.delete(id);

		return "redirect:/api/repairDetail";
	}
}
