
package ge.mgl.entities;

import com.fasterxml.jackson.databind.ObjectMapper;
import ge.mgl.entities.translation.TitleDescriptionTranslation;

import javax.persistence.*;
import java.io.IOException;
import java.util.Objects;

@Entity
@Table(name = "H_tour")

public class HTour extends SuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "images")
    private String images;

    @Embedded
    private TitleDescriptionTranslation translation;

    @Column(name = "video_url")
    private String videoUrl;

    @Column(name = "price", nullable = false)
    private Double price;

    @Column(name = "beds", nullable = false)
    private Integer beds;

    @Column(name = "max_person", nullable = false)
    private Integer maxPerson;

    @Column(name = "type")
    private String type;

    @Transient
    private String typeTranslated;

    @Column(name = "is_active", columnDefinition = "bit(1) DEFAULT 1")
    private boolean active = true;

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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getBeds() {
        return beds;
    }

    public void setBeds(Integer beds) {
        this.beds = beds;
    }

    public Integer getMaxPerson() {
        return maxPerson;
    }

    public void setMaxPerson(Integer maxPerson) {
        this.maxPerson = maxPerson;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTypeTranslated() {
        return typeTranslated;
    }

    public void setTypeTranslated(String typeTranslated) {
        this.typeTranslated = typeTranslated;
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