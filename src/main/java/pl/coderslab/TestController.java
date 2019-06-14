package pl.coderslab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.user.User;
import pl.coderslab.user.UserController;
import pl.coderslab.user.UserRepo;
import pl.coderslab.user.UserService;

import javax.validation.Validator;

import static java.lang.Boolean.TRUE;

@Controller
public class TestController {

    @Autowired
    UserRepo userRepo;

    @Autowired
    Validator validator;

    @GetMapping("/")
    public String test() {




        //userRepo.save(user);




        return "home";
    }

}
