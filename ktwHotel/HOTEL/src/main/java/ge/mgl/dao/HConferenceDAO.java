
package ge.mgl.dao;

import ge.mgl.entities.HConference;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HConferenceDAO extends PaginationAndFullSearchQuery<HConference> {

    public HConferenceDAO() {
        super(HConference.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HConference.class) {

        }
        return fieldList;
    }

}