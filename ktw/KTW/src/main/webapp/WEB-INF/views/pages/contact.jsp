<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div data-ix="load-fading-3-contact-page" class="contacts main-section">
    <jsp:include page="../includes/nav.jsp">
        <jsp:param name="className" value="assortment main-section"/>
    </jsp:include>
    <div class="contact-container w-clearfix">
        <div data-ix="move-down-30" class="contacts-box">

            <h1 class="primary-heading">
                <fmt:message key="contact.page.title"/>
            </h1>
            <div class="contact-text-block">
                <div class="contact-text-heading">
                    <div><fmt:message key="contact.page.address.title"/></div>
                </div>
                <div class="contact-text">
                    <div>
                        <div><fmt:message key="contact.page.address.desc"/></div>
                    </div>
                    <div>
                        <div><fmt:message key="contact.page.address.desc2"/></div>
                    </div>
                </div>
            </div>
            <div class="contact-text-block">
                <div class="contact-text-heading">
                    <div><div><fmt:message key="contact.page.phone"/></div></div>
                </div>
                <div class="contact-text">
                    <div><span class="phone-span">+995 32 223 77 22</span>+995 32 223 77 00</div>
                </div>
            </div>
            <div class="contact-text-block">
                <div class="contact-text-heading">
                    <div><fmt:message key="contact.page.fax"/></div>
                </div>
                <div class="contact-text">
                    <div>+995 32 223 77 11</div>
                </div>
            </div>
            <div class="contact-text-block">
                <div class="contact-text-heading">
                    <div><fmt:message key="contact.page.email"/></div>
                </div>
                <div class="contact-text">
                    <div><a href="mailto:info@ktw.ge" class="link">info@ktw.ge</a></div>
                </div>
            </div>
        </div>
        <div data-ix="move-down-30" class="contact-form-container" style="display: none;">
            <div class="contact-form w-form">
                <form id="email-form" name="email-form" data-name="Email Form"><label for="name" class="field-label">Your
                    name</label><input type="text" id="name" name="name" data-name="Name" maxlength="256"
                                       class="input w-input"><label for="email" class="field-label">Your
                    E-mail</label><input type="text" class="input w-input" maxlength="256" name="email"
                                         data-name="Email" id="email" required=""><label for="field"
                                                                                         class="field-label">Your
                    message</label><textarea id="field" name="field" maxlength="5000"
                                             class="area input w-input"></textarea><input type="submit"
                                                                                          value="Send message"
                                                                                          data-wait="Please wait..."
                                                                                          class="button contact-submit w-button">
                </form>
                <div class="form-success w-form-done">
                    <div class="form-separetor-wrapper"><img src="images/sep.svg"></div>
                    <div class="text-block">Thank you! Your message has been send!</div>
                    <div class="bottom form-separetor-wrapper"><img src="images/sep.svg"></div>
                </div>
                <div class="form-error w-form-fail">
                    <div>Oops! Something went wrong while submitting the form.</div>
                </div>
            </div>
        </div>
    </div>
    <div class="gradient-block"></div>
</div>