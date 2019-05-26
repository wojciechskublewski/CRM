package pl.coderslab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.Task;

public interface TaskRepository extends JpaRepository<Task,Long> {
}
