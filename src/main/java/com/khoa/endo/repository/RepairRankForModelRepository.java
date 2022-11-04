package com.khoa.endo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.khoa.endo.model.RepairRank;
import com.khoa.endo.model.RepairRankForModel;

@Repository
public interface RepairRankForModelRepository extends JpaSoftDeleteRepository<RepairRankForModel, Integer> {
	
	@Query("SELECT rm FROM RepairRankForModel rm WHERE rm.model.id = :modelId and rm.repairRank.id = :repairRankId")
	List<RepairRankForModel> showRepairRankForModel (Integer modelId, Integer repairRankId);
}
