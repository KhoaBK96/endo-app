package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.RepairOrderNotFoundException;
import com.khoa.endo.model.RepairOrder;
import com.khoa.endo.model.Status;
import com.khoa.endo.repository.RepairOrderRepository;
import com.khoa.endo.service.RepairOrderService;

@Service
@Transactional
public class RepairOrderServiceImpl implements RepairOrderService{
	
	@Autowired
	RepairOrderRepository repairOrderRepository;
	
	@Override
	public List<RepairOrder> getAll() {
		return repairOrderRepository.findAllAvailable();
	}

	@Override
	public RepairOrder getById(Integer id) {
		return repairOrderRepository.findById(id).orElseThrow(() -> new RepairOrderNotFoundException("Khong tim thay repair order"));
	}

	@Override
	public RepairOrder create(RepairOrder repairOrder) {
		return repairOrderRepository.save(repairOrder);
	}

	@Override
	public RepairOrder update(RepairOrder repairOrder) {
		return repairOrderRepository.save(repairOrder);
	}

	@Override
	public void delete(Integer id) {
		RepairOrder foundRepairOrder = getById(id);
		
		foundRepairOrder.setDeleted(true);
		
		repairOrderRepository.save(foundRepairOrder);
	}

	@Override
	public void restore(Integer id) {
		
	}

}
