function openModal(type, email) {
    if (type === 'user') {
        // Lấy dữ liệu người dùng từ backend (có thể dùng AJAX hoặc qua các tham số có sẵn)
        fetch(`/admin/view-detail/edit?email=${email}`)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                document.getElementById('editFullName').innerText = data.fullName;
                document.getElementById('editEmail').innerText = data.email;
                document.getElementById('editRole').innerText = data.role;

                // Hiển thị modal
                document.getElementById('editUserModal').style.display = "block";
            })
            .catch(error => console.error('Lỗi khi tải dữ liệu người dùng:', error));
    } else if (type === 'shop') {
        // Lấy dữ liệu shop từ backend
        fetch(`/admin/shop/detail?id=${email}`)
            .then(response => response.json())
            .then(data => {
                document.getElementById('modalShopName').innerText = data.name;
                document.getElementById('modalShopAddress').innerText = data.address;

                // Hiển thị modal
                document.getElementById('shopDetailModal').style.display = "block";
            })
            .catch(error => console.error('Lỗi khi tải dữ liệu shop:', error));
    }
}

// Đóng modal
function closeModal(modalId) {
    document.getElementById(modalId).style.display = "none";
}

// Đóng modal khi nhấn ngoài vùng modal-content
window.onclick = function(event) {
    if (event.target == document.getElementById('userDetailModal')) {
        closeModal('userDetailModal');
    } else if (event.target == document.getElementById('shopDetailModal')) {
        closeModal('shopDetailModal');
    }
}
