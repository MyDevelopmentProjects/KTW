
package ge.mgl.dao;

import ge.mgl.entities.HGallery;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository

public class HGalleryDAO extends PaginationAndFullSearchQuery<HGallery> {

    public HGalleryDAO() {
        super(HGallery.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == HGallery.class) {

        }
        return fieldList;
    }

}