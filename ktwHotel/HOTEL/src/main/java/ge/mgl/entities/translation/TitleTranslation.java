package ge.mgl.entities.translation;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by MJaniko on 3/6/2017.
 */
@Embeddable
public class TitleTranslation extends Translation {

    @Column(name = "title_GR")
    private String titleGR;

    @Column(name = "title_en")
    private String titleEN;

    @Column(name = "title_ru")
    private String titleRU;

    @Column(name = "title_ch")
    private String titleCH;

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

    @Override
    public String getTitleByKey(String key) {
        if(key == null) return this.getTitleCH();
        if (key.equals("en"))
            return this.getTitleEN();
        if (key.equals("gr"))
            return this.getTitleGR();
        if (key.equals("ru"))
            return this.getTitleRU();
        if (key.equals("ch"))
            return this.getTitleCH();
        return this.getTitleCH();
    }

    @Override
    public String getDescByKey(String key) {
        return "";
    }
}
