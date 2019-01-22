
package ge.mgl.controller;

import ge.mgl.entities.HRoom;
import ge.mgl.service.HRoomService;
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

import java.util.List;

import static ge.mgl.utils.constants.Constants.ControllerCodes.*;

@Controller
@RequestMapping("/rooms")
public class HRoomController {

    @Autowired
    private HRoomService roomService;

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
        model.addAttribute("content", "rooms");
        model.addAttribute("pageTitle", "Rooms");

        PaginationAndFullSearchQueryResult<HRoom> rooms =
                roomService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
        rooms.getResults().forEach(obj-> {
            obj.setTypeTranslated(getLocalizedMessage(obj.getTypeText()));
        });

        model.addAttribute("data", rooms);
        return "index";
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String detail(Model model, @PathVariable() Long id) {
        HRoom room = roomService.findById(id);
        if (room != null) {
            room.setTypeTranslated(getLocalizedMessage(room.getTypeText()));
            model.addAttribute("content", "room-detail");
            model.addAttribute("pageTitle", room.getTranslation().getTitleByKey(LocaleContextHolder.getLocale().getLanguage()));
            model.addAttribute("data", room);
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
        return roomService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + PUT, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse save(@RequestBody HRoom room) {
        roomService.save(room);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + DELETE, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse delete(@RequestBody Long id) {
        boolean deleted = roomService.delete(id);
        if (deleted) {
            return GeneralUtil.RequestSuccess();
        }
        return GeneralUtil.RequestError();
    }
}