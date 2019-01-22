
package ge.mgl.dao;

import ge.mgl.entities.HAbout;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HAboutDAO extends PaginationAndFullSearchQuery<HAbout> {

    public HAboutDAO() {
        super(HAbout.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HAbout.class) {

        }
        return fieldList;
    }

}