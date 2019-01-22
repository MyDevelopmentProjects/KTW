
package ge.mgl.service;

import ge.mgl.dao.HMainDAO;
import ge.mgl.entities.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service

public class HMainService {

    @Autowired
    private HMainDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HMain> getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional
    public HMain save(HMain main) {
        return dao.create(main);
    }

    @Transactional(readOnly = true)
    public HMain findById(Long id) {
        return dao.find(id);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

}