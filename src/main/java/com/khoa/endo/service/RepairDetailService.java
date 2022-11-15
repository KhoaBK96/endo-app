package com.khoa.endo.service;

import java.util.List;

import com.khoa.endo.dto.UpdateDetailPartDTO;
import com.khoa.endo.model.RepairDetail;

public interface RepairDetailService extends BaseService<RepairDetail, Integer>{
	
	List<RepairDetail> showPartDetail(Integer repairOrderId);

	void updateRepairDetail(UpdateDetailPartDTO updateDetailPartDTO);
	
}
