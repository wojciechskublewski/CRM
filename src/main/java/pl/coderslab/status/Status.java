package pl.coderslab.status;

import pl.coderslab.task.Task;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "status")
public class Status {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;


    private Boolean activity;

    private int sorting;

    @OneToMany (cascade = CascadeType.ALL, mappedBy = "status")
    private List<Task> tasks = new ArrayList<>();

    public Status() {
    }

    public Status(String name, Boolean activity, int sorting) {
        this.name = name;
        this.activity = activity;
        this.sorting = sorting;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getActivity() {
        return activity;
    }

    public void setActivity(Boolean activity) {
        this.activity = activity;
    }

    public int getSorting() {
        return sorting;
    }

    public void setSorting(int sorting) {
        this.sorting = sorting;
    }
}
