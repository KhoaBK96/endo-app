package com.khoa.endo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khoa.endo.model.Role;
import com.khoa.endo.model.RoleCode;
import com.khoa.endo.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	RoleService roleService;

	@GetMapping
	public String showRole(Model model) {

		List<Role> roleList = roleService.getAll();

		model.addAttribute("roleList", roleList);

		return "role";
	}
	
	@GetMapping("/add")
	public String  addRole(Model model) {
		
		Role role = new Role();
		
		RoleCode[] roleCodes = RoleCode.values();
		
		model.addAttribute("roleCodes", roleCodes);
		model.addAttribute("role", role);
		
		return "add-role";
	}
	
	@PostMapping("/save")
	public String saveRole(Role role) {
		
		if(role.getId() == null) {
			roleService.create(role);

		}
		else {
			roleService.update(role);
		}
		
		return "redirect:/role";
	}
	
	@GetMapping("/edit")
	public String editRole(@RequestParam("id") int id, Model model) {
		
		Role editRole = roleService.getById(id);
		model.addAttribute("role", editRole);
		
		RoleCode[] roleCodes = RoleCode.values();
		model.addAttribute("roleCodes", roleCodes);
		
		return "add-role";
		
	}
	
	@GetMapping("/delete")
	public String deleteRole(@RequestParam("id") int id) {

		roleService.delete(id);
		
		return "redirect:/role";
		
	}
}
