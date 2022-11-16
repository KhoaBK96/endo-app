package com.khoa.endo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.dto.PartIdQuantityDTO;
import com.khoa.endo.dto.UpdatePartDTO;
import com.khoa.endo.exception.RepairRankForModelNotFoundException;
import com.khoa.endo.model.Model;
import com.khoa.endo.model.Part;
import com.khoa.endo.model.RepairRank;
import com.khoa.endo.model.RepairRankForModel;
import com.khoa.endo.repository.RepairRankForModelRepository;
import com.khoa.endo.service.ModelService;
import com.khoa.endo.service.PartService;
import com.khoa.endo.service.RepairRankForModelService;
import com.khoa.endo.service.RepairRankService;

@Service
@Transactional
public class RepairRankForModelImpl implements RepairRankForModelService {
	
	@Autowired
	RepairRankForModelRepository repairRankForModelRepository;
	
	@Autowired
	ModelService modelService;
	
	@Autowired
	RepairRankService repairRankService;
	
	@Autowired
	PartService partService;

	
	@Override
	public List<RepairRankForModel> getAll() {

		return repairRankForModelRepository.findAllAvailable();
	}

	@Override
	public RepairRankForModel getById(Integer id) {

		return repairRankForModelRepository.findById(id).orElseThrow(() -> new RepairRankForModelNotFoundException("Khong tim thay repair part cua rank nay"));
	}

	@Override
	public RepairRankForModel create(RepairRankForModel repairRankForModel) {

		return repairRankForModelRepository.save(repairRankForModel);
	}

	@Override
	public RepairRankForModel update(RepairRankForModel repairRankForModel) {
		
		return repairRankForModelRepository.save(repairRankForModel);
	}

	@Override
	public void delete(Integer id) {
		
		RepairRankForModel repairRankForModel = getById(id);
		
		repairRankForModel.setDeleted(true);
		
		repairRankForModelRepository.save(repairRankForModel);
	}

	@Override
	public void restore(Integer id) {
		RepairRankForModel repairRankForModel = getById(id);
		
		repairRankForModel.setDeleted(false);
		
		repairRankForModelRepository.save(repairRankForModel);
	}

	@Override
	public List<RepairRankForModel> showRepairRankForModel(Integer modelId, Integer repairRankId) {
		return repairRankForModelRepository.showRepairRankForModel(modelId, repairRankId);
	}

	@Override
	public void updatePartQuantityList(Integer modelId, Integer repairRankId, Integer quantity, Integer partId) {
		 repairRankForModelRepository.updatePartQuantityList(modelId, repairRankId, quantity, partId);
	}

	@Override
	public UpdatePartDTO updatePartList(UpdatePartDTO updatePartDTO) {
		
		List<PartIdQuantityDTO> newPartList = updatePartDTO.getPartIdQuantityList();
		List<RepairRankForModel> oldPartList = repairRankForModelRepository.showRepairRankForModelIncludeDeleted(updatePartDTO.getModelId(), updatePartDTO.getRepairRankId());
		
		HashMap<Integer, Integer> newParts = new HashMap<>();
		
		for(int i = 0; i < newPartList.size(); i++) {
			PartIdQuantityDTO newPartInfo = newPartList.get(i);
			int partId = newPartInfo.getPartId();
			int quantity = newPartInfo.getQuantity();
			newParts.put(partId, quantity);				
		}
		
		List<RepairRankForModel> updateList = new ArrayList<>();
				
		for(int i = 0; i < oldPartList.size(); i++) {
			RepairRankForModel oldRepairRankForModel = oldPartList.get(i);
			int oldPartId = oldRepairRankForModel.getPart().getId();
			
			//part có sẵn nhưng đã bị xoá.
			if(newParts.containsKey(oldPartId) && oldRepairRankForModel.isDeleted()) {
				oldRepairRankForModel.setDeleted(false);
			}
			// có sẵn nhưng muốn xoá (quantity =0)
			if(!newParts.containsKey(oldPartId)) {
				oldRepairRankForModel.setDeleted(true);
			}
			//part có sẵn, cập nhật quantity
			if(newParts.containsKey(oldPartId) && !oldRepairRankForModel.isDeleted()) {
				int quantity = newParts.get(oldPartId);
				oldRepairRankForModel.setQuantity(quantity);
				
//				updatePartQuantityList(oldRepairRankForModel.getModel().getId(), oldRepairRankForModel.getRepairRank().getId(), quantity, oldPartId);
				newParts.remove(oldPartId);
			}		
			updateList.add(oldRepairRankForModel);
			// part chưa có, thêm mới
		}
		repairRankForModelRepository.saveAll(updateList);
		
		Model model = modelService.getById(updatePartDTO.getModelId());
		RepairRank repairRank = repairRankService.getById(updatePartDTO.getRepairRankId());
		
		List<RepairRankForModel> createList = new ArrayList<>();
		for(Map.Entry<Integer, Integer> entry : newParts.entrySet()) {
			Part part = partService.getById(entry.getKey());
			int quantity = entry.getValue();
			RepairRankForModel  newPart = new RepairRankForModel(model, repairRank, part, quantity );
			createList.add(newPart);
		}
		repairRankForModelRepository.saveAll(createList);
		
		return updatePartDTO;
	}

	@Override
	public List<RepairRankForModel> display() {
		// TODO Auto-generated method stub
		return repairRankForModelRepository.display();
	}

}
