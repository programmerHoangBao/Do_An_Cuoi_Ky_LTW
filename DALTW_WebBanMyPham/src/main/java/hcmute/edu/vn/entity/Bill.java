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
@Table(name = "Bills")
@AllArgsConstructor
@NoArgsConstructor
public class Bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_bill;
	
	@ManyToOne
	@JoinColumn(name = "id_user", nullable = false)
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "id_product", nullable = false)
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "id_product_color", nullable = false)
	private ProductColor productColor;
	
	@Column(name = "quantity", nullable = false)
	private Integer quantity;
	
	@Column(name = "creation_date", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date creationDate;
	
	@Column(name = "total", nullable = false)
	private double total;
}
