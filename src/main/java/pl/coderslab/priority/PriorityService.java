package pl.coderslab.priority;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class PriorityService {

    public List<Priority> priorityListAdd() {

        List<Priority> priorityList = new ArrayList<>();

        Priority priority = new Priority("low", Boolean.TRUE);
        Priority priority1 = new Priority("medium-low", Boolean.TRUE);
        Priority priority2 = new Priority("medium", Boolean.TRUE);
        Priority priority3 = new Priority("medium-high", Boolean.TRUE);
        Priority priority4 = new Priority("high", Boolean.TRUE);
        Priority priority5 = new Priority("highiest-priority", Boolean.FALSE);

        priorityList.add(priority);
        priorityList.add(priority1);
        priorityList.add(priority2);
        priorityList.add(priority3);
        priorityList.add(priority4);
        priorityList.add(priority5);

        return priorityList;
    }
}
