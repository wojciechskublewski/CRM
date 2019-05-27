package pl.coderslab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.Project;
import pl.coderslab.User;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long> {


    List<User> findAllById(Long id);
}
