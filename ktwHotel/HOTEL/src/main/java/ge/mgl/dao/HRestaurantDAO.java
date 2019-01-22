
package ge.mgl.dao;

import ge.mgl.entities.HRestaurant;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HRestaurantDAO extends PaginationAndFullSearchQuery<HRestaurant> {

    public HRestaurantDAO() {
        super(HRestaurant.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HRestaurant.class) {

        }
        return fieldList;
    }

}