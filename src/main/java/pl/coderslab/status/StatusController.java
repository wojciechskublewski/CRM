package pl.coderslab.status;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
public class StatusController {

    @Autowired
    StatusRepository statusRepository;

    @Autowired
    Validator validator;

    @Autowired
    StatusDao statusDao;



    @GetMapping("/status/add")
    public String addStatus(Model model) {

        StatusService statusService = new StatusService();

        statusService.createStatusList();

        createFirstStatutes();

        Status status = new Status();

        model.addAttribute("status", status);

        return "addStatus";
    }


    @PostMapping("/status/add")
    public String addStatusValidation(@ModelAttribute @Valid Status status, BindingResult bindingResult) {


        if (bindingResult.hasErrors()) {

            return "forward:/addStatus";
        } else {
            statusRepository.save(status);
            return "ok";
        }
    }


    @GetMapping("/status/all")
    public String showAllStatu(Model model){

        StatusService statusService = new StatusService();

        statusService.createStatusList();

        createFirstStatutes();

        List<Status> statuses = statusRepository.findAll();

        model.addAttribute("statutes", statuses);

        return "allStatus";
    }


    @GetMapping("status/update/{id}")
    public String updateStatusGet(@PathVariable Long id, Model model){
        Status status = statusRepository.findOne(id);
        model.addAttribute("status", status);

        return "updateStatus";


    }

    @GetMapping("/status/delete/{id}")
    public String deleteStatusGet(@PathVariable Long id, Model model){
        Status status = statusRepository.findOne(id);
        statusRepository.delete(status);
        return "ok";
    }


    @PostMapping("status/update/{id}")
        public String updateStatusPost(@ModelAttribute Status status){

        statusRepository.save(status);

        return "ok";
    }


    public void createFirstStatutes(){

        StatusService statusService = new StatusService();
        List<Status> statusList = statusRepository.findAll();


        if(statusList==null||statusList.isEmpty()){
             statusList = statusService.createStatusList();

            for (int i =0; i<statusList.size(); i++) {
              statusRepository.save(statusList.get(i));
            }
        }
    }





}
