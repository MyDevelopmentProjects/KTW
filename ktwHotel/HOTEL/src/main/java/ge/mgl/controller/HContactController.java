package ge.mgl.controller;

import ge.mgl.entities.HContact;
import ge.mgl.pojo.ContactMailPOJO;
import ge.mgl.service.HContactService;
import ge.mgl.utils.GeneralUtil;
import ge.mgl.utils.RequestResponse;
import ge.mgl.utils.VerifyCaptcha;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import static ge.mgl.utils.constants.Constants.ControllerCodes.*;
import static ge.mgl.utils.constants.Constants.ControllerCodes.DELETE;
import static ge.mgl.utils.constants.Constants.ControllerCodes.PUT;

/**
 * Created by MJaniko on 3/12/2017.
 */
@Controller
@RequestMapping("/contact")
public class HContactController {

    private static final Logger log = LoggerFactory.getLogger(HContactController.class);

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private JavaMailSender mailSender;

    @Value("${mail.receiver}")
    private String sendMailTo;

    @Autowired
    private HContactService contactService;

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("content", "contact");
        model.addAttribute("pageTitle", "Contact");
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
        return contactService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + PUT, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse save(@RequestBody HContact contact) {
        contactService.save(contact);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + DELETE, method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse delete(@RequestBody Long id) {
        boolean deleted = contactService.delete(id);
        if (deleted) {
            return GeneralUtil.RequestSuccess();
        }
        return GeneralUtil.RequestError();
    }

    @RequestMapping(value = SLASH + "sendMail", method = RequestMethod.POST)
    @ResponseBody
    public RequestResponse sendMail(@RequestBody ContactMailPOJO contact){
        boolean verify = VerifyCaptcha.verify(contact.getCaptcha());
        if(!verify){
            return  GeneralUtil.RequestError(messageSource.getMessage("auth.wrong.captcha", null, LocaleContextHolder.getLocale()));
        }
        StringBuilder msg = new StringBuilder();
        msg.append("სრული სახელი:").append(contact.getFullName()).append("<br>");
        msg.append("ელ.ფოსტა:").append(contact.getEmail()).append("<br>");
        msg.append("სათაური:").append(contact.getSubject()).append("<br>");
        msg.append("შეტყობინება:").append(contact.getMessage()).append("<br>");
        try {
            mailSender.send(mimeMessage -> {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                message.setFrom("no-reply@naac.ge");
                message.setTo(sendMailTo); // send to user email
                message.setSubject("CONTACT-"+contact.getSubject());
                message.setText(msg.toString(), true);
            });

        } catch (Exception e){
            log.info("EROOR:", e);
        }
        String succesMSG = messageSource.getMessage("auth.contact.success", null, LocaleContextHolder.getLocale());
        return GeneralUtil.RequestSuccess(succesMSG);
    }

}
