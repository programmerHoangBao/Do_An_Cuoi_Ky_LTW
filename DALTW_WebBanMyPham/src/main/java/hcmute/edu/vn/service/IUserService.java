package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.User;


public interface IUserService {
    User checkLogin(String email, String pass);
}
