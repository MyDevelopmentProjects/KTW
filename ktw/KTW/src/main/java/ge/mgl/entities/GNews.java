package ge.mgl.entities;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import ge.mgl.entities.translation.TitleDescriptionTranslation;

import javax.persistence.*;

/**
 * Created by MJaniko on 3/7/2017.
 */
@Entity
@Table(name = "g_news")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class GNews extends GSuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "category_id", nullable = false)
    private GCategories category;

    @Embedded
    private TitleDescriptionTranslation translation;

    @Column(name ="image")
    private String image;

    @Column(name ="detail_image")
    private String detailImage;


    @Lob
    @Column(name = "about_wine_en")
    private String aboutWineEN;

    @Lob
    @Column(name = "about_wine_gr")
    private String aboutWineGR;

    @Lob
    @Column(name = "about_wine_ru")
    private String aboutWineRU;

    @Lob
    @Column(name = "about_wine_ch")
    private String aboutWineCH;



    @Column(name = "region")
    private String region;

    @Column(name = "region_gr")
    private String regionGR;

    @Column(name = "region_ru")
    private String regionRU;

    @Column(name = "region_ch")
    private String regionCH;



    @Column(name = "grape")
    private String grape;

    @Column(name = "grape_gr")
    private String grapeGR;

    @Column(name = "grape_ru")
    private String grapeRU;

    @Column(name = "grape_ch")
    private String grapeCH;


    @Column(name = "alco")
    private String alcohol;

    @Column(name = "alcohol_gr")
    private String alcoholGR;

    @Column(name = "alcohol_ru")
    private String alcoholRU;

    @Column(name = "alcohol_ch")
    private String alcoholCH;



    @Column(name = "sugar")
    private String sugar;

    @Column(name = "sugar_gr")
    private String sugarGR;

    @Column(name = "sugar_ru")
    private String sugarRU;

    @Column(name = "sugar_ch")
    private String sugarCH;





    @Column(name = "capacity")
    private String capacity;

    @Column(name = "capacity_gr")
    private String capacityGR;

    @Column(name = "capacity_ru")
    private String capacityRU;

    @Column(name = "capacity_ch")
    private String capacityCH;




    @Column(name = "gtype")
    private String gtype;

    @Column(name = "gtype_gr")
    private String gtypeGR;

    @Column(name = "gtype_ru")
    private String gtypeRU;

    @Column(name = "gtype_ch")
    private String gtypeCH;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public GCategories getCategory() {
        return category;
    }

    public void setCategory(GCategories category) {
        this.category = category;
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

    public String getDetailImage() {
        return detailImage;
    }

    public void setDetailImage(String detailImage) {
        this.detailImage = detailImage;
    }

    public String getAboutWineEN() {
        return aboutWineEN;
    }

    public void setAboutWineEN(String aboutWineEN) {
        this.aboutWineEN = aboutWineEN;
    }

    public String getAboutWineGR() {
        return aboutWineGR;
    }

    public void setAboutWineGR(String aboutWineGR) {
        this.aboutWineGR = aboutWineGR;
    }

    public String getAboutWineRU() {
        return aboutWineRU;
    }

    public void setAboutWineRU(String aboutWineRU) {
        this.aboutWineRU = aboutWineRU;
    }

    public String getAboutWineCH() {
        return aboutWineCH;
    }

    public void setAboutWineCH(String aboutWineCH) {
        this.aboutWineCH = aboutWineCH;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getRegionGR() {
        return regionGR;
    }

    public void setRegionGR(String regionGR) {
        this.regionGR = regionGR;
    }

    public String getRegionRU() {
        return regionRU;
    }

    public void setRegionRU(String regionRU) {
        this.regionRU = regionRU;
    }

    public String getRegionCH() {
        return regionCH;
    }

    public void setRegionCH(String regionCH) {
        this.regionCH = regionCH;
    }

    public String getGrape() {
        return grape;
    }

    public void setGrape(String grape) {
        this.grape = grape;
    }

    public String getGrapeGR() {
        return grapeGR;
    }

    public void setGrapeGR(String grapeGR) {
        this.grapeGR = grapeGR;
    }

    public String getGrapeRU() {
        return grapeRU;
    }

    public void setGrapeRU(String grapeRU) {
        this.grapeRU = grapeRU;
    }

    public String getGrapeCH() {
        return grapeCH;
    }

    public void setGrapeCH(String grapeCH) {
        this.grapeCH = grapeCH;
    }

    public String getAlcohol() {
        return alcohol;
    }

    public void setAlcohol(String alcohol) {
        this.alcohol = alcohol;
    }

    public String getAlcoholGR() {
        return alcoholGR;
    }

    public void setAlcoholGR(String alcoholGR) {
        this.alcoholGR = alcoholGR;
    }

    public String getAlcoholRU() {
        return alcoholRU;
    }

    public void setAlcoholRU(String alcoholRU) {
        this.alcoholRU = alcoholRU;
    }

    public String getAlcoholCH() {
        return alcoholCH;
    }

    public void setAlcoholCH(String alcoholCH) {
        this.alcoholCH = alcoholCH;
    }

    public String getSugar() {
        return sugar;
    }

    public void setSugar(String sugar) {
        this.sugar = sugar;
    }

    public String getSugarGR() {
        return sugarGR;
    }

    public void setSugarGR(String sugarGR) {
        this.sugarGR = sugarGR;
    }

    public String getSugarRU() {
        return sugarRU;
    }

    public void setSugarRU(String sugarRU) {
        this.sugarRU = sugarRU;
    }

    public String getSugarCH() {
        return sugarCH;
    }

    public void setSugarCH(String sugarCH) {
        this.sugarCH = sugarCH;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getCapacityGR() {
        return capacityGR;
    }

    public void setCapacityGR(String capacityGR) {
        this.capacityGR = capacityGR;
    }

    public String getCapacityRU() {
        return capacityRU;
    }

    public void setCapacityRU(String capacityRU) {
        this.capacityRU = capacityRU;
    }

    public String getCapacityCH() {
        return capacityCH;
    }

    public void setCapacityCH(String capacityCH) {
        this.capacityCH = capacityCH;
    }

    public String getGtype() {
        return gtype;
    }

    public void setGtype(String gtype) {
        this.gtype = gtype;
    }

    public String getGtypeGR() {
        return gtypeGR;
    }

    public void setGtypeGR(String gtypeGR) {
        this.gtypeGR = gtypeGR;
    }

    public String getGtypeRU() {
        return gtypeRU;
    }

    public void setGtypeRU(String gtypeRU) {
        this.gtypeRU = gtypeRU;
    }

    public String getGtypeCH() {
        return gtypeCH;
    }

    public void setGtypeCH(String gtypeCH) {
        this.gtypeCH = gtypeCH;
    }

    public String getGType(String key) {
        if(key == null) return this.getGtype();
        if (key.equals("en"))
            return this.getGtype();
        if (key.equals("ka"))
            return this.getGtypeGR();
        if (key.equals("ru"))
            return this.getGtypeRU();
        if (key.equals("ch"))
            return this.getGtypeCH();
        return this.getGtype();
    }

    public String getCapacity(String key) {
        if(key == null) return this.getCapacity();
        if (key.equals("en"))
            return this.getCapacity();
        if (key.equals("ka"))
            return this.getCapacityGR();
        if (key.equals("ru"))
            return this.getCapacityRU();
        if (key.equals("ch"))
            return this.getCapacityCH();
        return this.getCapacity();
    }

    public String getSugar(String key) {
        if(key == null) return this.getSugar();
        if (key.equals("en"))
            return this.getSugar();
        if (key.equals("ka"))
            return this.getSugarGR();
        if (key.equals("ru"))
            return this.getSugarRU();
        if (key.equals("ch"))
            return this.getSugarCH();
        return this.getSugar();
    }

    public String getAlcohol(String key) {
        if(key == null) return this.getAlcohol();
        if (key.equals("en"))
            return this.getAlcohol();
        if (key.equals("ka"))
            return this.getAlcoholGR();
        if (key.equals("ru"))
            return this.getAlcoholRU();
        if (key.equals("ch"))
            return this.getAlcoholCH();
        return this.getAlcohol();
    }

    public String getGrape(String key) {
        if(key == null) return this.getGrape();
        if (key.equals("en"))
            return this.getGrape();
        if (key.equals("ka"))
            return this.getGrapeGR();
        if (key.equals("ru"))
            return this.getGrapeRU();
        if (key.equals("ch"))
            return this.getGrapeCH();
        return this.getGrape();
    }

    public String getRegion(String key) {
        if(key == null) return this.getRegion();
        if (key.equals("en"))
            return this.getRegion();
        if (key.equals("ka"))
            return this.getRegionGR();
        if (key.equals("ru"))
            return this.getRegionRU();
        if (key.equals("ch"))
            return this.getRegionCH();
        return this.getRegion();
    }

    public String getAbout(String key) {
        if(key == null) return this.getAboutWineEN();
        if (key.equals("en"))
            return this.getAboutWineEN();
        if (key.equals("ka"))
            return this.getAboutWineGR();
        if (key.equals("ru"))
            return this.getAboutWineRU();
        if (key.equals("ch"))
            return this.getAboutWineCH();
        return this.getAboutWineEN();
    }
}
