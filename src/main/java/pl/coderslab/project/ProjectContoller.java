package pl.coderslab.project;


import org.hibernate.Hibernate;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.task.Task;
import pl.coderslab.task.TaskRepository;
import pl.coderslab.user.UserRepo;
import pl.coderslab.user.UserService;
import pl.coderslab.user.User;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.Validator;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
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

    @Autowired
    TaskRepository taskRepository;


    @GetMapping("/project/{id}")
    public String showProject(@PathVariable Long id, Model model){

        Project project = projectRepository.findOne(id);

        model.addAttribute("project", project);

        return "detailProject";
    }



    @GetMapping("/project/all")
    public String showAllProjects(Model model) {

        List<Project> projects = projectRepository.findAll();

        model.addAttribute("projects", projects);



        return "allProjects";
    }

    @GetMapping("/project/add")
    public String addProject(Model model) {

        model.addAttribute("project", new Project());

        return "addProject";
    }

    @PostMapping("/project/add")
    public String addProjectValidation(@ModelAttribute @Valid Project project,BindingResult bindingResult) {

        project.setDate(Date.valueOf(LocalDate.now()));

        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.toString());
            return "addProject";
        } else {
            projectRepository.save(project);
            return "redirect:/project/all";
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

        return "redirect:/project/all";
    }

    @GetMapping("/project/update/{id}")
    public String updateProject(Model model, @PathVariable Long id) {
        Project project = projectRepository.findOne(id);

        model.addAttribute("project", project);

        return "updateProject";
    }
    @Transactional
    @PostMapping("project/update/{id}")
    public String updateProjectVal(@ModelAttribute Project project, Model model, BindingResult bindingResult, @PathVariable long id) {


        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.toString());
            model.addAttribute("project", project);
            return "updateProject";
        } else {
            projectRepository.save(project);
            return "redirect:/project/all";
        }


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

        return  "redirect:/project/all";
    }

    @GetMapping("/project/delete/{id}")
    public String deleteProjectGet(@PathVariable Long id){

        projectRepository.delete(id);


        return "redirect:/project/all";
    }

    @GetMapping("/")
    public String homeStrart(Model model){

        List<Project> projectList = projectRepository.findAllByActiveTrueOrderByDate();
        List<Project> projectList1 = projectRepository.findAllByActiveFalseOrderByDate();

        model.addAttribute("project", projectList);
        model.addAttribute("project1", projectList1);

        return "start";
    }

    @GetMapping("/loadproject")
    public String test() {


        ProjectService projectService = new ProjectService();

        List<Project> projectList = projectService.createProjectList();

        projectRepository.save(projectList);

        //userRepo.save(user);

        return "redirect:/";
    }

    @ModelAttribute("users")
    public List<User> getUsers() {
        return userRepo.findAll();
    }

    @ModelAttribute("tasks")
    public List<Task> getTasks(){
        return taskRepository.findAll();
    }

}




