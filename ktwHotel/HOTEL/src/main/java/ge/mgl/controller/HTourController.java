
package ge.mgl.controller;

import ge.mgl.entities.HTour;
import ge.mgl.service.HTourService;
import ge.mgl.utils.GeneralUtil;
import ge.mgl.utils.RequestResponse;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import static ge.mgl.utils.constants.Constants.ControllerCodes.*;

@Controller
@RequestMapping("/tours")

public class HTourController {

    @Autowired
    private HTourService tourService;


    @Autowired
    private MessageSource messageSource;

    private String getLocalizedMessage(String key) {
        return messageSource.getMessage(key, null, LocaleContextHolder.getLocale());
    }

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public String index(Model model,
                        @RequestParam(required = false, defaultValue = STRING_EMPTY) String searchExpression,
                        @RequestParam(required = false, defaultValue = STRING_EMPTY) String sortField,
                        @RequestParam(required = false, defaultValue = IS_ASCENDING_DEFAULT_VALUE) boolean isAscending,
                        @RequestParam(value = PAGE_NUMBER, required = false, defaultValue = "0") Integer pageNumber,
                        @RequestParam(required = false, defaultValue = "-255") int pageSize) {
        model.addAttribute("content", "tours");
        model.addAttribute("pageTitle", "Tours");

        PaginationAndFullSearchQueryResult<HTour> tours =
                tourService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
        model.addAttribute("data", tours);
        return "index";
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String detail(Model model, @PathVariable() Long id) {
        HTour tour = tourService.findById(id);
        if (tour != null) {
            model.addAttribute("content", "tour-detail");
            model.addAttribute("pageTitle", tour.getTranslation().getTitleByKey(LocaleContextHolder.getLocale().getLanguage()));
            model.addAttribute("data", tour);
        } else {
            model.addAttribute("content", "notFound");
            model.addAttribute("pageTitle", "404 NOT FOUND");
        }
        return "index";
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + LIST, method = RequestMethod.GET)
    @ResponseBody
    public PaginationAndFullSearchQueryResult getList(
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String searchExpression,
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String sortField,
            @RequestParam(required = false, defaultValue = IS_ASCENDING_DEFAULT_VALUE) boolean isAscending,
            @RequestParam(value = PAGE_NUMBER, required = false, defaultValue = PAGE_NUMBER_DEFAULT_VALUE) Integer pageNumber,
            @RequestParam(required = false, defaultValue = PAGE_SIZE_DEFAULT_VALUE) int pageSize) {
        return tourService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + PUT, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse save(@RequestBody HTour tour) {
        tourService.save(tour);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + DELETE, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse delete(@RequestBody Long id) {
        boolean deleted = tourService.delete(id);
        if (deleted) {
            return GeneralUtil.RequestSuccess();
        }
        return GeneralUtil.RequestError();
    }
}