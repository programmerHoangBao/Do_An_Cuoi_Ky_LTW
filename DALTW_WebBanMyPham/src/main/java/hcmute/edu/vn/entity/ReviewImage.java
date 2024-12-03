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
@Table(name = "Review_Image")
@AllArgsConstructor
@NoArgsConstructor
public class ReviewImage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_review_image;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_review_user", nullable = false)
	private ReviewUser reviewUser;
	
	@Column(name = "image", length = 500)
	private String image;
}
