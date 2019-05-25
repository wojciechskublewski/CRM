package pl.coderslab.Dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class UserDao {

    @PersistenceContext
    EntityManager entityManager;
    public void save(User entity) {
        entityManager.persist(entity);
    }

    public User findById(long id) {
        return entityManager.find(User.class, id);
    }


    public void update(User entity) {
        entityManager.merge(entity);
    }

    public void delete(User entity) {
        entityManager.remove(entityManager.contains(entity) ?
                entity : entityManager.merge(entity)); }

}
