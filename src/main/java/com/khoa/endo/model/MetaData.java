package com.khoa.endo.model;

import java.sql.Time;

import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Embeddable
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MetaData {
	
	private Integer createUser;
	
	private Integer updateUser;
	
	private Time createTime;
	
	private Time updateTime;

	@Override
	public String toString() {
		return "MetaData [createUser=" + createUser + ", updateUser=" + updateUser + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + "]";
	}
	
	
}
