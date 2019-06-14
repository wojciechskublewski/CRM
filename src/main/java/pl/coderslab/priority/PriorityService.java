package pl.coderslab.priority;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PriorityService {

    @Autowired
    PriorityRepository priorityRepository;

    public void priorityListAdd() {

        Priority priority = new Priority("low", Boolean.TRUE);
        Priority priority1 = new Priority("medium-low", Boolean.TRUE);
        Priority priority2 = new Priority("medium", Boolean.TRUE);
        Priority priority3 = new Priority("medium-high", Boolean.TRUE);
        Priority priority4 = new Priority("high", Boolean.TRUE);
        Priority priority5 = new Priority("highiest-priority", Boolean.FALSE);

        priorityRepository.save(priority);
        priorityRepository.save(priority1);
        priorityRepository.save(priority2);
        priorityRepository.save(priority3);
        priorityRepository.save(priority4);
        priorityRepository.save(priority5);

    }
}
