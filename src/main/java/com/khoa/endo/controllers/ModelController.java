package com.khoa.endo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khoa.endo.service.ModelService;

@Controller
@RequestMapping("/model")
public class ModelController {

	@Autowired
	ModelService modelService;

	@GetMapping
	public String showModdel(Model model) {

		List<com.khoa.endo.model.Model> modelList = modelService.getAll();

		model.addAttribute("modelList", modelList);

		return "model";

	}

	@GetMapping("/add")
	public String addModel(Model model) {

		com.khoa.endo.model.Model createModel = new com.khoa.endo.model.Model();

		model.addAttribute("model", createModel);

		return "add-model";
	}

	@PostMapping("/save")
	public String saveModel(com.khoa.endo.model.Model model) {

		if (model.getId() == null) {
			
			modelService.create(model);
			
		} else {
			
			modelService.update(model);
			
		}

		return "redirect:/model";

	}

	@GetMapping("/edit")
	public String editModel(@RequestParam("id") int id, Model model) {

		com.khoa.endo.model.Model foundModel = modelService.getById(id);

		model.addAttribute("model", foundModel);

		return "add-model";

	}
	
	@GetMapping("/delete")
	public String deleteModel(@RequestParam("id") int id) {
		
		modelService.delete(id);
		
		return "redirect:/model";
		
	}
}
