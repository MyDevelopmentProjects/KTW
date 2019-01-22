
package ge.mgl.dao;

import ge.mgl.entities.HContact;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HContactDAO extends PaginationAndFullSearchQuery<HContact> {

    public HContactDAO() {
        super(HContact.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HContact.class) {

        }
        return fieldList;
    }

}