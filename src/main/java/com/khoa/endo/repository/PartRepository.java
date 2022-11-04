package com.khoa.endo.repository;

import org.springframework.stereotype.Repository;

import com.khoa.endo.model.Part;

@Repository
public interface PartRepository extends JpaSoftDeleteRepository<Part, Integer> {

}
