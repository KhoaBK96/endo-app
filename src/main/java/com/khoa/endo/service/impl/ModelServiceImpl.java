package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.EntityRestoreFailedException;
import com.khoa.endo.exception.ModelNotFoundException;
import com.khoa.endo.model.Model;
import com.khoa.endo.repository.ModelRepository;
import com.khoa.endo.service.ModelService;

@Service
@Transactional
public class ModelServiceImpl implements ModelService {

	@Autowired
	ModelRepository modelRepository;

	@Override
	public List<Model> getAll() {
		return modelRepository.findAllAvailable();
	}

	@Override
	public Model getById(Integer id) {
		return modelRepository.findById(id).orElseThrow(() -> new ModelNotFoundException("Không tìm thấy Model"));
	}

	@Override
	public Model create(Model model) {
		return modelRepository.save(model);
	}

	@Override
	public Model update(Model model) {

		return modelRepository.save(model);
	}

	@Override
	public void delete(Integer id) {

		Model foundModel = getById(id);
		foundModel.setDeleted(true);

		modelRepository.save(foundModel);
	}

	@Override
	public void restore(Integer id) {

		Model foundModel = getById(id);

		if (!foundModel.isDeleted())
			throw new EntityRestoreFailedException("Không thể phục hồi Model chưa bị xoá");

		foundModel.setDeleted(false);

		modelRepository.save(foundModel);
	}

}
