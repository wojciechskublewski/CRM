package pl.coderslab.task;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.user.User;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task,Long> {


    List<Task> findByPriority(Long id);
    List<Task> findByUser(User user);


}
