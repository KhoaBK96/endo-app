<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Part</title>
</head>
<body>
	<h1>PART FOR MODEL ${modelRepair.name} AND RANK ${rank.name}</h1>
	<button id="save" onclick="visitPage();">Apply</button>
	<input type="hidden" id="modelId" value="${modelRepair.id}" />
	<input type="hidden" id="rankId" value="${rank.id}" />
	<input type="hidden" id="repairOrderId" value="${repairOrder.id}" />
	<table>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Quantity</th>
		</tr>
		<c:forEach var="partDTO" items="${partQuantityList}">
			<div class="edit-part-table">
				<tr>
					<td>${partDTO.part.code}</td>
					<td>${partDTO.part.name}</td>
					<td><input data-id="${partDTO.part.id}" class="quantity"
						type="number" value="${partDTO.quantity}" min="0" step="1" /></td>
				</tr>
			</div>
		</c:forEach>

	</table>
	<br>

</body>
</html>
<script>
	const saveBtn = document.getElementById('save');
	saveBtn.addEventListener('click', e => {
			const quantityInputs = document.getElementsByClassName('quantity');
			// vong lap qua quantittyInputs
			const parts = [];
			for (let i = 0; i < quantityInputs.length; i++) {
				// tu input.value -> quantity -> neu nhu quantity === 0 thi skip
				const currInput = quantityInputs[i];
				const id = currInput.dataset.id;
				const quantity = currInput.value;
				
				if(quantity <= 0) continue;
				// build [{partId: nunber, quantity: number} ,...]
				parts.push({ 
					partId: id, 
					quantity: quantity 
				});				
			}
			
			const modelInput = document.getElementById('modelId');
			const modelId = modelInput.value;
			
			const rankInput = document.getElementById('rankId');
			const rankId = rankInput.value;
			
			const repairOrderInput = document.getElementById('repairOrderId');
			const repairOrderId = repairOrderInput.value;
			
			fetch('/api/repairDetail/addRepairDetail',{
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({
					partIdQuantityList: parts,
					modelId: modelId,
					repairRankId: rankId,
					repairOrderId: repairOrderId
				})
			})
				//.then(res => res.json())
				.then(res => console.log(res))
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
		
	function visitPage(){
		const repairOrderInput = document.getElementById('repairOrderId');
		const repairOrderId = repairOrderInput.value;
		
		window.location="http://localhost:8080/api/repairDetail?id=" + repairOrderId;
		
		
	}
		
	
</script>