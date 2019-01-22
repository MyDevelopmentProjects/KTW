
package ge.mgl.entities;

import com.fasterxml.jackson.databind.ObjectMapper;
import ge.mgl.entities.translation.TitleDescriptionTranslation;

import javax.persistence.*;
import java.io.IOException;
import java.util.Objects;

@Entity
@Table(name = "H_restaurant")

public class HRestaurant extends SuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Lob
    @Column(name = "images")
    private String images;

    @Embedded
    private TitleDescriptionTranslation translation;

    @Column(name = "video_url")
    private String videoUrl;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public TitleDescriptionTranslation getTranslation() {
        return translation;
    }

    public void setTranslation(TitleDescriptionTranslation translation) {
        this.translation = translation;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
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