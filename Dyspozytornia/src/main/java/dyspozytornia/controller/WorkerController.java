package dyspozytornia.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dyspozytornia.model.Car;
import dyspozytornia.model.Worker;
import dyspozytornia.service.CarService;
import dyspozytornia.service.WorkerService;

@Controller
public class WorkerController {
	
	@Autowired
	private WorkerService workerService;

	
	@GetMapping("/all-workers")
	public String allWorkers(HttpServletRequest request){
		request.setAttribute("workers", workerService.findAll());
		request.setAttribute("mode", "MODE_WORKERS2");
		return "index";
	}
	
	@GetMapping("/new-worker")
	public String newWorker(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW2");
		return "index";
	}
	
	@PostMapping("/save-worker")
	public String saveWorker(@ModelAttribute Worker worker, BindingResult bindingResult, HttpServletRequest request){
		worker.setDateCreated(new Date());
		workerService.save(worker);
		request.setAttribute("workers", workerService.findAll());
		request.setAttribute("mode", "MODE_WORKERS2");
		return "index";
	}
	
	@GetMapping("/update-worker")
	public String updateWorker(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("worker", workerService.findWorker(id));
		request.setAttribute("mode", "MODE_UPDATE2");
		return "index";
	}
	
	@GetMapping("/delete-worker")
	public String deleteWorker(@RequestParam int id, HttpServletRequest request){
		workerService.delete(id);
		request.setAttribute("workers", workerService.findAll());
		request.setAttribute("mode", "MODE_WORKERS2");
		return "index";
	}

}
