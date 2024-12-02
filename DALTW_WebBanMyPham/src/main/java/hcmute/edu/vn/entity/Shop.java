package hcmute.edu.vn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
@Table(name = "Shops")
@AllArgsConstructor
@NoArgsConstructor
public class Shop {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_shop;
	
	@ManyToOne
	@JoinColumn(name = "id_salesman", nullable = false)
	private User salesman;
	
	@Column(name = "name_shop", length = 100, nullable = false)
	private String name;
	
	@Column(name = "information", columnDefinition = "TEXT") 
	private String information;
}

