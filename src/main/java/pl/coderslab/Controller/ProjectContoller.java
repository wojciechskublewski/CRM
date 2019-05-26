package pl.coderslab.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.Dao.ProjectDao;
import pl.coderslab.Project;
import pl.coderslab.Repository.ProjectRepository;
import pl.coderslab.Repository.UserRepo;
import pl.coderslab.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProjectContoller {

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

        //Project project1 = projectRepository.findOne(Long.parseLong(strID));
        System.out.println(strID);

        return "ok";
    }



}
