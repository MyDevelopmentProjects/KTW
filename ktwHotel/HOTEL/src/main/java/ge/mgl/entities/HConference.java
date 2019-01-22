
package ge.mgl.entities;

import ge.mgl.entities.translation.TitleDescriptionTranslation;

import javax.persistence.*;

@Entity
@Table(name = "H_conference")

public class HConference extends SuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "image")
    private String image;

    @Embedded
    private TitleDescriptionTranslation translation;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public TitleDescriptionTranslation getTranslation() {
        return translation;
    }

    public void setTranslation(TitleDescriptionTranslation translation) {
        this.translation = translation;
    }

}