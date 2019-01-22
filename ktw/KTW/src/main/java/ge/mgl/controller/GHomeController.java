package ge.mgl.controller;

import ge.mgl.entities.*;
import ge.mgl.service.*;
import ge.mgl.utils.GeneralUtil;
import ge.mgl.utils.RequestResponse;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static ge.mgl.utils.constants.Constants.ControllerCodes.*;

/**
 * Created by MJaniko on 3/10/2017.
 */
@Controller
public class GHomeController {

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private GSliderService sliderService;

    @Autowired
    private GEventsService eventsService;

    @Autowired
    private GAboutService aboutService;

    @Autowired
    private GSeparatorService separatorService;

    @Autowired
    private GScrollService scrollService;

    @Autowired
    private GGalleryService galleryService;

    @Autowired
    private GCategoriesService categoriesService;

    @Autowired
    private GNewsService newsService;

    @Autowired
    private GVariableService variableService;

    @Autowired
    private GShopsService shopsService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/categoryList", method = RequestMethod.GET)
    @ResponseBody
    public PaginationAndFullSearchQueryResult getList(
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String searchExpression,
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String sortField,
            @RequestParam(required = false, defaultValue = IS_ASCENDING_DEFAULT_VALUE) boolean isAscending,
            @RequestParam(value = PAGE_NUMBER, required = false, defaultValue = PAGE_NUMBER_DEFAULT_VALUE) Integer pageNumber,
            @RequestParam(required = false, defaultValue = PAGE_SIZE_DEFAULT_VALUE) int pageSize) {
        return categoriesService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/wines", method = RequestMethod.GET)
    @ResponseBody
    public PaginationAndFullSearchQueryResult getWines(
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String searchExpression,
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String sortField,
            @RequestParam(required = false, defaultValue = IS_ASCENDING_DEFAULT_VALUE) boolean isAscending,
            @RequestParam(value = PAGE_NUMBER, required = false, defaultValue = PAGE_NUMBER_DEFAULT_VALUE) Integer pageNumber,
            @RequestParam(required = false, defaultValue = PAGE_SIZE_DEFAULT_VALUE) int pageSize) {
        return newsService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/listofcategories", method = RequestMethod.GET)
    @ResponseBody
    public PaginationAndFullSearchQueryResult listofcategories(
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String searchExpression,
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String sortField,
            @RequestParam(required = false, defaultValue = IS_ASCENDING_DEFAULT_VALUE) boolean isAscending,
            @RequestParam(value = PAGE_NUMBER, required = false, defaultValue = PAGE_NUMBER_DEFAULT_VALUE) Integer pageNumber,
            @RequestParam(required = false, defaultValue = PAGE_SIZE_DEFAULT_VALUE) int pageSize) {
        return categoriesService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/shopList", method = RequestMethod.GET)
    @ResponseBody
    public PaginationAndFullSearchQueryResult getShops(
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String searchExpression,
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String sortField,
            @RequestParam(required = false, defaultValue = IS_ASCENDING_DEFAULT_VALUE) boolean isAscending,
            @RequestParam(value = PAGE_NUMBER, required = false, defaultValue = PAGE_NUMBER_DEFAULT_VALUE) Integer pageNumber,
            @RequestParam(required = false, defaultValue = PAGE_SIZE_DEFAULT_VALUE) int pageSize) {
        return shopsService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/winePut", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse wineSave(@RequestBody GNews news) {
        newsService.save(news);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/shopPut", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse shopPut(@RequestBody GShops shop) {
        shopsService.save(shop);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/categoryPut", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse categorySave(@RequestBody GCategories categories) {
        categoriesService.save(categories);
        return GeneralUtil.RequestSuccess();
    }


    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String contact(Model model) {
        model.addAttribute("content", "contact");
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("pageTitle", "KTW.GE");
        return "index";
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("content", "main");
        model.addAttribute("pageTitle", "KTW.GE");
        model.addAttribute("topSlider", sliderService.first());
        model.addAttribute("topEvents", eventsService.first());
        model.addAttribute("separator", separatorService.first());
        model.addAttribute("about", aboutService.first());
        model.addAttribute("scroll", scrollService.getAll());
        model.addAttribute("gallery", galleryService.first());
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("news", newsService.lastX(3));
        model.addAttribute("variable", variableService.getList());
        model.addAttribute("lastnews", newsService.lastX(6));
        return "index";
    }

    @RequestMapping(value = {"/categories"}, method = RequestMethod.GET)
    public String categories(Model model) {
        model.addAttribute("content", "categories");
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("pageTitle", "KTW.GE");
        model.addAttribute("headingTitle", getLocalizedMessage("categories.heading.title"));
        model.addAttribute("headingDesc", getLocalizedMessage("categories.heading.desc"));
        return "index";
    }

    @RequestMapping(value = {"/cellars"}, method = RequestMethod.GET)
    public String cellars(Model model) {
        model.addAttribute("content", "cellars");
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("pageTitle", "KTW.GE");
        model.addAttribute("headingTitle", getLocalizedMessage("cellars.heading.title"));
        model.addAttribute("headingDesc", getLocalizedMessage("cellars.heading.desc"));
        return "index";
    }

    @RequestMapping(value = {"/company"}, method = RequestMethod.GET)
    public String company(Model model) {
        model.addAttribute("content", "company");
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("pageTitle", "KTW.GE");
        model.addAttribute("headingTitle", getLocalizedMessage("company.heading.title"));
        model.addAttribute("headingDesc", getLocalizedMessage("company.heading.desc"));
        return "index";
    }

    @RequestMapping(value = {"/factory"}, method = RequestMethod.GET)
    public String factory(Model model) {
        model.addAttribute("content", "factory");
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("pageTitle", "KTW.GE");
        model.addAttribute("headingTitle", getLocalizedMessage("factory.heading.title"));
        model.addAttribute("headingDesc", getLocalizedMessage("factory.heading.desc"));
        return "index";
    }

    @RequestMapping(value = {"/shops"}, method = RequestMethod.GET)
    public String shops(Model model) {
        model.addAttribute("content", "shops");
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("shops", shopsService.all());
        model.addAttribute("pageTitle", "Shops");
        model.addAttribute("headingTitle", getLocalizedMessage("shops.heading.title"));
        model.addAttribute("headingDesc", getLocalizedMessage("shops.heading.desc"));
        return "index";
    }

    @RequestMapping(value = {"/story"}, method = RequestMethod.GET)
    public String story(Model model) {
        model.addAttribute("content", "story");
        model.addAttribute("categories", categoriesService.all());
        model.addAttribute("pageTitle", "KTW.GE");
        model.addAttribute("headingTitle", getLocalizedMessage("story.heading.title"));
        model.addAttribute("headingDesc", getLocalizedMessage("story.heading.desc"));
        return "index";
    }

    @RequestMapping(value = {"/items/category/{id}"}, method = RequestMethod.GET)
    public String itemsByCategory(Model model, @PathVariable Long id) {
        model.addAttribute("pageTitle", "KTW.GE");

        List<GNews> news = newsService.getListByCategory(id);
        GCategories category = categoriesService.find(id);
        if (news != null) {
            model.addAttribute("content", "itemsbycategory");
            model.addAttribute("itemsbycategory", news);
            model.addAttribute("category", category);
        } else {
            model.addAttribute("content", "menu");
        }
        model.addAttribute("categories", categoriesService.all());
        return "index";
    }

    @RequestMapping(value = {"/item/{id}"}, method = RequestMethod.GET)
    public String menuDetails(Model model, @PathVariable Long id) {
        model.addAttribute("pageTitle", "KTW.GE");

        GNews news = newsService.find(id);
        if (news != null) {
            List<GNews> list = newsService.getListByCategory(news.getCategory().getId());
            if (list == null || list.size() == 0)
                list = new ArrayList<>();
            model.addAttribute("itemsbycategory", list);
            model.addAttribute("content", "wine-details");
            model.addAttribute("wine", news);
        } else {
            model.addAttribute("content", "main");
        }
        model.addAttribute("categories", categoriesService.all());
        return "index";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "get/separator", method = RequestMethod.GET)
    @ResponseBody
    public GSeparatorSection getSeparator() {
        return separatorService.first();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "put/separator", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse putSeparator(@RequestBody GSeparatorSection separatorSection) {
        separatorService.save(separatorSection);
        return GeneralUtil.RequestSuccess();
    }


    /****SCROLL****/
    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "get/scroll", method = RequestMethod.GET)
    @ResponseBody
    public List<GScrollObject> getScroll() {
        return scrollService.getAll();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "put/scroll", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse putScroll(@RequestBody GScrollObject scrollObject) {
        scrollService.save(scrollObject);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "delete/scroll", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse deleteScroll(@RequestBody Long id) {
        scrollService.delete(id);
        return GeneralUtil.RequestSuccess();
    }
    /********SCROLL********/


    /********GALLERY********/
    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "get/gallery", method = RequestMethod.GET)
    @ResponseBody
    public GGallery getGallery() {
        return galleryService.first();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "put/gallery", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse putGallery(@RequestBody GGallery gallery) {
        galleryService.save(gallery);
        return GeneralUtil.RequestSuccess();
    }

    /********GALLERY********/


    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        return "security/index";
    }


    private String getLocalizedMessage(String key) {
        return messageSource.getMessage(key, null, LocaleContextHolder.getLocale());
    }
}

