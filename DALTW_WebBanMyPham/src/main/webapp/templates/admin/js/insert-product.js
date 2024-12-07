function addColor() {
    const color = document.getElementById('colorList').value;
    const tableBody = document.querySelector('#colorTable tbody');
    const row = document.createElement('tr');

    row.innerHTML = `
        <td>${color}</td>
        <td><input type="file" name="imageUpload[]" accept="image/*" /></td>
        <td><button type="button" onclick="deleteRow(this)">Xóa</button></td>
    `;

    tableBody.appendChild(row);
}

function deleteRow(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}

function addProduct() {
    var table = document.getElementById("colorTable");
	var rows = table.getElementsByTagName("tr");
	var formData = new FormData();
	
	for (var i = 1; i < rows.length; i++){
		var cells = rows[i].getElementsByTagName("td");
		
		var color = cells[0].textContent;
		
		var fileInput = cells[1].querySelector('input[type="file"]');
		if (fileInput.files.length > 0){
			var file = fileInput.files[0];
			formData.append('file' +i, file);
		}
		
		formData.append('color' + i, color);
	}
	
	fetch('/admin/insert-product', {
		method: 'POST',
		body: formData
	})
	.then(response => response.json())
	.then(data => {
		console.log("Dữ liệu đã được gửi thành công", data);
	})
	.catch(error => {
		console.error("Có lỗi xãy ra: ", error);
	});
}