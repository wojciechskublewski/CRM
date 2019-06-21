package pl.coderslab.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.priority.Priority;
import pl.coderslab.priority.PriorityRepository;
import pl.coderslab.project.Project;
import pl.coderslab.project.ProjectRepository;
import pl.coderslab.status.StatusRepository;
import pl.coderslab.status.Status;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepo;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
public class TaskController {

    @Autowired
    TaskRepository taskRepository;

    @Autowired
    Validator validator;

    @Autowired
    StatusRepository statusRepository;

    @Autowired
    PriorityRepository priorityRepository;

    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    UserRepo userRepo;



    @GetMapping("/task/add")
    public String addTask(Model model) {

        model.addAttribute("task", new Task());

        return "addTask";
    }

    @PostMapping("/task/add")
    public String addTaskValidation(@ModelAttribute @Valid Task task, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            System.out.println("cos nie dziala");
            return "addTask";
        } else {
            taskRepository.save(task);
            return "ok";
        }
    }

    @GetMapping("/task/all")
    public String allTask(Model model) {

        List<Task> tasks = taskRepository.findAll();
        model.addAttribute("tasks", tasks);
        return "allTasks";
    }


    @GetMapping("/task/update/{id}")
    public String taskEditGet(@PathVariable Long id, Model model){

        Task task = taskRepository.findOne(id);

        model.addAttribute("task",task);

        return "updateTask";
    }


    @GetMapping("/task/{id}")
    public String taskDetailsGet(@PathVariable Long id, Model model){

        Task task = taskRepository.findOne(id);

        model.addAttribute("task", task);

        return "taskDetails";
    }

    @PostMapping("/task/update/{id}")
    public String taskEditPost(@ModelAttribute @Valid Task task, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "updateTask";
        } else {
            taskRepository.save(task);
            return "ok";
        }
    }

    @GetMapping("/task/delete/{id}")
    public String taskDeleteGet(@PathVariable Long id, @ModelAttribute Task task){


        List<Project> projectList = projectRepository.findAll();


        for (int i=0; i<projectList.size(); i++){
                for(int j=0; j<projectList.get(i).getTasks().size(); j++){
                    if(projectList.get(i).getTasks().get(j).getId()==id){
                        projectList.get(i).getTasks().set(j, null);
                    }
                }
            projectRepository.save(projectList.get(i));
            }



        taskRepository.delete(id);

        return "ok";
    }

    @ModelAttribute("users")
    public List<User> getUsers(){ return userRepo.findAll();}

    @ModelAttribute("statuses")
    public List<Status> getStatuses(){
        return statusRepository.findAllByActivityTrue();
    }

    @ModelAttribute("priorities")
    public List<Priority> getPriorities(){
        return priorityRepository.findByActivityTrue();
    }


}
