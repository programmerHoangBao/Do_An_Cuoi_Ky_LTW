package hcmute.edu.vn.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Shops")
@AllArgsConstructor
@NoArgsConstructor
public class Shop {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_shop;
	
	@ManyToOne
	@JoinColumn(name = "id_vendor", nullable = false)
	private User vendor;
	
	@Column(name = "name_shop", length = 100, nullable = false)
	private String name;
	
	@Column(name = "sign_up_date", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date signUpDate;
	
	@Column(name = "address", length = 250, nullable = false)
	private String address;
	
	@Column(name = "introduce", columnDefinition = "TEXT") 
	private String introduce;
	
	@Column(name = "image", length = 500)
	private String image;
}

