package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.EntityRestoreFailedException;
import com.khoa.endo.exception.PartNotFoundException;
import com.khoa.endo.model.Part;
import com.khoa.endo.repository.PartRepository;
import com.khoa.endo.service.PartService;

@Service
@Transactional
public class PartServiceImpl implements PartService {
	
	@Autowired
	PartRepository partRepository;
	
	@Override
	public List<Part> getAll() {
		
		return partRepository.findAllAvailable();
	}

	@Override
	public Part getById(Integer id) {
		return partRepository.findById(id).orElseThrow(() -> new PartNotFoundException("Không tìm thấy part này")) ;
	}

	@Override
	public Part create(Part part) {
		return partRepository.save(part);
	}

	@Override
	public Part update(Part part) {
		
		return partRepository.save(part);
	}

	@Override
	public void delete(Integer id) {
		
		Part foundPart = getById(id);
		foundPart.setDeleted(true);
		
		partRepository.save(foundPart);
	}

	@Override
	public void restore(Integer id) {
		Part foundPart = getById(id);
		if(!foundPart.isDeleted())
			throw new EntityRestoreFailedException("Part này chưa bị xoá");
		
		foundPart.setDeleted(false);
		
		partRepository.save(foundPart);

	}

}
