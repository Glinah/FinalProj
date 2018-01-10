package dyspozytornia.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import dyspozytornia.dao.WorkerRepository;
import dyspozytornia.model.Worker;

@Service
@Transactional
public class WorkerService {
	
	
	private final WorkerRepository workerRepository;

	public WorkerService(WorkerRepository workerRepository) {
		this.workerRepository = workerRepository;
	}
	
	public List<Worker> findAll(){
		List<Worker> workers = new ArrayList<>();
		for(Worker worker : workerRepository.findAll()){
			workers.add(worker);
		}
		return workers;
	}
	
	public Worker findWorker(int id){
		return workerRepository.findOne(id);
	}
	
	public void save(Worker worker){
		workerRepository.save(worker);
	}
	
	public void delete(int id){
		workerRepository.delete(id);
	}

}
