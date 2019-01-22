
package ge.mgl.service;

import ge.mgl.dao.HAboutDAO;
import ge.mgl.entities.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service

public class HAboutService {

    @Autowired
    private HAboutDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HAbout> getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional
    public HAbout save(HAbout about) {
        if (about.getId() != null) {
            return dao.update(about);
        }
        return dao.create(about);
    }

    @Transactional(readOnly = true)
    public HAbout findById(Long id) {
        return dao.find(id);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

}