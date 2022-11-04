package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.RepairDetailNotFoundException;
import com.khoa.endo.model.Part;
import com.khoa.endo.model.RepairDetail;
import com.khoa.endo.repository.RepairDetailRepository;
import com.khoa.endo.service.RepairDetailService;

@Service
@Transactional
public class RepairDetailServiceImpl implements RepairDetailService {
	
	@Autowired
	RepairDetailRepository repairDetailRepository;
	
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

}
