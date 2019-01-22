package ge.mgl.service;

import ge.mgl.dao.GNewsDAO;
import ge.mgl.entities.GNews;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by MJaniko on 3/9/2017.
 */
@Service
public class GNewsService {

    @Autowired
    private GNewsDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult getList(String searchExpression,
                                                      String sortField,
                                                      boolean isAscending,
                                                      Integer pageNumber,
                                                      int pageSize) {

        PaginationAndFullSearchQueryResult<GNews> news = dao.getPaginatedList(
                searchExpression,
                sortField,
                isAscending,
                pageNumber,
                pageSize);

        return news;
    }

    @Transactional(readOnly = true)
    public List<GNews> getListByCategory(Long categoryId) {
        return dao.findByHashCode(categoryId);
    }

    @Transactional(readOnly = true)
    public GNews find(Long id){
        return dao.find(id);
    }

    @Transactional(readOnly = true)
    public GNews first(){
        return dao.first();
    }

    @Transactional(readOnly = true)
    public List<GNews> lastX(int x){
        return dao.lastX(x);
    }

    @Transactional
    public GNews save(GNews object) {
        if (object.getId() != null) {
            return dao.update(object);
        }
        return dao.create(object);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }
}
