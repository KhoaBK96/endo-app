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
import com.khoa.endo.model.Staff;
import com.khoa.endo.service.RoleService;
import com.khoa.endo.service.StaffService;

@Controller
@RequestMapping("/staff")
public class StaffController {

	@Autowired
	private StaffService staffService;

	@Autowired
	private RoleService roleService;

	@GetMapping
	public String showStaff(Model model) {

		List<Staff> staffList = staffService.getAll();

		model.addAttribute("staffList", staffList);

		return "staff";
	}

	@GetMapping("/add")
	public String createStaff(Model model) {

		Staff staff = new Staff();

		List<Role> roleList = roleService.getAll();

		model.addAttribute("staff", staff);

		model.addAttribute("roles", roleList);

		return "add-staff";

	}

	@PostMapping("/save")
	public String saveStaff(Staff staff) {

		if (staff.getId() == null) {

			staffService.create(staff);
			
		} else {
			
			staffService.update(staff);
		}

		return "redirect:/staff";
	}

	@GetMapping("/edit")
	public String editStaff(@RequestParam("id") int id, Model model) {

		Staff editStaff = staffService.getById(id);

		model.addAttribute("staff", editStaff);

		List<Role> roleList = roleService.getAll();

		model.addAttribute("roles", roleList);

		return "add-staff";
	}

	@GetMapping("/delete")
	public String deleteStaff(@RequestParam("id") int id) {

		staffService.delete(id);

		return "redirect:/staff";
	}
}
