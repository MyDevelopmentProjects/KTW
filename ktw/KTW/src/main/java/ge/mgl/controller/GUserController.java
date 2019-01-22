package ge.mgl.controller;

import ge.mgl.entities.GUser;
import ge.mgl.entities.GUserPasswordReset;
import ge.mgl.pojo.*;
import ge.mgl.security.SpringSecurityUser;
import ge.mgl.security.UserUtils;
import ge.mgl.service.GUserPasswordResetService;
import ge.mgl.service.GUserService;
import ge.mgl.utils.*;
import ge.mgl.utils.pagination.PaginationAndFullSearchQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import static ge.mgl.utils.constants.Constants.ControllerCodes.*;

@RestController
@RequestMapping("/user")
public class GUserController {

    @Autowired
    private GUserService userService;

    @Autowired
    private GUserPasswordResetService userPasswordResetService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private JavaMailSender mailSender;

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + LIST, method = RequestMethod.GET)
    public PaginationAndFullSearchQueryResult getList(
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String searchExpression,
            @RequestParam(required = false, defaultValue = STRING_EMPTY) String sortField,
            @RequestParam(required = false, defaultValue = IS_ASCENDING_DEFAULT_VALUE) boolean isAscending,
            @RequestParam(value = PAGE_NUMBER, required = false, defaultValue = PAGE_NUMBER_DEFAULT_VALUE) Integer pageNumber,
            @RequestParam(required = false, defaultValue = PAGE_SIZE_DEFAULT_VALUE) int pageSize) {
        return userService.getList(searchExpression, sortField, isAscending, pageNumber, pageSize);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + PUT, method = RequestMethod.POST)
    public RequestResponse save(@RequestBody GUser user) {
        userService.save(user);
        return GeneralUtil.RequestSuccess();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = SLASH + DELETE, method = RequestMethod.POST)
    public RequestResponse delete(@RequestBody Long id) {
        boolean deleted = userService.delete(id);
        if (deleted) {
            return GeneralUtil.RequestSuccess();
        }
        return GeneralUtil.RequestError();
    }
}
