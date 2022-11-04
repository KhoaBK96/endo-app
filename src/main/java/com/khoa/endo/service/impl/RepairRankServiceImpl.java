package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.EntityRestoreFailedException;
import com.khoa.endo.exception.RepairRankNotFoundException;
import com.khoa.endo.model.RepairRank;
import com.khoa.endo.repository.RepairRankRepository;
import com.khoa.endo.service.RepairRankService;

@Service
@Transactional
public class RepairRankServiceImpl implements RepairRankService {
	
	@Autowired
	RepairRankRepository repairRankRepository;
	
	@Override
	public List<RepairRank> getAll() {
		return repairRankRepository.findAllAvailable();
	}

	@Override
	public RepairRank getById(Integer id) {
		return repairRankRepository.findById(id).orElseThrow(() -> new RepairRankNotFoundException("Khong tim thay rank nay"));
	}

	@Override
	public RepairRank create(RepairRank repairRank) {
		return repairRankRepository.save(repairRank);
	}

	@Override
	public RepairRank update(RepairRank repairRank) {
		return repairRankRepository.save(repairRank);
	}

	@Override
	public void delete(Integer id) {
		
		RepairRank foundRepairRank = getById(id);
		
		foundRepairRank.setDeleted(true);
		
		repairRankRepository.save(foundRepairRank);
	}

	@Override
	public void restore(Integer id) {
		
		RepairRank foundRepairRank = getById(id);
		
		if(!foundRepairRank.isDeleted())
			throw new EntityRestoreFailedException(" Khong the phuc hoi ");
		
		foundRepairRank.setDeleted(false);
		
		repairRankRepository.save(foundRepairRank);
			
	}

}
