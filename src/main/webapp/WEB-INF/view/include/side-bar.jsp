<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="${pageContext.servletContext.contextPath}/"
		class="brand-link"> <img src="/img/AdminLTELogo.png"
		alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
		style="opacity: 0.8" /> <span class="brand-text font-weight-light">ENDO</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="/img/user2-160x160.jpg" class="img-circle elevation-2"
					alt="User Image" />
			</div>
			<div class="info">
				<a href="#" class="d-block">${pageContext["request"].userPrincipal.principal.username}
				</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
         with font-awesome or any other icon font library -->
				<li class="nav-item">
				<li class="nav-item"><a
					href="${pageContext.servletContext.contextPath}/role"
					class="nav-link"> <i class="far fa-circle nav-icon"></i>
						<p>Role</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.servletContext.contextPath}/staff"
					class="nav-link"> <i class="far fa-circle nav-icon"></i>
						<p>Staff</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.servletContext.contextPath}/model"
					class="nav-link"> <i class="far fa-circle nav-icon"></i>
						<p>Model</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.servletContext.contextPath}/repairRank"
					class="nav-link"> <i class="far fa-circle nav-icon"></i>
						<p>Rank</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.servletContext.contextPath}/part"
					class="nav-link"> <i class="far fa-circle nav-icon"></i>
						<p>Part</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.servletContext.contextPath}/repairRankForModel/add"
					class="nav-link"> <i class="far fa-circle nav-icon"></i>
						<p>Repair Package</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.servletContext.contextPath}/"
					class="nav-link"> <i class="far fa-circle nav-icon"></i>
						<p>Repair List</p>
				</a></li>

				</li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>