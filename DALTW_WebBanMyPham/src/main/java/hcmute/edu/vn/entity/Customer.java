package hcmute.edu.vn.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Customer {
	private String id;
	private String name;
	private String phoneNumber;
	private String email;
}