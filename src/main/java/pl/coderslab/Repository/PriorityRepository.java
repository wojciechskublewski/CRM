package pl.coderslab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.Priority;

public interface PriorityRepository extends JpaRepository<Priority, Long> {

}
