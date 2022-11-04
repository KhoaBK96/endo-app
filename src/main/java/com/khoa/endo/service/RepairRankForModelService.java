package com.khoa.endo.service;

import java.util.List;

import com.khoa.endo.model.RepairRank;
import com.khoa.endo.model.RepairRankForModel;

public interface RepairRankForModelService extends BaseService<RepairRankForModel, Integer> {
	
	List<RepairRankForModel> showRepairRankForModel (Integer modelId, Integer repairRankId);
}
