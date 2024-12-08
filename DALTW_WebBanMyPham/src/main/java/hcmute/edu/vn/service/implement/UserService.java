package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.entity.UserInfo;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.model.MailBody;
import hcmute.edu.vn.repository.UserInfoRepository;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public record UserService(UserInfoRepository repository, PasswordEncoder passwordEncoder, EmailService emailService,UserRepository userRepository,UserInfoRepository userInfoRepository) {

    //@Autowired
    //private static UserRepository userRepository;

//    @Autowired
//    private static UserInfoRepository userInfoRepository;

    public String registerUser(UserInfo userInfo) {
		userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));
		userInfo.setRoles("ROLE_USER"); // Đặt mặc định là USER, có thể thay đổi nếu cần
		
		// Send mail
        int otp = otpGenerator();
        MailBody mailBody = MailBody.builder()
                .to(userInfo.getEmail())
                .text("This is the OTP for your Forgot Password request: " + otp)
                .subject("OTP for Forgot Password request")
                .build();
        emailService.sendSimpleMessage(mailBody);
        
        userInfo.setOtp(otp);
        userInfoRepository.save(userInfo);
//        repository.updateOTP(userInfo.getEmail(), userInfo.getOtp());
        
        return "Thêm user thành công!";
	}

    private Integer otpGenerator() {
        Random random = new Random();
        return random.nextInt(100_000, 999_999);
    }

    public void transferUserInfoToUser() {
        List<UserInfo> userInfoList = userInfoRepository.findAll();  // Lấy tất cả dữ liệu từ user_info

        for (UserInfo userInfo : userInfoList) {
            User user = new User();

            // Chuyển dữ liệu từ bảng user_info sang bảng users
            user.setEmail(userInfo.getEmail());
            user.setFullName(userInfo.getName());  // Giả sử full_name là name trong user_info
            user.setPassword(userInfo.getPassword());
            user.setRole(userInfo.getRoles());
//            user.setSignUpDate(userInfo.g);  // Bạn có thể thay giá trị hiện tại hoặc giá trị cụ thể
            user.setUsername(userInfo.getEmail());  // Username là email từ user_info
//            user.setStatusUser(userInfo.isEnabled() ? 1 : 0);  // Nếu enabled = true thì status = 1, ngược lại = 0
//            user.set(userInfo.getName());  // Giả sử name trong user_info là name trong users

            // Các cột còn lại như birthDate, image, address, phone có thể cần thông tin bổ sung, bạn có thể thêm vào nếu có dữ liệu

            userRepository.save(user);  // Lưu vào bảng users
        }
    }

    public void updateUser(UserInfo user) {
        userInfoRepository.save(user);
    }
}