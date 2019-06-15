package pl.coderslab.status;

import java.util.ArrayList;
import java.util.List;

public class StatusService {

    public List<Status> createStatusList(){

        List<Status> statusList = new ArrayList<>();

        Status status = new Status("not started",Boolean.TRUE,1);
        Status status1 = new Status("work in progress",Boolean.TRUE,2);
        Status status2 = new Status("25 proc completed",Boolean.TRUE,3);
        Status status3 = new Status("50 proc completed",Boolean.TRUE,4);
        Status status4 = new Status("75 proc completed",Boolean.TRUE,5);
        Status status5 = new Status("completed",Boolean.TRUE,6);
        Status status6 = new Status("testing",Boolean.TRUE,7);
        Status status7 = new Status("n/a",Boolean.FALSE,0);

        statusList.add(status);
        statusList.add(status1);
        statusList.add(status2);
        statusList.add(status3);
        statusList.add(status4);
        statusList.add(status5);
        statusList.add(status6);
        statusList.add(status7);

        return statusList;

    }

}
