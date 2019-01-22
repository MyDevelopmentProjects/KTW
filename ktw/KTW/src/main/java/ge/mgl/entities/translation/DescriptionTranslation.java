package ge.mgl.entities.translation;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Lob;

/**
 * Created by MJaniko on 3/6/2017.
 */
@Embeddable
public class DescriptionTranslation extends Translation {

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
        return "";
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
