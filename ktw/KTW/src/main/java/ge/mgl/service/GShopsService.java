package ge.mgl.service;

import ge.mgl.dao.GShopsDAO;
import ge.mgl.entities.GShops;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by MJaniko on 3/9/2017.
 */
@Service
public class GShopsService {

    @Autowired
    private GShopsDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult getList(String searchExpression,
                                                      String sortField,
                                                      boolean isAscending,
                                                      Integer pageNumber,
                                                      int pageSize) {
        return dao.getPaginatedList(
                searchExpression,
                sortField,
                isAscending,
                pageNumber,
                pageSize);
    }

    @Transactional(readOnly = true)
    public GShops find(Long id){
        return dao.find(id);
    }

    @Transactional(readOnly = true)
    public GShops first(){
        return dao.first();
    }

    @Transactional
    public GShops save(GShops object) {
        if (object.getId() != null) {
            return dao.update(object);
        }
        return dao.create(object);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

    public List<GShops> all() {
        return dao.all();
    }
}
