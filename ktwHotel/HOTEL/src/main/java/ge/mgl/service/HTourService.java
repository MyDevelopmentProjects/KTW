
package ge.mgl.service;

import ge.mgl.dao.HTourDAO;
import ge.mgl.entities.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service

public class HTourService {

    @Autowired
    private HTourDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HTour> getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional
    public HTour save(HTour tour) {
        if (tour.getId() != null) {
            return dao.update(tour);
        }
        return dao.create(tour);
    }

    @Transactional(readOnly = true)
    public HTour findById(Long id) {
        return dao.find(id);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

}