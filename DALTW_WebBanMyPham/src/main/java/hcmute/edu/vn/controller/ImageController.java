package hcmute.edu.vn.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class ImageController {

    // Hàm lấy đường dẫn thư mục lưu file
    private String getUploadDirectory() {
        String rootPath = System.getProperty("user.dir"); // Thư mục gốc của ứng dụng
        return rootPath + "/src/main/webapp/templates/images";
    }

    // Hàm lưu file ảnh
    public String saveImage(MultipartFile image) throws IOException {
        // Đường dẫn thư mục lưu ảnh
        String uploadDir = getUploadDirectory();
        // Tạo tên file duy nhất bằng timestamp
        String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();

        // Loại bỏ dấu chấm phẩy ở cuối tên file (nếu có)
        fileName = fileName.replaceAll(";$", "");

        // Đường dẫn đầy đủ của file
        Path filePath = Paths.get(uploadDir, fileName);

        // Đảm bảo thư mục tồn tại
        Files.createDirectories(filePath.getParent());

        // Lưu file vào thư mục
        Files.write(filePath, image.getBytes());

        return fileName; // Trả về đường dẫn web
    }


    // API để lưu ảnh
    @PostMapping("/upload-image")
    public ResponseEntity<?> uploadImage(@RequestParam("image") MultipartFile image) {
        try {
            // Gọi hàm lưu ảnh
            String filePath = saveImage(image);
            return ResponseEntity.ok(filePath); // Trả về đường dẫn ảnh đã lưu
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Lỗi khi lưu hình ảnh: " + e.getMessage());
        }
    }

    // API để lưu nhiều ảnh
    @PostMapping("/upload-images")
    public ResponseEntity<?> uploadImages(@RequestParam("images") MultipartFile[] images) {
        StringBuilder savedPaths = new StringBuilder();
        try {
            for (MultipartFile image : images) {
                // Gọi hàm lưu ảnh cho từng file
                String filePath = saveImage(image);
                savedPaths.append(filePath).append(";");
            }
            return ResponseEntity.ok(savedPaths.toString());
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Lỗi khi lưu hình ảnh: " + e.getMessage());
        }
    }
}
