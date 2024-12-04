package hcmute.edu.vn.config;

import jakarta.servlet.http.Cookie;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                .requestMatchers("/vendor/**").hasRole("VENDOR")
                                .requestMatchers("/user/**").hasRole("USER")
                                .requestMatchers("/register", "/forgotPassword/**", "/authenticate", "/register/**",
                                        "/authenticatelogin", "/css/**", "/fonts/**", "/images/**", "/js/**").permitAll()
                        //.anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .defaultSuccessUrl("/default", true) // true ensures redirect always to /default after login
                        .failureUrl("/login?error=true")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessHandler((request, response, authentication) -> {
                            // Xoá cookie JWT khi logout
                            Cookie jwtCookie = new Cookie("JWT", null);
                            jwtCookie.setPath("/"); // Áp dụng cho toàn bộ ứng dụng
                            jwtCookie.setHttpOnly(true); // Bảo mật cho cookie
                            jwtCookie.setMaxAge(0); // Đặt thời gian sống là 0 để xoá cookie
                            response.addCookie(jwtCookie);

                            response.sendRedirect("/login?logout=true");
                        })
                        .permitAll()
                )
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                )
        ;
        return http.build();
    }
}
