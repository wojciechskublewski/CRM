package pl.coderslab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.project.Project;
import pl.coderslab.project.ProjectRepository;
import pl.coderslab.project.ProjectService;
import pl.coderslab.user.User;
import pl.coderslab.user.UserController;
import pl.coderslab.user.UserRepo;
import pl.coderslab.user.UserService;

import javax.validation.Validator;

import java.util.List;

import static java.lang.Boolean.TRUE;

@Controller
public class TestController {

    @Autowired
    UserRepo userRepo;

    @Autowired
    Validator validator;

    @Autowired
    ProjectRepository projectRepository;

    @GetMapping("/loadProject")
    public String test() {


        ProjectService projectService = new ProjectService();

        List<Project> projectList = projectService.createProjectList();

        projectRepository.save(projectList);

        //userRepo.save(user);


        return "home";
    }

}
