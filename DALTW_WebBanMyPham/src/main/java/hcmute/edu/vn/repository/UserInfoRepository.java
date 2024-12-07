package hcmute.edu.vn.repository;

import hcmute.edu.vn.entity.UserInfo;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface UserInfoRepository extends JpaRepository<UserInfo, Integer> {
	Optional<UserInfo> findByName(String username);
	Optional<UserInfo> findByEmail(String email);

	@Transactional
	@Modifying
	@Query("UPDATE UserInfo u SET u.password = ?2 WHERE u.email = ?1")
	void updatePassword(String email, String password);
}
