
package ge.mgl.service;

import ge.mgl.dao.HGalleryDAO;
import ge.mgl.entities.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service

public class HGalleryService {

    @Autowired
    private HGalleryDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HGallery> getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HGallery> getAll() {
        return dao.getPaginatedList("", "id", false, 0, -255);
    }

    @Transactional
    public HGallery save(HGallery gallery) {
        return dao.create(gallery);
    }

    @Transactional(readOnly = true)
    public HGallery findById(Long id) {
        return dao.find(id);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

}