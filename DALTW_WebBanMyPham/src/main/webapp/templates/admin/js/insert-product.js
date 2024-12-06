function addColor() {
    var color = document.getElementById('colorList').value;
    var row = document.createElement('tr');
    row.innerHTML = `
        <td>${color}</td>
        <td><input type="file" class="imageUpload" /></td>
        <td><button onclick="deleteRow(this)">Xóa</button></td>
    `;
    document.getElementById('colorTable').appendChild(row);
}

function deleteRow(button) {
    var row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}
