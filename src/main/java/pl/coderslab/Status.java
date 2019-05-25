package pl.coderslab;

import javax.persistence.*;

@Entity
@Table(name = "status")
public class Status {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Boolean activity;

    private int sorting;

    public Status() {
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
