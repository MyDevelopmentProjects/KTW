package ge.mgl.service;

import ge.mgl.dao.GCategoriesDAO;
import ge.mgl.entities.GCategories;
import ge.mgl.entities.GSponsors;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by MJaniko on 3/9/2017.
 */
@Service
public class GCategoriesService {

    @Autowired
    private GCategoriesDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression,
                sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional(readOnly = true)
    public GCategories find(Long id){
        return dao.find(id);
    }

    @Transactional(readOnly = true)
    public GCategories first(){
        return dao.first();
    }

    @Transactional
    public GCategories save(GCategories object) {
        if (object.getId() != null) {
            return dao.update(object);
        }
        return dao.create(object);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

    public List<GCategories> all() {
        return dao.all();
    }
}
