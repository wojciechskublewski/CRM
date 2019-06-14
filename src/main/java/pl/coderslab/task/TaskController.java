package pl.coderslab.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.priority.Priority;
import pl.coderslab.priority.PriorityRepository;
import pl.coderslab.status.StatusRepository;
import pl.coderslab.status.Status;

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