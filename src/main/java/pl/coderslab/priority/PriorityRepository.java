package pl.coderslab.priority;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.priority.Priority;

public interface PriorityRepository extends JpaRepository<Priority, Long> {

}
