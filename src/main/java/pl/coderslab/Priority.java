package pl.coderslab;


import javax.persistence.*;

@Entity
@Table(name = "priority")
public class Priority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private Boolean activity;

    public Priority() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getActivity() {
        return activity;
    }

    public void setActivity(Boolean activity) {
        this.activity = activity;
    }
}
