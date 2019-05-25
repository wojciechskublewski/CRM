package pl.coderslab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.Project;

public interface ProjectRepository extends JpaRepository<Project, Long> {

}
