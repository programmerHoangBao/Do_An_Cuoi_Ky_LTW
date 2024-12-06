package hcmute.edu.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hcmute.edu.vn.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
