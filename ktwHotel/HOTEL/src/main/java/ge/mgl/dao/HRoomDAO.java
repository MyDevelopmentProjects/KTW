
package ge.mgl.dao;

import ge.mgl.entities.HRoom;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HRoomDAO extends PaginationAndFullSearchQuery<HRoom> {

    public HRoomDAO() {
        super(HRoom.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HRoom.class) {

        }
        return fieldList;
    }

}