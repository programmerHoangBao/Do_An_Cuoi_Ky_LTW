package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.config.JPAConfig;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.service.IUserService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService {

    @Override
    public User checkLogin(String email, String pass) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<User> query = enma.createQuery(
                    "SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);

            User user = query.getSingleResult();
            if (user != null && user.getPassword().equals(pass)) {
                return user;
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }
}
