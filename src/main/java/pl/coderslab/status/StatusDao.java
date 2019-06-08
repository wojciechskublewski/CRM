package pl.coderslab.status;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class StatusDao {
    @PersistenceContext
    EntityManager entityManager;
    public void save(Status entity) {
        entityManager.persist(entity);
    }

    public Status findById(long id) {
        return entityManager.find(Status.class, id);
    }


    public void update(Status entity) {
        entityManager.merge(entity);
    }

    public void delete(Status entity) {
        entityManager.remove(entityManager.contains(entity) ?
                entity : entityManager.merge(entity)); }

}
