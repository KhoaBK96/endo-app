package com.khoa.endo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.khoa.endo.model.Part;
import com.khoa.endo.model.RepairDetail;

@Repository
public interface RepairDetailRepository extends JpaSoftDeleteRepository<RepairDetail, Integer> {
	
	@Query("SELECT rd FROM RepairDetail rd WHERE rd.repairOrder.id = :repairOrderId")
	List<RepairDetail> showPartDetail(int repairOrderId);
	
}
