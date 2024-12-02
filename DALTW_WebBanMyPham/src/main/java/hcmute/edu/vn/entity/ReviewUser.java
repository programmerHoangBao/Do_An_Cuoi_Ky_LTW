package hcmute.edu.vn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Review_User")
@AllArgsConstructor
@NoArgsConstructor
public class ReviewUser {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_review_user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_product", nullable = false)
	private Product product;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_user", nullable = false)
	private User user;
	
	@Column(name = "review_content", columnDefinition = "TEXT")
	private String reviewContent;
	
	@Column(name = "product_quality")
	private Integer prodcutQuanlity;
	
}
