package pl.coderslab.Dao;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pl.coderslab.Project;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class ProjectDao {

    @PersistenceContext
    EntityManager entityManager;
    public void save(Project entity) {
        entityManager.persist(entity);
    }

    public Project findById(long id) {
        return entityManager.find(Project.class, id);
    }


    public void update(Project entity) {
        entityManager.merge(entity);
    }

    public void delete(Project entity) {
        entityManager.remove(entityManager.contains(entity) ?
                entity : entityManager.merge(entity)); }
}
