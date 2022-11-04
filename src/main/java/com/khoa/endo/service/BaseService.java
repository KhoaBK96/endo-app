package com.khoa.endo.service;

import java.util.List;

public interface BaseService<G, ID> {
	
	List<G> getAll();
		
	G getById(ID id);
	
	G create(G g);
	
	G update (G g);
	
	void delete(ID id);
	
	void restore(ID id);

}
