package pl.coderslab.priority;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;
public interface PriorityRepository extends JpaRepository<Priority, Long> {

    List<Priority> findByActivityTrue();

}
