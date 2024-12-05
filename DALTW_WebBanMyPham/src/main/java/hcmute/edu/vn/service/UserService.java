package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.UserInfo;
import hcmute.edu.vn.model.MailBody;
import hcmute.edu.vn.repository.UserInfoRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public record UserService(UserInfoRepository repository, PasswordEncoder passwordEncoder, EmailService emailService) {
	
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
        repository.save(userInfo);
        
        return "Thêm user thành công!";
	}
	
//    public boolean verifyOtp(String otp) {
//        // Kiểm tra OTP có hợp lệ không và kích hoạt tài khoản
//    	return false;
//    }

    private Integer otpGenerator() {
        Random random = new Random();
        return random.nextInt(100_000, 999_999);
    }
}