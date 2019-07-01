package pl.coderslab.project;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.user.User;

import java.util.Date;
import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long> {


    List<User> findAllById(Long id);
    List<Project> findAllByTasks(Long id);

    List<Project> findAllByActiveTrueOrderByDate();
    List<Project> findAllByActiveFalseOrderByDate();

}
