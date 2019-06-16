package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class UserConverter implements Converter<String, User> {

    @Autowired
    UserRepo userRepo;

    @Override
    public User convert(String s) {

        return userRepo.findOne(Long.parseLong(s));
    }
}
