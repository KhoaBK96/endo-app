package com.khoa.endo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khoa.endo.model.RepairRank;
import com.khoa.endo.service.RepairRankService;

@Controller
@RequestMapping("/api/repairRank")
public class RepairRankController {

	@Autowired
	RepairRankService repairRankService;

	@GetMapping
	private String showRepairRank(Model model) {

		List<RepairRank> repairRankList = repairRankService.getAll();
		model.addAttribute("repairRankList", repairRankList);

		return "repair-rank";
	}

	@GetMapping("/add")
	private String createRepairRank(Model model) {

		RepairRank repairRank = new RepairRank();

		model.addAttribute("repairRank", repairRank);

		return "add-repair-rank";

	}

	@PostMapping("/save")
	private String saveRepairRank(RepairRank repairRank) {

		if (repairRank.getId() == null) {

			repairRankService.create(repairRank);

		} else {

			repairRankService.update(repairRank);

		}

		return "redirect:/api/repairRank";

	}

	@GetMapping("/edit")
	private String editRepairRank(@RequestParam("id") int id, Model model) {

		RepairRank foundRepairRank = repairRankService.getById(id);

		model.addAttribute("repairRank", foundRepairRank);

		return "add-repair-rank";

	}

	@GetMapping("/delete")
	private String deleteRepairRank(@RequestParam("id") int id) {

		RepairRank foundRepairRank = repairRankService.getById(id);

		foundRepairRank.setDeleted(true);

		repairRankService.update(foundRepairRank);

		return "redirect:/api/repairRank";
	}

}
