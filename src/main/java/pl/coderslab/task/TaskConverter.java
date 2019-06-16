package pl.coderslab.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class TaskConverter implements Converter<String, Task> {

    @Autowired
    TaskRepository taskRepository;

    @Override
    public Task convert(String s) {
        return taskRepository.findOne(Long.parseLong(s));
    }


}
