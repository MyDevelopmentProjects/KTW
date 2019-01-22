
package ge.mgl.service;

import ge.mgl.dao.HRoomDAO;
import ge.mgl.entities.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service

public class HRoomService {

    @Autowired
    private HRoomDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HRoom> getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional(readOnly = true)
    public List<HRoom> getX(int num) {
        return dao.lastX(num);
    }

    @Transactional
    public HRoom save(HRoom room) {
        if (room.getId() != null) {
            return dao.update(room);
        }
        return dao.create(room);
    }

    @Transactional(readOnly = true)
    public HRoom findById(Long id) {
        return dao.find(id);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

}