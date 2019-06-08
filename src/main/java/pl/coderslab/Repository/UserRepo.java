package pl.coderslab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.User;

public interface UserRepo extends JpaRepository<User, Long> {

    User findFirstByLogin(String login);

    @Modifying
    @Query(value = "delete from project_user where users_id=?1", nativeQuery = true)
    void deleteUserFromProject(String userId);
}
