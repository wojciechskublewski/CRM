package pl.coderslab.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.Priority;
import pl.coderslab.Repository.PriorityRepository;
import pl.coderslab.Repository.ProjectRepository;
import pl.coderslab.Repository.StatusRepository;
import pl.coderslab.Repository.TaskRepository;
import pl.coderslab.Status;
import pl.coderslab.Task;

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

    @GetMapping("/task/add")
    public String addTask(Model model) {

        Task task = new Task();

        List<Status> statuses = statusRepository.findAll();
        List<Priority> priorities = priorityRepository.findAll();

        model.addAttribute("task", task);
        model.addAttribute("statuses", statuses);
        model.addAttribute("priorities", priorities);
        return "addTask";
    }

    @PostMapping("/task/add")
    public String addTaskValidation(@ModelAttribute @Valid Task task, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {

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



}
