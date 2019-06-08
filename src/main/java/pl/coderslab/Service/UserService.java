package pl.coderslab.Service;

import org.springframework.beans.factory.annotation.Autowired;
import pl.coderslab.Dao.ProjectDao;
import pl.coderslab.Repository.ProjectRepository;
import pl.coderslab.Repository.UserRepo;

import javax.validation.Validator;

public class UserService {



    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    Validator validator;

    @Autowired
    ProjectDao projectDao;

    @Autowired
    UserRepo userRepo;


}
