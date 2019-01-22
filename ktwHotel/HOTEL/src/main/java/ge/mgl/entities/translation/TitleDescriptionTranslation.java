package ge.mgl.entities.translation;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Lob;

@Embeddable
public class TitleDescriptionTranslation extends Translation {

    @Column(name = "title_KA")
    private String titleKA;

    @Column(name = "title_EN")
    private String titleEN;

    @Column(name = "title_RU")
    private String titleRU;

    @Column(name = "title_CH")
    private String titleCH;

    @Lob
    @Column(name = "description_KA")
    private String descriptionKA;

    @Lob
    @Column(name = "description_EN")
    private String descriptionEN;

    @Lob
    @Column(name = "description_RU")
    private String descriptionRU;

    @Lob
    @Column(name = "description_CH")
    private String descriptionCH;

    public String getTitleKA() {
        return titleKA;
    }

    public void setTitleKA(String titleKA) {
        this.titleKA = titleKA;
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

    public String getDescriptionKA() {
        return descriptionKA;
    }

    public void setDescriptionKA(String descriptionKA) {
        this.descriptionKA = descriptionKA;
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
        if(key == null) return this.getTitleKA();
        if (key.equals("en"))
            return this.getTitleEN();
        if (key.equals("ka"))
            return this.getTitleKA();
        if (key.equals("ru"))
            return this.getTitleRU();
        if (key.equals("ch"))
            return this.getTitleCH();
        return this.getTitleCH();
    }

    @Override
    public String getDescByKey(String key) {
        if(key == null) return this.getTitleKA();
        if (key.equals("en"))
            return this.getDescriptionEN();
        if (key.equals("ka"))
            return this.getDescriptionKA();
        if (key.equals("ru"))
            return this.getDescriptionRU();
        if (key.equals("ch"))
            return this.getDescriptionCH();
        return this.getDescriptionEN();
    }
}
