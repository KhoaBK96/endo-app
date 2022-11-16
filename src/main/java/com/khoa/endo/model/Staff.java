package com.khoa.endo.model;

import java.util.Collection;
import java.util.Collections;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

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
public class Staff implements UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Pattern(regexp = "^[a-zA-Z0-9_]{4,25}$", message = "Tên người dùng phải chứa từ 4-25 ký tự và không có ký tự đặc biệt")
	@javax.validation.constraints.NotBlank(message = "Tên người dùng không được trống")
	private String username;

	@JsonIgnore
	private String password;

	@Pattern(regexp = "^[\\pL ]{4,50}$", message = "Tên người dùng phải chứa từ 4-50 ký tự và không có ký tự đặc biệt")
	@NotBlank(message = "Họ và tên nhân viên không được trống")
	private String fullname;

	@Pattern(regexp = "^0[\\d]{9,10}$", message = "Số điện thoại phải chứa 10-11 số và bắt đầu bằng số 0")
	@NotBlank(message = "Số điện thoại không được trống")
	private String phoneNumber;

	@ManyToOne
	@NotNull(message = "Chức vụ không được để trống")
	private Role role;

	@JsonIgnore
	private boolean deleted;

	@JsonIgnore
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		RoleCode code = role.getCode();
		String codeName = code.name();
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(codeName);
		return Collections.singletonList(authority);
	}

	@JsonIgnore
	@Override
	public String getUsername() {
		return username;
	}

	@JsonIgnore
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@JsonIgnore
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@JsonIgnore
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@JsonIgnore
	@Override
	public boolean isEnabled() {
		return !deleted;
	}

	@Override
	public String toString() {
		return "Staff [id=" + id + ", username=" + username + ", password=" + password + ", fullname=" + fullname
				+ ", phoneNumber=" + phoneNumber + ", deleted=" + deleted + "]";
	}

}
