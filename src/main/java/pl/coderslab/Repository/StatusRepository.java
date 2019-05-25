package pl.coderslab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.Status;

public interface StatusRepository extends JpaRepository<Status, Long> {

}
