package pl.coderslab.Dao;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.Priority;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class PriorityDao {

    @PersistenceContext
    EntityManager entityManager;
    public void save(Priority entity) {
        entityManager.persist(entity);
    }

    public Priority findById(long id) {
        return entityManager.find(Priority.class, id);
    }


    public void update(Priority entity) {
        entityManager.merge(entity);
    }

    public void delete(Priority entity) {
        entityManager.remove(entityManager.contains(entity) ?
                entity : entityManager.merge(entity)); }
}
