package dyspozytornia.dao;

import org.springframework.data.repository.CrudRepository;

import dyspozytornia.model.Worker;

public interface WorkerRepository extends CrudRepository<Worker, Integer>{

}
