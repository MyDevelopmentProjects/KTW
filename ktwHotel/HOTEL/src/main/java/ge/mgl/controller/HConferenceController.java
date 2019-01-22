
package ge.mgl.controller;

import ge.mgl.entities.HConference;
import ge.mgl.service.HConferenceService;
import ge.mgl.utils.GeneralUtil;
import ge.mgl.utils.RequestResponse;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import static ge.mgl.utils.constants.Constants.ControllerCodes.*;

@Controller
@RequestMapping("/conference")

public class HConferenceController {

    @Autowired
    private HConferenceService conferenceService;

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("content", "conference");
        model.addAttribute("pageTitle", "AkhasheniWineResort");
        model.addAttribute("data", conferenceService.findById(1L));
        return "index";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + "id", method = RequestMethod.GET)
    @ResponseBody
    public HConference byId() {
        return conferenceService.findById(1L);
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
        return conferenceService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + PUT, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse save(@RequestBody HConference conference) {
        conferenceService.save(conference);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + DELETE, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse delete(@RequestBody Long id) {
        boolean deleted = conferenceService.delete(id);
        if (deleted) {
            return GeneralUtil.RequestSuccess();
        }
        return GeneralUtil.RequestError();
    }
}