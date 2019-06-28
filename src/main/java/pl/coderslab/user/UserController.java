package pl.coderslab.user;

import antlr.collections.impl.LList;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.project.Project;
import pl.coderslab.project.ProjectRepository;
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

    @Autowired
    ProjectRepository projectRepository;

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
            return "forward:/allUsers";
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

    @GetMapping("/user/delete/{id}")
    public String userDeleteGet(@PathVariable Long id){

        List<Project> projectList = projectRepository.findAll();
        if(projectList==null || projectList.isEmpty()){
            userRepo.delete(id);
        } else {
            for (int i = 0; i < projectList.size(); i++) {

                List<User> userList = projectList.get(i).getUsers();

                for (int j=0; j<userList.size(); j++){
                        if(userList.get(j).getId()==id){
                            userList.remove(j);
                        }
                    }
                    projectList.get(i).setUsers(userList);
                    projectRepository.save(projectList.get(i));
                }
                userRepo.delete(id);
            }

        return "forward:/allUsers";
    }

    @GetMapping("/user/update/{id}")
    public String userUpdateGet(@PathVariable Long id, Model model){

        model.addAttribute("user", userRepo.findOne(id));

        return "updateUser";

    }

    @PostMapping("/user/update/{id}")
    public String userUpdatePost(@ModelAttribute @Valid User user, BindingResult bindingResult, @PathVariable Long id){



        if (bindingResult.hasErrors()) {
            return "updateUser";
        } else if (loginUnique(user)) {
            userRepo.save(user);
            return "forward:/allUsers";
        } else {

            List<User> userList = userRepo.findAllByLogin(user.getLogin());

            if (userList.get(0).getId() == id) {
                userRepo.save(user);
                return "forward:/allUsers";
            } else {
                return "updateUser";
            }

        }

    }



}
