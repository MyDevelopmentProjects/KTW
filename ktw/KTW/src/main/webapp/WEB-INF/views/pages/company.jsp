<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<jsp:include page="../includes/nav.jsp">
    <jsp:param name="className" value="assortment main-section comp-section"/>
    <jsp:param name="headingText" value="${headingTitle}"/>
    <jsp:param name="headingDesc" value="${headingDesc}"/>
</jsp:include>
<div data-ix="float-menu-show" class="content-section">
    <div class="company-today-block w-container">
        <div class="bg-img-ctd-wrapper"><img src="images/wt_bg_grape.png" width="1060"
                                             srcset="images/wt_bg_grape-p-500.png 500w, images/wt_bg_grape-p-800.png 800w, images/wt_bg_grape-p-1080.png 1080w, images/wt_bg_grape-p-1600.png 1600w, images/wt_bg_grape-p-2000.png 2000w, images/wt_bg_grape.png 2120w"
                                             sizes="(max-width: 767px) 100vw, (max-width: 991px) 848px, 1060px"></div>
        <div class="cofw-container">
            <h3><fmt:message key="company.first.section.title"/></h3>
            <div class="content-wrapper w-clearfix">
                <p class="content-p red-line">
                    <fmt:message key="company.first.section.desc1"/>
                </p>
                <div class="block-quote">
                    <div class="bq-wrapper">
                        <div class="bottom separetor"></div>
                        <div class="separetor"></div>
                        <p class="bq-text">
                            <fmt:message key="company.first.section.desc2"/>
                        </p>
                    </div>
                </div>
                <p class="content-p">
                    <fmt:message key="company.first.section.desc3"/>
                </p>
                <p class="content-p">
                    <fmt:message key="company.first.section.desc4"/>
                </p>
                <p class="content-p">
                    <fmt:message key="company.first.section.desc5"/>
                </p>
            </div>
        </div>
    </div>
    <div class="squares-block">
        <div class="squares-row w-clearfix">
            <div class="square-col">
                <div class="sq-quote">
                    <div class="sq-quote-wrapper">
                        <p>
                            <fmt:message key="company.second.section.desc1"/>
                        </p>
                        <div class="bottom separetor"></div>
                        <div class="separetor"></div>
                    </div>
                </div>
            </div>
            <div class="square-col">
                <div class="square-img-wrapper"><img src="uploads/company1-min.png"></div>
            </div>
        </div>
        <div class="reverse squares-row w-clearfix">
            <div class="square-col">
                <div class="sq-quote">
                    <div class="sq-quote-wrapper">
                        <p>
                            <fmt:message key="company.second.section.desc2"/>
                        </p>
                        <div class="bottom separetor"></div>
                        <div class="separetor"></div>
                    </div>
                </div>
            </div>
            <div class="square-col">
                <div class="square-img-wrapper"><img src="uploads/company2-min.png"></div>
            </div>
        </div>
        <div class="squares-row w-clearfix">
            <div class="square-col">
                <div class="sq-quote">
                    <div class="sq-quote-wrapper">
                        <p><fmt:message key="company.second.section.desc3"/></p>
                        <div class="bottom separetor"></div>
                        <div class="separetor"></div>
                    </div>
                </div>
            </div>
            <div class="square-col">
                <div class="square-img-wrapper"><img src="uploads/company3-min.png"></div>
            </div>
        </div>
    </div>
    <div id="vinery" class="vineyards-section">
        <div class="vineyards-block w-container">
            <div class="content-container">
                <h1 class="h1-content">
                    <p><fmt:message key="company.third.section.title"/></p>
                </h1>
                <div class="p-wrapper">
                    <p class="content-p">
                    <p><fmt:message key="company.third.section.desc1"/></p>
                    </p>
                </div>
                <div class="export-columns-container w-hidden-main">
                    <div class="vineyards-col w-hidden-main w-hidden-medium">
                        <div class="vineyards-col-label">Racha-lechkhumi</div>
                        <div class="vineyards-col-label">achalsopeli</div>
                        <div class="vineyards-col-label">Saguramo</div>
                        <div class="vineyards-col-label">Askana</div>
                        <div class="vineyards-col-label">tbilisi</div>
                        <div class="vineyards-col-label">Keda</div>
                    </div>
                    <div class="vineyards-col w-hidden-main w-hidden-medium">
                        <div class="vineyards-col-label">Vachnadziani</div>
                        <div class="vineyards-col-label">akhasheni</div>
                        <div class="vineyards-col-label">tsinandali</div>
                        <div class="vineyards-col-label">SAGURAMO</div>
                        <div class="vineyards-col-label">kakheti</div>
                        <div class="vineyards-col-label">kvareli</div>
                    </div>
                </div>
            </div>
            <div class="map-block w-hidden-small w-hidden-tiny">
                <div class="map-container">
                    <div class="map-wrapper"><img src="images/g-map.svg"></div>
                    <div class="pin-container pos-13">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-12">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-11">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div data-ix="pin-animate" class="pin-container pos-10">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-9">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-8">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-7">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-6">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-5">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-4">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-3">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-2">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div class="pin-container pos-1">
                        <div data-ix="pin-animate" class="pin-wrapper"><img src="images/pin.svg" width="32"></div>
                    </div>
                    <div data-ix="in-label-conainer" class="map-label-container pos-5">
                        <div class="map-label">kakheti</div>
                        <div class="map-label">kvareli</div>
                        <div class="map-label">akhasheni</div>
                        <div class="map-label">Vachnadziani</div>
                        <div class="map-label">tsinandali</div>
                        <div class="map-label">Kondoli</div>
                    </div>
                    <div data-ix="in-label-conainer" class="map-label-container pos-4">
                        <div class="map-label">achalsopeli</div>
                    </div>
                    <div data-ix="in-label-conainer-2" class="map-label-container pos-2">
                        <div class="map-label">Racha-lechkhumi</div>
                    </div>
                    <div data-ix="in-label-conainer" class="map-label-container">
                        <div class="map-label">Askana</div>
                        <div class="map-label">keda</div>
                    </div>
                    <div data-ix="in-label-conainer-3" class="map-label-container pos-3">
                        <div class="map-label">tbilisi</div>
                        <div class="map-label">kedachalsopelia</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="letter-section">
        <div class="leter-block">
            <div class="blorder-block">
                <div class="border-block-2">
                    <div class="separetor-container">
                        <div class="separator-wrapper"><img src="images/sep_top.svg"></div>
                    </div>
                    <p class="content-p red-line">
                        <fmt:message key="company.fourth.bigsection.desc1"/>
                    </p>
                    <p class="light-content-p">
                        <fmt:message key="company.fourth.bigsection.desc2"/>
                    </p>
                    <p class="light-content-p">
                        <fmt:message key="company.fourth.bigsection.desc3"/>
                    </p>
                    <p class="light-content-p">
                        <fmt:message key="company.fourth.bigsection.desc4"/>
                    </p>
                    <p class="light-content-p">
                        <fmt:message key="company.fourth.bigsection.desc5"/>
                    </p>
                    <div class="bottom separetor-container">
                        <div class="separator-wrapper"><img src="images/sep_top.svg"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="export-section">
    <div class="w-container">
        <div class="content-container">
            <h1 class="h1-content white">
                <fmt:message key="company.fifth.section.title"/>
            </h1>
            <div class="p-wrapper">
                <p class="content-p white">
                    <fmt:message key="company.fifth.section.desc1"/>
                </p>
            </div>
            <div class="w-hidden-medium w-hidden-small w-hidden-tiny world-map-block">
                <div class="world-map-container">
                    <div class="world-map-wrapper"><img src="images/world-map.svg"></div>
                    <div class="bottom-label-container pos-2">
                        <div class="bottom-label-block">
                            <div data-ix="map-estonia" class="world-map-reverse-label">Estonia</div>
                            <div data-ix="map-litva" class="world-map-reverse-label">lithuania</div>
                            <div data-ix="map-belarus" class="world-map-reverse-label">Belarus</div>
                            <div data-ix="map-ukraine" class="world-map-reverse-label">Ukraine</div>
                            <div data-ix="map-latvia" class="world-map-reverse-label">latvia</div>
                        </div>
                    </div>
                    <div class="bottom-label-container pos-7">
                        <div class="bottom-label-block">
                            <div data-ix="map-japan" class="world-map-reverse-label">Japan</div>
                        </div>
                    </div>
                    <div class="bottom-label-container pos-6">
                        <div class="bottom-label-block">
                            <div data-ix="map-taiwan" class="world-map-reverse-label">Taiwan</div>
                        </div>
                    </div>
                    <div class="bottom-label-container pos-5">
                        <div class="bottom-label-block">
                            <div data-ix="map-china" class="world-map-reverse-label">China</div>
                            <div data-ix="map-hk" class="world-map-reverse-label">Hong kong</div>
                        </div>
                    </div>
                    <div class="bottom-label-container pos-4">
                        <div class="bottom-label-block">
                            <div data-ix="map-kazahstan" class="world-map-reverse-label">Kazakhstan</div>
                        </div>
                    </div>
                    <div class="bottom-label-container pos-3">
                        <div class="bottom-label-block">
                            <div data-ix="map-israel" class="world-map-reverse-label">israel</div>
                        </div>
                    </div>
                    <div class="bottom-label-container pos-1">
                        <div class="bottom-label-block">
                            <div data-ix="map-france" class="world-map-reverse-label">France</div>
                            <div data-ix="map-germany" class="world-map-reverse-label">Germany</div>
                            <div data-ix="map-chech" class="world-map-reverse-label">czech republic</div>
                            <div data-ix="map-poland" class="world-map-reverse-label">Poland</div>
                        </div>
                    </div>
                    <div class="pos-4 top-label-container">
                        <div data-ix="map-russia" class="world-map-label">Russia</div>
                    </div>
                    <div class="pos-2 top-label-container">
                        <div data-ix="map-bretain" class="world-map-label">Great bretain</div>
                    </div>
                    <div class="pos-3 top-label-container">
                        <div data-ix="map-norway" class="world-map-label">Norway</div>
                    </div>
                    <div class="pos-1 top-label-container">
                        <div data-ix="map-usa" class="world-map-label">USA</div>
                    </div>
                    <div data-ix="inworld-map-coutry" class="hk"><img src="images/hk.svg"></div>
                    <div data-ix="inworld-map-coutry" class="taiwan"><img src="images/taiwan.svg"></div>
                    <div data-ix="inworld-map-coutry" class="israel"><img src="images/israel.svg"></div>
                    <div data-ix="inworld-map-coutry" class="germany"><img src="images/germany.svg"></div>
                    <div data-ix="inworld-map-coutry" class="chech"><img src="images/chech.svg"></div>
                    <div data-ix="inworld-map-coutry" class="estonia"><img src="images/estonia.svg"></div>
                    <div data-ix="inworld-map-coutry" class="litva"><img src="images/litva.svg"></div>
                    <div data-ix="inworld-map-coutry" class="latvia"><img src="images/latviya.svg"></div>
                    <div data-ix="inworld-map-coutry" class="belarus"><img src="images/belarus.svg"></div>
                    <div data-ix="inworld-map-coutry" class="poland"><img src="images/poland.svg"></div>
                    <div data-ix="inworld-map-coutry" class="france"><img src="images/france.svg"></div>
                    <div data-ix="inworld-map-coutry" class="bretain"><img src="images/bretain.svg"></div>
                    <div data-ix="inworld-map-coutry" class="norway"><img src="images/norway_1.svg"></div>
                    <div data-ix="inworld-map-coutry" class="ukraine"><img src="images/ukraine.svg"></div>
                    <div data-ix="inworld-map-coutry" class="kaz"><img src="images/kazah.svg"></div>
                    <div data-ix="inworld-map-coutry" class="china"><img src="images/china.svg"></div>
                    <div data-ix="inworld-map-coutry" class="japan"><img src="images/jap.svg"></div>
                    <div data-ix="inworld-map-coutry" class="rus"><img src="images/rus_3.svg"></div>
                    <div data-ix="inworld-map-coutry" class="usa"><img src="images/usa.svg"></div>
                </div>
            </div>
            <div class="export-columns-container w-hidden-main">
                <div class="export-col">
                    <div class="export-col-label">Norway</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">GREAT BRETAIN</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">France</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">germany</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">CZECH REPUBLIC</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">Poland</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">Norway</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">israel</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">estonia</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">LITHUANIA</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">belarus</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">ukraine</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">latvia</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">KAZAKHSTAN</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">Russia</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">HONG KONG</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">China</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">taiwan</div>
                </div>
                <div class="export-col">
                    <div class="export-col-label">japan</div>
                </div>
            </div>
        </div>
    </div>
</div>