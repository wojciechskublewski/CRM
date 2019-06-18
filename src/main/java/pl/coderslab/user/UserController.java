package pl.coderslab.user;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.user.UserDao;
import pl.coderslab.user.UserRepo;
import pl.coderslab.user.User;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserDao userDao;

    @Autowired
    Validator validator;

    @Autowired
    UserRepo userRepo;

    private UserService userService;

    @GetMapping("/user/add")
    public String addUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "addUser";
    }


    public Boolean loginUnique(User user){

        User user1 = userRepo.findFirstByLogin(user.getLogin());


        if (user1==null) {
            //System.out.println(user1.getLogin());

            return true;
        } else {

            //System.out.println(user1.getLogin());
            return false;
        }

    }

    @PostMapping("/user/add")
    public String addUserValidation(@ModelAttribute @Valid User user, BindingResult bindingResult) {


        if (bindingResult.hasErrors()) {
            return "addUser";
        } else if (loginUnique(user)) {

            userDao.save(user);
            return "ok";
        } else {

            return "addUser";
        }
    }

    @GetMapping("/user/all")
    public String showAllUsers(Model model){

        List<User> userList = userRepo.findAll();

        model.addAttribute("userList", userList);

        return "allUsers";

    }

    @GetMapping("/start")
    public String login(Model model){
        List<User> userList = userRepo.findAll();
        if(userList==null||userList.isEmpty()){

            User user = new User();
            user.setAdminTrueFalse(Boolean.TRUE);
            user.setLogin("ADMIN");
            user.setPassword("password");

            userRepo.save(user);
        }

        return "login";
    }

    @PostMapping("/start")
    public String loginValidation(@RequestParam String login, @RequestParam String password, Model model) {
        User user = userRepo.findFirstByLogin(login);

        model.addAttribute("isLogged", false);
        if (user == null) {
            return "login";
        }

        //System.out.println(user.getPassword());
        //System.out.println(password);

        if (password.equals(user.getPassword())) {
            model.addAttribute("userSession", user);
            model.addAttribute("isLogged", true);
            return "userList";
        }
        return "login";
    }



}
