package ge.mgl.entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.annotations.Expose;

import javax.persistence.*;

@Entity
@Table(name = "g_user")
public class GUser extends GSuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "role_id", nullable = false)
    private GRole role;

    @Column(name = "img_url")
    private String imgUrl;

    @Column(name = "username", nullable = false)
    private String username;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @Expose(serialize = false)
    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "is_active", columnDefinition = "bit(1) DEFAULT 1")
    private boolean active = true;

    public GUser() {
    }

    public GUser(GUser user) {
        this.id = user.id;
        this.role = user.role;
        this.imgUrl = user.imgUrl;
        this.username = user.username;
        this.password = user.password;
        this.active = user.active;
        this.dateCreated = user.dateCreated;
        this.dateUpdated = user.dateUpdated;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public GRole getRole() {
        return role;
    }

    public void setRole(GRole role) {
        this.role = role;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
