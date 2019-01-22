package ge.mgl.dao;

import ge.mgl.entities.GAbout;
import ge.mgl.entities.GNews;
import ge.mgl.entities.GUser;
import ge.mgl.entities.GUserPasswordReset;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by MJaniko on 3/8/2017.
 */
@Repository
public class GNewsDAO extends PaginationAndFullSearchQuery<GNews>{

    public GNewsDAO() {
        super(GNews.class);
    }

    public List<GNews> findByHashCode(Long categoryId){
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<GNews> cq = cb.createQuery(GNews.class);
        Root<GNews> rootEntry = cq.from(GNews.class);
        CriteriaQuery<GNews> all = cq.select(rootEntry).where(
                cb.equal(rootEntry.get("category").get("id"), categoryId)
        );
        TypedQuery<GNews> allQuery = getEntityManager().createQuery(all);
        return  allQuery.getResultList();
    }


    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == GNews.class) {
            fieldList.add("title");
            fieldList.add("description");
        }
        return fieldList;
    }

}
