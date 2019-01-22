package ge.mgl.service;

import ge.mgl.dao.HUserPasswordResetDAO;
import ge.mgl.entities.UserPasswordReset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by user on 11/26/17.
 */
@Service
public class GUserPasswordResetService {

    @Autowired
    private HUserPasswordResetDAO userPasswordResetDAO;

    @Transactional
    public UserPasswordReset findByHashCode(String hashCode){
        return userPasswordResetDAO.findByHashCode(hashCode);
    }

    @Transactional
    public UserPasswordReset create(UserPasswordReset reset){
        return userPasswordResetDAO.create(reset);
    }

    @Transactional
    public UserPasswordReset update(UserPasswordReset userPasswordReset) {
        return userPasswordResetDAO.update(userPasswordReset);
    }
}
