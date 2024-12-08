document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('addColorButton').addEventListener('click', function () {
        const colorList = document.getElementById('colorList');
        const selectedColor = colorList.value;

        const colorTable = document.getElementById('colorTable').getElementsByTagName('tbody')[0];
        const existingColors = Array.from(colorTable.rows)
            .map(row => row.cells[0] ? row.cells[0].innerText : null) // Bảo vệ trước khi truy cập cells[0]
            .filter(Boolean); // Loại bỏ giá trị null hoặc undefined

        // Kiểm tra xem màu đã tồn tại trong bảng chưa
        if (existingColors.includes(selectedColor)) {
            alert('Màu này đã tồn tại trong bảng!');
            return;
        }

        // Thêm hàng mới vào bảng
        const newRow = colorTable.insertRow();

        // Cột "Màu"
        const colorCell = newRow.insertCell(0);
        colorCell.innerText = selectedColor;

        // Cột "Hình ảnh"
        const imageCell = newRow.insertCell(1);
        const imageInput = document.createElement('input');
        imageInput.type = 'file';
        imageInput.name = `images[${selectedColor}]`; // Đặt tên để gửi ảnh
        imageInput.accept = 'image/*';
        imageCell.appendChild(imageInput);

        // Cột "Xóa"
        const deleteCell = newRow.insertCell(2);
        const deleteButton = document.createElement('button');
        deleteButton.type = 'button';
        deleteButton.innerText = 'Xóa';
        deleteButton.addEventListener('click', function () {
            colorTable.deleteRow(newRow.rowIndex - 1); // Xóa hàng tương ứng
        });
        deleteCell.appendChild(deleteButton);
    });

    document.getElementById('btnAddProduct').addEventListener('click', function () {
        const form = document.querySelector('form');
        const colorTableRows = document.getElementById('colorTable').getElementsByTagName('tbody')[0].rows;

        // Thêm dữ liệu từ bảng vào form dưới dạng input ẩn
        Array.from(colorTableRows).forEach(row => {
            const colorValue = row.cells[0] ? row.cells[0].innerText : ''; // Bảo vệ trước khi truy cập cells[0]
            if (colorValue) {
                const hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = 'colors[]';
                hiddenInput.value = colorValue;
                form.appendChild(hiddenInput);
            }
        });

        // Submit form
        form.submit();
    });
});
