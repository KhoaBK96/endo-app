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
import com.khoa.endo.service.PartService;

@Controller
@RequestMapping("/part")
public class PartController {

	@Autowired
	PartService partService;

	@GetMapping
	public String showPart(Model model) {

		List<Part> partList = partService.getAll();

		model.addAttribute("partList", partList);

		return "part";
	}

	@GetMapping("/add")
	public String addPart(Model model) {

		Part part = new Part();

		model.addAttribute("part", part);

		return "add-part";

	}

	@PostMapping("/save")
	public String savePart(Part part) {

		if (part.getId() == null) {
			partService.create(part);
		}else {
			partService.update(part);
		}

		return "redirect:/api/part";
	}

	@GetMapping("/edit")
	public String editPart(@RequestParam("id") int id, Model model) {

		Part foundPart = partService.getById(id);

		model.addAttribute("part", foundPart);

		return "add-part";
	}
}
