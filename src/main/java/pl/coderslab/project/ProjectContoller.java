package pl.coderslab.project;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.user.UserRepo;
import pl.coderslab.user.UserService;
import pl.coderslab.user.User;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
public class ProjectContoller {

    private UserService userService;


    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    Validator validator;

    @Autowired
    ProjectDao projectDao;

    @Autowired
    UserRepo userRepo;

    @GetMapping("/project/allProjects")
    public String showAllProjects(Model model) {

        List<Project> projects = projectRepository.findAll();

        model.addAttribute("projects", projects);

        return "allProjects";
    }

    @GetMapping("/project/add")
    public String addProject(Model model) {

        List<User> users = userRepo.findAll();

        Project project = new Project();

        model.addAttribute("users", users);

        model.addAttribute("project", project);

        return "addProject";
    }

    @PostMapping("/project/add")
    public String addProjectValidation(@ModelAttribute @Valid Project project,BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.toString());
            return "addProject";
        } else {
            projectRepository.save(project);
            return "ok";
        }
    }

    @GetMapping("project/add/users")
    public String addUsersProject(Model model){

        List<Project> projectList = projectRepository.findAll();
        List<User> users = userRepo.findAll();

        model.addAttribute("projectList", projectList);
        model.addAttribute("users",users);

        return "addUserProject";
    }

    @PostMapping("/project/add/users")
    public String addUserProjectValidation(@ModelAttribute @Valid Project project, BindingResult bindingResult, HttpServletRequest request) {

        String strID = request.getParameter("project.id");
        String strIDU = request.getParameter("user.id");

        Project project1 = projectRepository.findOne(Long.parseLong(strID));

        List<User> users = project1.getUsers();

        users.add(userRepo.findOne(Long.parseLong(strIDU)));

        project1.setUsers(users);

        projectRepository.save(project1);

        System.out.println(project1.getName());
        System.out.println(strID);
        System.out.println(strIDU);

        return "ok";
    }

    @GetMapping("/project/update/{id}")
    public String updateProject(Model model, @PathVariable String id) {
        Project project = new Project();
        project = projectRepository.findOne(Long.parseLong(id));

        model.addAttribute("project", project);

        return "updateProject";
    }

    @PostMapping("project/update/{id}")
    public String updateProjectVal(@ModelAttribute Project project, BindingResult bindingResult, @PathVariable String id) {

        Project project1 = projectRepository.findOne(Long.parseLong(id));

        project1.setName(project.getName());

        projectDao.update(project1);

        return  "ok";
    }

    @GetMapping("project/delete/user")
    public String updateDeleteUserFromProject(Model model){

        List<Project> projects = projectRepository.findAll();

        model.addAttribute("projects",projects);

        return "deleteProjectUser";
    }

    @GetMapping("project/delete/user/{id}")
    public String updateDeleteUserFromProjectGet(Model model, @PathVariable String id){

        Project project = projectRepository.findOne(Long.parseLong(id));

        List<User> users = project.getUsers();

        model.addAttribute("project", project);
        model.addAttribute("users", users);

        System.out.println(users.toString());

        return "projectRemoveUser";
    }

    @Transactional
    @GetMapping("project/delete/user/{project}/{user}")
    public String updateDeleteUserFromProjectVal(HttpServletRequest request, @PathVariable String project, @PathVariable String user) {

       UserService userService = new UserService();

        Project project1 = projectRepository.findOne(Long.parseLong(project));

        List<User> users = project1.getUsers();

        System.out.println(users.toString());

        System.out.println(user);

        userService.deleteUserFr(users,Long.parseLong(user));



        project1.setUsers(users);

        System.out.println(users.toString());

        projectRepository.save(project1);


        //userRepo.deleteUserFromProject(user);

        return  "ok";
    }

}



