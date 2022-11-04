package com.khoa.endo.repository;

import org.springframework.stereotype.Repository;

import com.khoa.endo.model.RepairRank;

@Repository
public interface RepairRankRepository extends JpaSoftDeleteRepository<RepairRank, Integer> {

}
