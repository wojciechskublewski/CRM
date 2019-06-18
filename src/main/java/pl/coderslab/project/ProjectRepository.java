package pl.coderslab.project;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.user.User;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long> {


    List<User> findAllById(Long id);


}
