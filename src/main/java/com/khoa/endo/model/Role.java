package com.khoa.endo.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Role {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Pattern(regexp = "^[\\pL 0-9]{1,25}$", message = "Tên chức vụ phải chứa từ 1-25 ký tự và không có ký tự đặc biệt")
	@NotBlank(message = "Tên chức vụ không được để trống")
	@Column(name = "role_name")
	private String name;

	@Enumerated(EnumType.STRING)
	@NotNull(message = "Phải chọn mã chức vụ")
	private RoleCode code;

	@OneToMany(mappedBy = "role")
	@JsonIgnore
	private List<Staff> staff;

	@JsonIgnore
	private boolean deleted;

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", code=" + code + ", deleted=" + deleted + "]";
	}

}
