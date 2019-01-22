package ge.mgl.dao;

import ge.mgl.entities.UserPasswordReset;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created by user on 11/26/17.
 */
@Repository
public class HUserPasswordResetDAO extends PaginationAndFullSearchQuery<UserPasswordReset> {

    public HUserPasswordResetDAO() {
        super(UserPasswordReset.class);
    }

    public UserPasswordReset findByHashCode(String hashCode){
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<UserPasswordReset> cq = cb.createQuery(UserPasswordReset.class);
        Root<UserPasswordReset> rootEntry = cq.from(UserPasswordReset.class);
        CriteriaQuery<UserPasswordReset> all = cq.select(rootEntry).where(
            cb.equal(rootEntry.get("finished"), false),
            cb.equal(rootEntry.get("hashCode"), hashCode)
        );
        TypedQuery<UserPasswordReset> allQuery = getEntityManager()
                .createQuery(all)
                .setMaxResults(1);
        List<UserPasswordReset> resultList = allQuery.getResultList();
        return  (!resultList.isEmpty())? resultList.get(0):null;
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        return null;
    }
}
