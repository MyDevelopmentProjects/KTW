package ge.mgl.entities;

import com.fasterxml.jackson.databind.ObjectMapper;
import ge.mgl.entities.translation.TitleDescriptionTranslation;

import javax.persistence.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "categories")
public class GCategories extends GSuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Embedded
    private TitleDescriptionTranslation translation;

    @Column(name = "image")
    private String image;

    @Column(name = "images")
    private String images;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public TitleDescriptionTranslation getTranslation() {
        return translation;
    }

    public void setTranslation(TitleDescriptionTranslation translation) {
        this.translation = translation;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String[] getImageArray() {
        if (this.images == null || Objects.equals(this.images, "")) {
            return new String[]{};
        }
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.readValue(this.images, String[].class);
        } catch (IOException e) {
        }
        return new String[]{};
    }
}
