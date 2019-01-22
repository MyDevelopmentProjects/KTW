
package ge.mgl.service;

import ge.mgl.dao.HRestaurantDAO;
import ge.mgl.entities.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service

public class HRestaurantService {

    @Autowired
    private HRestaurantDAO dao;

    @Transactional(readOnly = true)
    public PaginationAndFullSearchQueryResult<HRestaurant> getList(String searchExpression, String sortField, boolean isAscending, Integer pageNumber, int pageSize) {
        return dao.getPaginatedList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @Transactional
    public HRestaurant save(HRestaurant restaurant) {
        if (restaurant.getId() != null) {
            return dao.update(restaurant);
        }
        return dao.create(restaurant);
    }

    @Transactional(readOnly = true)
    public HRestaurant findById(Long id) {
        return dao.find(id);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }

}