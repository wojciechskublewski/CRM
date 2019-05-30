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
import pl.coderslab.Status;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
public class PriorityController {

    @Autowired
    PriorityRepository priorityRepository;

    @Autowired
    Validator validator;


    @GetMapping("/priority/add")
    public String addPriority(Model model) {

        Priority priority = new Priority();

        model.addAttribute("priority", priority);

        return "addPriority";
    }

    @PostMapping("/priority/add")
    public String addPriorityValidation(@ModelAttribute @Valid Priority priority, BindingResult bindingResult) {


        if (bindingResult.hasErrors()) {

            return "forward:/addPriority";
        } else {
            priorityRepository.save(priority);
            return "ok";
        }
    }

    @GetMapping("/priority/all")
    public String showAllPriority(Model model) {

        List<Priority> priorities = priorityRepository.findAll();

        model.addAttribute("priorities", priorities);

        return "allPriority";
    }

}