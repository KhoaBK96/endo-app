package com.khoa.endo.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.khoa.endo.model.RepairOrder;

@Repository
public interface RepairOrderRepository extends JpaSoftDeleteRepository<RepairOrder, Integer> {
	

}
