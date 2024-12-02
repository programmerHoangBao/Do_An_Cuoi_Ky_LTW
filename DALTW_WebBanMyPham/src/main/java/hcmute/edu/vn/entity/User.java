package hcmute.edu.vn.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Users")
@AllArgsConstructor
@NoArgsConstructor
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_user;
	
	@Column(name = "username", length = 50, nullable = false, unique = true)
	private String username;
	
	@Column(name = "password_user", length = 50, nullable = false)
	private String password;
	
	@Column(name = "email", length = 150, nullable = false)
	private String email;
	
	@Column(name = "full_name", length = 100, nullable = false)
	private String fullName;
	
	@Column(name = "sign_up_date", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date signUpDate;
	
	@Column(name = "birth_date", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date birthDate;
	
	@Column(name = "role_user", length = 20, nullable = false)
	private String role;
	
	@Column(name = "image", length = 500)
	private String image;
	
}
