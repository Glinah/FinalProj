package dyspozytornia.dao;

import org.springframework.data.repository.CrudRepository;

import dyspozytornia.model.Car;

public interface CarRepository extends CrudRepository<Car, Integer> {

}