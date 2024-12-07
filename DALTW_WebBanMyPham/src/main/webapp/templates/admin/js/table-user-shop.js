// Hàm để thay đổi trạng thái hiển thị bảng
function toggleTable(tableId) {
    const userTable = document.getElementById("userTable");
    const shopTable = document.getElementById("shopTable");

    if (tableId === 'userTable') {
        userTable.style.display = (userTable.style.display === "none" || userTable.style.display === "") ? "block" : "none";
        shopTable.style.display = "none";  // Ẩn bảng shop
    } else {
        shopTable.style.display = (shopTable.style.display === "none" || shopTable.style.display === "") ? "block" : "none";
        userTable.style.display = "none";  // Ẩn bảng người dùng
    }
}

// Hàm tìm kiếm trong bảng Người Dùng
function searchUsers() {
    const searchTerm = document.getElementById("searchUserInput").value.toLowerCase();
    const rows = document.querySelectorAll("#userTable table tbody tr");

    rows.forEach(row => {
        const userName = row.querySelector("td:nth-child(1)").textContent.toLowerCase();
        const userEmail = row.querySelector("td:nth-child(2)").textContent.toLowerCase();

        if (userName.includes(searchTerm) || userEmail.includes(searchTerm)) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}

// Hàm lọc theo vai trò người dùng
function filterByRole() {
    const selectedRole = document.getElementById("roleFilter").value.toLowerCase();
    const rows = document.querySelectorAll("#userTable table tbody tr");

    rows.forEach(row => {
        const role = row.querySelector("td:nth-child(3)").textContent.toLowerCase();

        if (selectedRole === "all" || role === selectedRole) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });

    // Hàm tìm kiếm trong bảng Shop
}

function searchShops() {
    const searchTerm = document.getElementById("searchShopInput").value.toLowerCase();
    const rows = document.querySelectorAll("#shopTable table tbody tr");

    rows.forEach(row => {
        const shopName = row.querySelector("td:nth-child(1)").textContent.toLowerCase();
        const shopAddress = row.querySelector("td:nth-child(2)").textContent.toLowerCase();

        if (shopName.includes(searchTerm) || shopAddress.includes(searchTerm)) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}