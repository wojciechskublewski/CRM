package pl.coderslab.user;

import pl.coderslab.project.Project;
import pl.coderslab.task.Task;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String login;

    private String firstName;

    private String lastName;

    private String password;

    private Boolean adminTrueFalse;



    @ManyToMany(mappedBy = "users")
    private List<Project> projects = new ArrayList<>();

    @OneToMany (cascade = CascadeType.ALL, mappedBy = "user")
    private List<Task> tasks = new ArrayList<>();


    public User() {
    }

    public User(String login, String firstName, String lastName, String password, Boolean adminTrueFalse) {
        this.login = login;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.adminTrueFalse = adminTrueFalse;
    }

    public Boolean getAdminTrueFalse() {
        return adminTrueFalse;
    }

    public void setAdminTrueFalse(Boolean adminTrueFalse) {
        this.adminTrueFalse = adminTrueFalse;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", login='" + login + '\'' +
                '}';
    }
}
