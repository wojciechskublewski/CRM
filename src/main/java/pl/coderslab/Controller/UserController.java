package pl.coderslab.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.Dao.UserDao;
import pl.coderslab.Repository.UserRepo;
import pl.coderslab.User;

import javax.validation.Valid;
import javax.validation.Validator;

@Controller
public class UserController {

    @Autowired
    UserDao userDao;

    @Autowired
    Validator validator;

    @Autowired
    UserRepo userRepo;



    //@Autowired
    //UserRepository userRepository;

    @GetMapping("/user/add")
    public String addUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "addUser";
    }


    public Boolean loginUnique(User user){

        User user1 = userRepo.findFirstByLogin(user.getLogin());

        if (user1.equals(null)) {
            return false;
        } else {
            return true;
        }

    }

    @PostMapping("/user/add")
    public String addUserValidation(@ModelAttribute @Valid User user, BindingResult bindingResult){


        if(bindingResult.hasErrors()){

            if (loginUnique(user)){

                userDao.save(user);
                return "ok";
            } else {
                return "addUser";
            }
        } else {

            userDao.save(user);

            return "ok";
        }
    }

}
