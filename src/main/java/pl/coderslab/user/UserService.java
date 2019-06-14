package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.project.ProjectDao;
import pl.coderslab.project.ProjectRepository;

import javax.jws.soap.SOAPBinding;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;

@Transactional
public class UserService {

    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    Validator validator;

    @Autowired
    ProjectDao projectDao;

    @Autowired
    UserRepo userRepo;


    public List<User> deleteUserFr(List<User> users,Long id){

        List<User> userList = new ArrayList<>();

        userList = users;

        for (int i = 0; i<userList.size(); i++){

            if(userList.get(i).getId()== id){

                users.remove(users.get(i));
                return userList;
            }

        }
    return users;
    }

    public User findByLogin(String login) {
        return userRepo.findFirstByLogin(login);
    }

}
