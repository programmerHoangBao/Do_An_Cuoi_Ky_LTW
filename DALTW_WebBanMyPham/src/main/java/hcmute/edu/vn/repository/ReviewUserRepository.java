package hcmute.edu.vn.repository;

import hcmute.edu.vn.dto.ReviewDTO;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ReviewUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewUserRepository extends JpaRepository<ReviewUser, Long> {

    @Query("SELECT new hcmute.edu.vn.dto.ReviewDTO(ru.user.fullName, ru.reviewContent, ru.productQuality, " +
            "  (SELECT ri.image FROM ReviewImage ri WHERE ri.reviewUser.id_review_user = ru.id_review_user ORDER BY ri.id_review_image ASC) ) " +
            "FROM ReviewUser ru WHERE ru.product.id_product = :productId")
    List<ReviewDTO> findReviewDetailsByProductId(@Param("productId") Integer productId);
}
