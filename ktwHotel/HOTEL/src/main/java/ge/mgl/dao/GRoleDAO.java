package ge.mgl.dao;

import ge.mgl.entities.Role;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by MJaniko on 3/9/2017.
 */
@Repository
public class GRoleDAO extends PaginationAndFullSearchQuery<Role>{

    public GRoleDAO() {
        super(Role.class);
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        return null;
    }
}
