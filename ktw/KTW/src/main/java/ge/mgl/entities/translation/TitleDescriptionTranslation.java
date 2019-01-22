package ge.mgl.entities.translation;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Lob;

/**
 * Created by MJaniko on 3/7/2017.
 */
@Embeddable
public class TitleDescriptionTranslation extends Translation {

    @Column(name = "title_GR")
    private String titleGR;

    @Column(name = "title_en")
    private String titleEN;

    @Column(name = "title_ru")
    private String titleRU;

    @Column(name = "title_ch")
    private String titleCH;

    @Lob
    @Column(name = "description_gr")
    private String descriptionGR;

    @Lob
    @Column(name = "description_en")
    private String descriptionEN;

    @Lob
    @Column(name = "description_ru")
    private String descriptionRU;

    @Lob
    @Column(name = "description_ch")
    private String descriptionCH;

    public String getTitleGR() {
        return titleGR;
    }

    public void setTitleGR(String titleGR) {
        this.titleGR = titleGR;
    }

    public String getTitleEN() {
        return titleEN;
    }

    public void setTitleEN(String titleEN) {
        this.titleEN = titleEN;
    }

    public String getTitleRU() {
        return titleRU;
    }

    public void setTitleRU(String titleRU) {
        this.titleRU = titleRU;
    }

    public String getTitleCH() {
        return titleCH;
    }

    public void setTitleCH(String titleCH) {
        this.titleCH = titleCH;
    }

    public String getDescriptionGR() {
        return descriptionGR;
    }

    public void setDescriptionGR(String descriptionGR) {
        this.descriptionGR = descriptionGR;
    }

    public String getDescriptionEN() {
        return descriptionEN;
    }

    public void setDescriptionEN(String descriptionEN) {
        this.descriptionEN = descriptionEN;
    }

    public String getDescriptionRU() {
        return descriptionRU;
    }

    public void setDescriptionRU(String descriptionRU) {
        this.descriptionRU = descriptionRU;
    }

    public String getDescriptionCH() {
        return descriptionCH;
    }

    public void setDescriptionCH(String descriptionCH) {
        this.descriptionCH = descriptionCH;
    }

    @Override
    public String getTitleByKey(String key) {
        if(key == null) return this.getTitleCH();
        if (key.equals("en"))
            return this.getTitleEN();
        if (key.equals("ka"))
            return this.getTitleGR();
        if (key.equals("ru"))
            return this.getTitleRU();
        if (key.equals("ch"))
            return this.getTitleCH();
        return this.getTitleCH();
    }

    @Override
    public String getDescByKey(String key) {
        if(key == null) return this.getDescriptionEN();
        if (key.equals("en"))
            return this.getDescriptionEN();
        if (key.equals("ka"))
            return this.getDescriptionGR();
        if (key.equals("ru"))
            return this.getDescriptionRU();
        if (key.equals("ch"))
            return this.getDescriptionCH();
        return this.getDescriptionEN();
    }
}
