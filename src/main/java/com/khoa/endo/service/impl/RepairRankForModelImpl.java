package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.RepairRankForModelNotFoundException;
import com.khoa.endo.model.Model;
import com.khoa.endo.model.RepairRank;
import com.khoa.endo.model.RepairRankForModel;
import com.khoa.endo.repository.RepairRankForModelRepository;
import com.khoa.endo.service.RepairRankForModelService;

@Service
@Transactional
public class RepairRankForModelImpl implements RepairRankForModelService {
	
	@Autowired
	RepairRankForModelRepository repairRankForModelRepository;
	
	
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
		// TODO Auto-generated method stub

	}

	@Override
	public List<RepairRankForModel> showRepairRankForModel(Integer modelId, Integer repairRankId) {
		return repairRankForModelRepository.showRepairRankForModel(modelId, repairRankId);
	}

}
