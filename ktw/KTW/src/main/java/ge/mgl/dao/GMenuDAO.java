package ge.mgl.dao;

import ge.mgl.entities.GAbout;
import ge.mgl.entities.GMenu;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by MJaniko on 3/8/2017.
 */
@Repository
public class GMenuDAO extends PaginationAndFullSearchQuery<GMenu>{

    public GMenuDAO() {
        super(GMenu.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        return null;
    }

}
