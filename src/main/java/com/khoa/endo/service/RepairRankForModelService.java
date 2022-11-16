package com.khoa.endo.service;

import java.util.List;

import com.khoa.endo.dto.UpdatePartDTO;
import com.khoa.endo.model.RepairRankForModel;

public interface RepairRankForModelService extends BaseService<RepairRankForModel, Integer> {
	
	List<RepairRankForModel> showRepairRankForModel (Integer modelId, Integer repairRankId);
	
	void updatePartQuantityList(Integer modelId, Integer repairRankId, Integer quantity, Integer partId);

	UpdatePartDTO updatePartList(UpdatePartDTO updatePartDTO);
	
	 List<RepairRankForModel> display();
}
