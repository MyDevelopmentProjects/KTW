package ge.mgl.dao;

import ge.mgl.entities.GCategories;
import ge.mgl.entities.GShops;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by MJaniko on 3/8/2017.
 */
@Repository
public class GShopsDAO extends PaginationAndFullSearchQuery<GShops>{

    public GShopsDAO() {
        super(GShops.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        return null;
    }

}
