package pl.coderslab.project;

import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

public class ProjectService {


    @Autowired
    ProjectRepository projectRepository;


    public List<Project> createProjectList(){

        List<Project> projectList = new ArrayList<>();

        Project project = new Project("onet", Date.valueOf("2019-05-12"),TRUE);
        Project project1 = new Project("orlen", Date.valueOf("2019-01-24"),TRUE);
        Project project2 = new Project("wp", Date.valueOf("2019-06-12"),TRUE);
        Project project3 = new Project("gazeta", Date.valueOf("2019-03-05"),TRUE);
        Project project4 = new Project("wyborcza", Date.valueOf("2019-03-05"), TRUE);
        Project project5 = new Project("w sieci", Date.valueOf("2018-05-30"),FALSE);
        Project project6 = new Project("newsweek", Date.valueOf("2019-06-22"),TRUE);
        Project project7 = new Project("java", Date.valueOf("2018-10-12"),TRUE);
        Project project8 = new Project("python", Date.valueOf("2019-07-09"),FALSE);
        Project project9 = new Project("front end", Date.valueOf("2020-09-01"),FALSE);
        Project project10 = new Project("java script", Date.valueOf("2019-02-22"),TRUE);

        projectList.add(project);
        projectList.add(project1);
        projectList.add(project2);
        projectList.add(project3);
        projectList.add(project4);
        projectList.add(project5);
        projectList.add(project6);
        projectList.add(project7);
        projectList.add(project8);
        projectList.add(project9);
        projectList.add(project10);

        return projectList;

    }






}
