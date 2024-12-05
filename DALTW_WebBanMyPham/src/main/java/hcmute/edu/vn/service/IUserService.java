package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.User;

import java.util.Optional;


public interface IUserService {
    User checkLogin(String email, String pass);
    Optional<User> getByUserNameOrEmail(String username);

}
