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
import com.khoa.endo.model.RepairDetail;
import com.khoa.endo.model.RepairOrder;
import com.khoa.endo.model.RepairRank;
import com.khoa.endo.model.RepairRankForModel;
import com.khoa.endo.model.Status;
import com.khoa.endo.service.PartService;
import com.khoa.endo.service.RepairDetailService;
import com.khoa.endo.service.RepairOrderService;
import com.khoa.endo.service.RepairRankForModelService;
import com.khoa.endo.service.RepairRankService;

@Controller
@RequestMapping("/repairDetail")
public class RepairDetailController {

	@Autowired
	RepairDetailService repairDetailService;

	@Autowired
	PartService partService;

	@Autowired
	RepairOrderService repairOrderService;

	@Autowired
	RepairRankService repairRankService;

	@Autowired
	RepairRankForModelService repairRankForModelService;

	@GetMapping
	private String showRepairDetail(@RequestParam("id") int repairOrderId, Model model) {

		List<RepairDetail> repairDetailList = repairDetailService.showPartDetail(repairOrderId);
		model.addAttribute("repairDetailList", repairDetailList);

		RepairOrder repairOrder = repairOrderService.getById(repairOrderId);
		model.addAttribute("repairOrder", repairOrder);

		return "repair-detail";
	}
	
	@GetMapping("/editPartList")
	private String editPartList(@RequestParam("repairOrderId") int repairOrderId, Model model) {
		
		List<RepairDetail> repairDetailList = repairDetailService.showPartDetail(repairOrderId);
		
		List<Part> partList = partService.getAll();

		HashMap<String, PartDTO> partMap = new HashMap<String, PartDTO>();
		
		RepairOrder repairOrder = repairOrderService.getById(repairOrderId);
		model.addAttribute("repairOrder", repairOrder);
		

		for (Integer i = 0; i < partList.size(); i++) {
			Part part = partList.get(i);

			PartDTO partDTO = new PartDTO(part);
			partMap.put(part.getName(), partDTO);

		}
		
		for (Integer i = 0; i < repairDetailList.size(); i++) {
			Part part = repairDetailList.get(i).getPart();
			Integer quantity = repairDetailList.get(i).getQuantity();

			PartDTO partDTO = partMap.get(part.getName());
			partDTO.setQuantity(quantity);
		}
		
		Collection<PartDTO> partQuantityList = partMap.values();
		model.addAttribute("partQuantityList", partQuantityList);
		
		return "edit-repair-part";
	}

	@GetMapping("/add")
	private String addRepairDetail(@RequestParam int repairOrderId, Model model) {

		RepairOrder repairOrder = repairOrderService.getById(repairOrderId);
		model.addAttribute("repairOrder", repairOrder);

		com.khoa.endo.model.Model modelRepair = repairOrder.getModel();
		model.addAttribute("model", modelRepair);

		List<RepairRank> repairRankList = repairRankService.getAll();
		model.addAttribute("repairRankList", repairRankList);

		return "add-repair-detail";
	}

	@PostMapping("/editRepairDetail")
	private String saveRepairDetail(RepairOrder repairOrder, Model model) {

		com.khoa.endo.model.Model modelRepair = repairOrder.getModel();
		RepairRank rank = repairOrder.getRepairRank();

		int modelId = modelRepair.getId();
		int rankId = rank.getId();

		model.addAttribute("modelRepair", modelRepair);
		model.addAttribute("rank", rank);
		model.addAttribute("repairOrder", repairOrder);

		List<Part> partList = partService.getAll();

		HashMap<String, PartDTO> partMap = new HashMap<String, PartDTO>();

		for (Integer i = 0; i < partList.size(); i++) {
			Part part = partList.get(i);

			PartDTO partDTO = new PartDTO(part);
			partMap.put(part.getName(), partDTO);

		}
		List<RepairRankForModel> foundRepairRankForModelList = repairRankForModelService.showRepairRankForModel(modelId,
				rankId);

		for (Integer i = 0; i < foundRepairRankForModelList.size(); i++) {
			Part part = foundRepairRankForModelList.get(i).getPart();
			Integer quantity = foundRepairRankForModelList.get(i).getQuantity();

			PartDTO partDTO = partMap.get(part.getName());
			partDTO.setQuantity(quantity);
		}

		Collection<PartDTO> partQuantityList = partMap.values();
		model.addAttribute("partQuantityList", partQuantityList);

		List<RepairDetail> repairDetailList = repairDetailService.showPartDetail(repairOrder.getId());
		model.addAttribute("repairDetailList", repairDetailList);

		return "repair-detail-edit";
	}
	


	@GetMapping("/delete")
	private String deleteRepairDetail(@RequestParam("id") int id, Model model) {

		repairDetailService.delete(id);

		return "redirect:/repairDetail";
	}

	@GetMapping("/quotationComplete")
	private String updateQuotationStatus(@RequestParam("repairOrderId") int repairOrderId, Model model) {

		RepairOrder repairOrder = repairOrderService.getById(repairOrderId);

		repairOrder.setStatus(Status.WAITING_FOR_REPAIR);

		repairOrderService.update(repairOrder);

		return "redirect:/repairOrder";
	}

	@GetMapping("/repairComplete")
	private String updateRepairStatus(@RequestParam("repairOrderId") int repairOrderId, Model model) {

		RepairOrder repairOrder = repairOrderService.getById(repairOrderId);

		repairOrder.setStatus(Status.COMPLETE);

		repairOrderService.update(repairOrder);

		return "redirect:/repairOrder";
	}
	
	
}
