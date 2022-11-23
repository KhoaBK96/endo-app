<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>ENDO | Home</title>
<!-- link -->
<c:import url="include/link.jsp" />
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- /.navbar -->
		<c:import url="include/nav-bar.jsp" />
		<!-- Main Sidebar Container -->
		<c:import url="include/side-bar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content">
				<div class="container-fluid">

					<div class="card">
						<div class="card-header">
							<h3>PART FOR MODEL ${modelRepair.name} AND RANK ${rank.name}</h3>
						</div>
						<div class="card-header">
							<h3 class="card-title">
								<button id="save" type="button"
									class="btn btn-block btn-primary btn-sm">Apply</button>
							</h3>
							<input type="hidden" id="modelId" value="${modelRepair.id}" /> <input
								type="hidden" id="rankId" value="${rank.id}" />

						</div>

						<!-- /.card-header -->
						<div class="card-body">
							<table id="data-table" class="table table-bordered">
								<thead>
									<tr>
										<th>Part Code</th>
										<th>Part Name</th>
										<th>Quantity</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="partDTO" items="${partQuantityList}">
										<tr>
											<td>${partDTO.part.code}</td>
											<td>${partDTO.part.name}</td>
											<td><input data-id="${partDTO.part.id}" class="quantity"
												type="number" value="${partDTO.quantity}" min="0" step="1" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<!-- /.card-body -->
						<div class="card-footer clearfix"></div>
					</div>
					<!-- /.card -->

					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
		</div>
	</div>
</body>
<c:import url="include/footer.jsp" />
</html>
<script>
	
			const saveBtn = document.getElementById('save');
			const quantityInputs = document.getElementsByClassName('quantity');

			let partsMap = new Map();
			for (let i = 0; i < quantityInputs.length; i++) {
				// tu input.value -> quantity -> neu nhu quantity === 0 thi skip
				const currInput = quantityInputs[i];
				const id = currInput.dataset.id;
				const quantity = currInput.value;
				
				if(quantity <= 0) continue;
				// build [{partId: nunber, quantity: number} ,...]
				partsMap.set(id, quantity);					
			} 
			
			const table = document.getElementById('data-table');
			
			table.onchange = function() {updatePart()}
			
			parts = []
			
			function updatePart(){
				for (let i = 0; i < quantityInputs.length; i++) {
					// tu input.value -> quantity -> neu nhu quantity === 0 thi skip
					const currInput = quantityInputs[i];
					const id = currInput.dataset.id;
					const quantity = currInput.value;
				
					// build [{partId: nunber, quantity: number} ,...]
					partsMap.set(id, quantity);	
					parts = Array.from(partsMap, ([partId, quantity]) => ({partId, quantity}));
					
					for(let i=0; i<parts.length; i++){
						if(parts[i].quantity == 0){
							parts.splice(i,1);
							i--;
						}
					}
				} 
				console.log(partsMap);
			}
		
			saveBtn.addEventListener('click', e => {
					
			const modelInput = document.getElementById('modelId');
			const modelId = modelInput.value;
			
			const rankInput = document.getElementById('rankId');
			const rankId = rankInput.value;
			console.log(parts)
			fetch('/updatePartList',{
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({
					partIdQuantityList: parts,
					modelId: modelId,
					repairRankId: rankId,
				})
			})
				//.then(res => res.json())
				.then(res => visitPage())
				.catch(error => console.log('ERROR', error))
		}
		
		
		// tao controller java -> dung fetch API + POST + body: array tren + model ID + rank ID
		// JAVA:
			// cam rank + model -> loi len nhung thang da luu truoc
			// truoc     sau
			// co luu    xoa roi
			// co luu    cap nhat quantity/khong doi
			// chua luu  co gia tri
		// tra nguoc lai fetch -> tuy ket qua thong bao thanh cong khong
		)
			// document.getEbyClassname('quantity') -> cam id _ value -> Map
	// dat event onchange o table > .quantity -> neu onchange -> cam ID + value hien tai -> cap nhat Map 
		
		function visitPage(){
			window.location = "http://localhost:8080/api/repairRankForModel/add";
	}
	
		$(function () {
	    
	    $('#data-table').DataTable({
	      "paging": true,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false,
	      "responsive": true,
	    });
	  });
</script>