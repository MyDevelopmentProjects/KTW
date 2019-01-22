
package ge.mgl.service;

import ge.mgl.dao.HConferenceDAO;
import ge.mgl.entities.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service

public class HConferenceService {

    @Autowired
    private HConferenceDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HConference> getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional
    public HConference save(HConference conference) {
        if (conference.getId() != null) {
            return dao.update(conference);
        }
        return dao.create(conference);
    }

    @Transactional(readOnly = true)
    public HConference findById(Long id) {
        return dao.find(id);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

}