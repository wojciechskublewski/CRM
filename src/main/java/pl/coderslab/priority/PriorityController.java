package pl.coderslab.priority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

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

        addListPriority();

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

        addListPriority();
        List<Priority> priorities = priorityRepository.findAll();
        model.addAttribute("priorities", priorities);

        return "allPriority";
    }

    public void addListPriority(){

        List<Priority> priorities = priorityRepository.findAll();

        if(priorities==null||priorities.isEmpty()){
            PriorityService priorityService = new PriorityService();
            priorities=  priorityService.priorityListAdd();

            for(int i =0; i<priorities.size(); i++){
                priorityRepository.save(priorities.get(i));
            }
        }

    }

    @GetMapping("/priority/delete/{id}")
    public String deletePriority(@PathVariable Long id ){

        Priority priority = priorityRepository.findOne(id);

        priorityRepository.delete(priority);

        return "ok";
    }

    @GetMapping("/priority/update/{id}")
    public String updatePriorityGet(@PathVariable Long id, Model model){

        Priority priority = priorityRepository.findOne(id);

        model.addAttribute("priority", priority);
        return "updatePriority";
    }

    @PostMapping("/priority/update/{id}")
    public String updatePriorityPost(@ModelAttribute Priority priority, @PathVariable Long id){

        priorityRepository.save(priority);


        return "ok";
    }

}
