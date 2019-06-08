package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.user.UserRepo;
import pl.coderslab.user.User;

import java.util.ArrayList;
import java.util.List;

public class UserConverter implements Converter<String, List> {

    @Autowired
    UserRepo userRepo;

    @Override
    public List<User> convert(String id){
        List<User> users = new ArrayList<>();
        User user= userRepo.findOne(Long.parseLong(id));
        users.add(user);
        return users;
    }
}
