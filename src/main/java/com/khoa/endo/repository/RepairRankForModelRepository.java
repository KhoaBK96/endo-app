package com.khoa.endo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.khoa.endo.model.RepairRankForModel;

@Repository
public interface RepairRankForModelRepository extends JpaSoftDeleteRepository<RepairRankForModel, Integer> {
	
	@Query("SELECT rm FROM RepairRankForModel rm WHERE rm.model.id = :modelId and rm.repairRank.id = :repairRankId and rm.deleted = 0")
	List<RepairRankForModel> showRepairRankForModel (Integer modelId, Integer repairRankId);
	
	@Query("SELECT rm FROM RepairRankForModel rm WHERE rm.model.id = :modelId and rm.repairRank.id = :repairRankId")
	List<RepairRankForModel> showRepairRankForModelIncludeDeleted (Integer modelId, Integer repairRankId);
	
	@Modifying
	@Query("UPDATE RepairRankForModel rm SET rm.quantity= :quantity WHERE rm.model.id= :modelId and repairRank.id = :repairRankId and rm.part.id= :partId")
	void updatePartQuantityList(Integer modelId, Integer repairRankId, Integer quantity, Integer partId);
}
