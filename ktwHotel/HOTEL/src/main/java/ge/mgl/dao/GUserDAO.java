package ge.mgl.dao;

import ge.mgl.entities.User;
import ge.mgl.utils.pagination.PaginationAndFullSearchQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class GUserDAO extends PaginationAndFullSearchQuery<User> {

    @Autowired
    private MessageSource messageSource;

    public GUserDAO() {
        super(User.class);
    }

    public User findByUserName(String username) {
        List<User> users;
        users = getEntityManager().createQuery("FROM User where username=:username and active = true")
                .setParameter("username", username)
                .getResultList();
        if (users != null && users.size() > 0) {
            return users.get(0);
        }
        return null;
    }

    public User findUserByUsernamePassword(String username, String password){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(11);
        String hashedPassword = passwordEncoder.encode(password);

        List<User> user = getEntityManager().createQuery("FROM GUser where username=:username and password=:password")
                .setParameter("username", username)
                .setParameter("password", hashedPassword)
                .getResultList();
        if(user != null && user.size() > 0){
            return user.get(0);
        }
        return null;
    }

    @Override
    public <T> List<String> getFieldsAvailableForFullTextSearch(Class<T> resultClass) {
        List<String> fieldList = new ArrayList<>();
        if (resultClass == User.class) {
            fieldList.add("userRoomCode");
            fieldList.add("identification");
            fieldList.add("username");
            fieldList.add("phone");
        }
        return fieldList;
    }
}
