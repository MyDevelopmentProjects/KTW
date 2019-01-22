package ge.mgl.service;

import ge.mgl.dao.GScrollObjectDAO;
import ge.mgl.entities.GScrollObject;
import ge.mgl.entities.GSeparatorSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by MJaniko on 3/7/2017.
 */
@Service
public class GScrollService {

    @Autowired
    private GScrollObjectDAO dao;

    @Transactional(readOnly = true)
    public List<GScrollObject> getAll(){
        return dao.all();
    }

    @Transactional(readOnly = true)
    public GScrollObject first(){
        return dao.first();
    }

    @Transactional
    public GScrollObject save(GScrollObject object) {
        if (object.getId() != null) {
            return dao.update(object);
        }
        return dao.create(object);
    }

    @Transactional
    public boolean delete(Long id) {
        return dao.delete(id);
    }
}
