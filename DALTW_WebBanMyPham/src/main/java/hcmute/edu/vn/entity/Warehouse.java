package hcmute.edu.vn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Warehouses")
@AllArgsConstructor
@NoArgsConstructor
public class Warehouse {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_warehouse;
	
	@Column(name = "name_warehouse", nullable = false, length = 100)
	private String nameWarehouse;
	
	@Column(name = "address", nullable = false, length = 250)
	private String address;
}
