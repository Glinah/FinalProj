package dyspozytornia.dao;

import org.springframework.data.repository.CrudRepository;

import dyspozytornia.model.Task;

public interface TaskRepository extends CrudRepository<Task, Integer>{

	
	
}
