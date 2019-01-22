
package ge.mgl.dao;

import ge.mgl.entities.HTour;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HTourDAO extends PaginationAndFullSearchQuery<HTour> {

    public HTourDAO() {
        super(HTour.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HTour.class) {

        }
        return fieldList;
    }

}