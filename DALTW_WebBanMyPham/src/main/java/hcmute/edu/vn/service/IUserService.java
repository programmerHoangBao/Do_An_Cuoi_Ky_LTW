package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.User;

import java.util.Optional;


public interface IUserService {
    User findByUsername(String username);
    User updateRoleVentor(User user);
    void updateUser(User user);
    User checkLogin(String email, String pass);
    Optional<User> getByUserNameOrEmail(String username);

    User findById(Integer id);
}
