package pl.coderslab.Dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.Status;
import pl.coderslab.Task;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Repository
@Transactional
public class TaskDao {

    @PersistenceContext
    EntityManager entityManager;
    public void save(Task entity) {
        entityManager.persist(entity);
    }

    public Task findById(long id) {
        return entityManager.find(Task.class, id);
    }


    public void update(Task entity) {
        entityManager.merge(entity);
    }

    public void delete(Task  entity) {
        entityManager.remove(entityManager.contains(entity) ?
                entity : entityManager.merge(entity)); }

}
