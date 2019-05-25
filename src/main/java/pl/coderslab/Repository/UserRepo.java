package pl.coderslab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.User;

public interface UserRepo extends JpaRepository<User, Long> {

    User findFirstByLogin(String login);
}
