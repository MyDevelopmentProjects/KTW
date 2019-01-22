
package ge.mgl.dao;

import ge.mgl.entities.HMain;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HMainDAO extends PaginationAndFullSearchQuery<HMain> {

    public HMainDAO() {
        super(HMain.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HMain.class) {

        }
        return fieldList;
    }

}