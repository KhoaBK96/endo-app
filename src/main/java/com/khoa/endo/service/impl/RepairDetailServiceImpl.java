package com.khoa.endo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.dto.PartIdQuantityDTO;
import com.khoa.endo.dto.UpdateDetailPartDTO;
import com.khoa.endo.exception.RepairDetailNotFoundException;
import com.khoa.endo.model.Part;
import com.khoa.endo.model.RepairDetail;
import com.khoa.endo.model.RepairOrder;
import com.khoa.endo.model.RepairRank;
import com.khoa.endo.repository.RepairDetailRepository;
import com.khoa.endo.repository.RepairOrderRepository;
import com.khoa.endo.service.PartService;
import com.khoa.endo.service.RepairDetailService;
import com.khoa.endo.service.RepairOrderService;
import com.khoa.endo.service.RepairRankService;

@Service
@Transactional
public class RepairDetailServiceImpl implements RepairDetailService {
	
	@Autowired
	RepairDetailRepository repairDetailRepository;
	
	@Autowired
	RepairOrderRepository repairOrderRepository;
	
	@Autowired
	PartService partService;
	
	@Autowired
	RepairOrderService repairOrderService;
	
	@Autowired
	RepairRankService repairRankService;
	
	@Override
	public List<RepairDetail> getAll() {
		return repairDetailRepository.findAllAvailable();
	}

	@Override
	public RepairDetail getById(Integer id) {
		return repairDetailRepository.findById(id).orElseThrow(() -> new RepairDetailNotFoundException("Khong tim thay repair detail"));
	}

	@Override
	public RepairDetail create(RepairDetail repairDetail) {
		return repairDetailRepository.save(repairDetail);
	}

	@Override
	public RepairDetail update(RepairDetail repairDetail) {
		return repairDetailRepository.save(repairDetail);
	}

	@Override
	public void delete(Integer id) {
		
		RepairDetail foundRepairDetail = getById(id);
		
		foundRepairDetail.setDeleted(true);
		
		repairDetailRepository.save(foundRepairDetail);
		
	}

	@Override
	public void restore(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<RepairDetail> showPartDetail(Integer repairOrderId) {
		return repairDetailRepository.showPartDetail(repairOrderId);
	}

	@Override
	public void updateRepairDetail(UpdateDetailPartDTO updateDetailPartDTO) {
		
		List<PartIdQuantityDTO> newPartList = updateDetailPartDTO.getPartIdQuantityList();
		List<RepairDetail> oldPartList = repairDetailRepository.showPartDetailIncludeDeleted(updateDetailPartDTO.getRepairOrderId());
		
		int repairOrderId = updateDetailPartDTO.getRepairOrderId();
		RepairOrder repairOrder = repairOrderService.getById(repairOrderId);
		
		RepairRank rank = repairRankService.getById(updateDetailPartDTO.getRepairRankId());
		repairOrder.setRepairRank(rank);
		repairOrderRepository.save(repairOrder);
		
		HashMap<Integer, Integer> newParts = new HashMap<>();
		
		for(int i = 0; i < newPartList.size(); i++) {
			PartIdQuantityDTO newPartInfo = newPartList.get(i);
			int partId = newPartInfo.getPartId();
			int quantity = newPartInfo.getQuantity();
			newParts.put(partId, quantity);				
		}
		List<RepairDetail> updateList = new ArrayList<>();
		
		for(int i = 0; i < oldPartList.size(); i++) {
			RepairDetail oldRepairDetail = oldPartList.get(i);
			int oldPartId = oldRepairDetail.getPart().getId();
			
			//part có sẵn nhưng đã bị xoá.
			if(newParts.containsKey(oldPartId) && oldRepairDetail.isDeleted()) {
				oldRepairDetail.setDeleted(false);
			}
			// có sẵn nhưng muốn xoá (quantity =0)
			if(!newParts.containsKey(oldPartId)) {
				oldRepairDetail.setDeleted(true);
			}
			//part có sẵn, cập nhật quantity
			if(newParts.containsKey(oldPartId) && !oldRepairDetail.isDeleted()) {
				int quantity = newParts.get(oldPartId);
				oldRepairDetail.setQuantity(quantity);
				
//				updatePartQuantityList(oldRepairRankForModel.getModel().getId(), oldRepairRankForModel.getRepairRank().getId(), quantity, oldPartId);
				newParts.remove(oldPartId);
			}		
			updateList.add(oldRepairDetail);
			// part chưa có, thêm mới
		}
		repairDetailRepository.saveAll(updateList);
		
		List<RepairDetail> createList = new ArrayList<>();
		for(Map.Entry<Integer, Integer> entry : newParts.entrySet()) {
			Part part = partService.getById(entry.getKey());
			int quantity = entry.getValue();
			RepairDetail newPart = new RepairDetail(repairOrder, part, quantity);
			createList.add(newPart);
		}
		repairDetailRepository.saveAll(createList);
		
		
	}

}
