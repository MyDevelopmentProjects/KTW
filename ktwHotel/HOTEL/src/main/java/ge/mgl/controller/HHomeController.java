package ge.mgl.controller;

import ge.mgl.entities.HRoom;
import ge.mgl.service.HRestaurantService;
import ge.mgl.service.HRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class HHomeController {

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private HRestaurantService restaurantService;

    @Autowired
    private HRoomService roomService;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("content", "main");
        model.addAttribute("pageTitle", "akhasheniwineresort");
        model.addAttribute("restaurant", restaurantService.findById(1L));
        List<HRoom> rooms = roomService.getX(3);
        rooms.forEach(obj-> {
            obj.setTypeTranslated(getLocalizedMessage(obj.getTypeText()));
        });
        model.addAttribute("rooms", rooms);
        return "index";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        return "security/index";
    }


    private String getLocalizedMessage(String key) {
        return messageSource.getMessage(key, null, LocaleContextHolder.getLocale());
    }
}

