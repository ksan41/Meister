/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.53
 * Generated at: 2020-04-13 07:07:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/views/common/footer.jsp", Long.valueOf(1586705888000L));
    _jspx_dependants.put("/views/common/menubarIndexIMG.jsp", Long.valueOf(1586761661660L));
    _jspx_dependants.put("/views/common/menubar.jsp", Long.valueOf(1586703702000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style>\r\n");
      out.write("\t/* 배달/포장주문버튼 */\r\n");
      out.write("        .orderBtns{\r\n");
      out.write("            margin-top: 50px;\r\n");
      out.write("            width:750px;\r\n");
      out.write("            height:200px;\r\n");
      out.write("            margin-left:auto;\r\n");
      out.write("            margin-right: auto;\r\n");
      out.write("            padding:10px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .orderBtns img{\r\n");
      out.write("            width:150px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .orderBtns>div{\r\n");
      out.write("            padding:10px;\r\n");
      out.write("            margin-left: 20px;\r\n");
      out.write("            margin-right: 10px;\r\n");
      out.write("            float:left;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            width:45%;\r\n");
      out.write("            background-color: lightgray;\r\n");
      out.write("            border-radius: 20px;\r\n");
      out.write("            color:#5A4847;\r\n");
      out.write("            font-size:32px;\r\n");
      out.write("            font-family: 'nanumsquare';\r\n");
      out.write("            font-weight: bolder;\r\n");
      out.write("        }\r\n");
      out.write("        .orderBtns>div:hover{\r\n");
      out.write("        \tcursor:pointer;\r\n");
      out.write("        \topacity:70%;\r\n");
      out.write("        }\r\n");
      out.write("        /* 배달/포장주문버튼 */\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t ");
      out.write('\r');
      out.write('\n');

	String contextPath = request.getContextPath();
	//String msg = (String)session.getAttribute("msg");
	//Member loginUser = (Member)session.getAttribute("loginUser");


      out.write("    \r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html class=\"no-js\" lang=\"zxx\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n");
      out.write("    <title>Tasty Recipes</title>\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("    <!-- <link rel=\"manifest\" href=\"site.webmanifest\"> -->\r\n");
      out.write("    <!-- Place favicon.ico in the root directory -->\r\n");
      out.write("\r\n");
      out.write("    <!-- CSS here -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/bootstrap.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/owl.carousel.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/magnific-popup.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/font-awesome.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/themify-icons.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/nice-select.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/flaticon.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/gijgo.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/animate.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/slick.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/slicknav.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/views/common/css/style.css\">\r\n");
      out.write("    <!-- <link rel=\"stylesheet\" href=\"css/responsive.css\"> -->\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css\">\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("\r\n");
      out.write("        #user-area{\r\n");
      out.write("            margin-top:15px;\r\n");
      out.write("            width:200px;\r\n");
      out.write("            height:100px;\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            left:1500px;\r\n");
      out.write("            \r\n");
      out.write("        }\r\n");
      out.write("        #user-area *{\r\n");
      out.write("         color:white;\r\n");
      out.write("         padding-right:10px;\r\n");
      out.write("         float: left;\r\n");
      out.write("         margin: auto;\r\n");
      out.write("         font-family: 'nanumsquare';\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"margin:0; padding:0;\">\r\n");
      out.write("\r\n");
      out.write("    <!-- 메인메뉴바 시작-->\r\n");
      out.write("     <!-- header-start -->\r\n");
      out.write("     <header style=\"margin: 0;padding: 0;\"> \r\n");
      out.write("        <div class=\"header-area \"  style=\"margin: 0;padding: 0;\">\r\n");
      out.write("            <div id=\"sticky-header\" class=\"main-header-area \"  style=\"margin: 0;padding: 0;\">\r\n");
      out.write("                    <div class=\"row align-items-center\" style=\"margin: 0;padding: 0;\">\r\n");
      out.write("                        <div class=\"col-xl-3 col-lg-2\" style=\"margin: 0;padding: 0;\">\r\n");
      out.write("                            <div id=\"user-area\">\r\n");
      out.write("                                <a href=\"#\"><img src=\"");
      out.print(contextPath );
      out.write("/views/common/img/icons/add_cart.png\" alt=\"\"></a>\r\n");
      out.write("                                <a href=\"#\">로그인</a>\r\n");
      out.write("                                <a href=\"#\">회원가입</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"logo\" style=\"margin-left:105%;\">\r\n");
      out.write("                                <a href=\"index.html\">\r\n");
      out.write("                                    <img src=\"");
      out.print(contextPath );
      out.write("/views/common/img/logo.png\" alt=\"\">\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-xl-6 col-lg-7\" style=\"margin: 0;padding: 0;\">\r\n");
      out.write("                            <div class=\"main-menu   d-none d-lg-block\" style=\"margin: 0;padding: 0;margin-top: 5%;\">\r\n");
      out.write("                                <nav style=\"margin: 0;padding: 0;\">\r\n");
      out.write("                                    <ul id=\"navigation\">\r\n");
      out.write("                                        <li><a href=\"#\">메뉴</a></li>\r\n");
      out.write("                                        <li><a href=\"#\">이벤트</a></li>\r\n");
      out.write("                                        <li><a href=\"#\">매장검색</a>                                    \r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li><a href=\"#\">고객센터</a></li>\r\n");
      out.write("                                        <li><a href=\"#\">공지사항</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </nav>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </header>\r\n");
      out.write("    <!-- header-end -->\r\n");
      out.write("    <!-- 메인메뉴바 끝-->   \r\n");
      out.write("    <!-- JS here -->\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/vendor/modernizr-3.5.0.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/vendor/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/popper.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/owl.carousel.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/isotope.pkgd.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/ajax-form.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/waypoints.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/jquery.counterup.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/imagesloaded.pkgd.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/scrollIt.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/jquery.scrollUp.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/wow.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/nice-select.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/jquery.slicknav.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/jquery.magnific-popup.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/plugins.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/gijgo.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!--contact js-->\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/contact.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/jquery.ajaxchimp.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/jquery.form.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/jquery.validate.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/mail-script.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"");
      out.print(contextPath );
      out.write("/views/common/js/main.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\t ");
      out.write("\r\n");
      out.write("<html class=\"no-js\" lang=\"zxx\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n");
      out.write("    <title>Tasty Recipes</title>\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body style=\"margin:0; padding:0;\">\r\n");
      out.write("\r\n");
      out.write("    <!-- slider_area_start -->\r\n");
      out.write("    <div class=\"slider_area\">\r\n");
      out.write("        <div class=\"single_slider  d-flex align-items-center slider_bg_1\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row align-items-center justify-content-center\">\r\n");
      out.write("                    <div class=\"col-xl-8 \">\r\n");
      out.write("                        <div class=\"slider_text text-center\">\r\n");
      out.write("                            <div class=\"text\">\r\n");
      out.write("                            \t<br><br><br><br>\r\n");
      out.write("                                <h3>\r\n");
      out.write("                                   Meister Pizza\r\n");
      out.write("                                </h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- 배달/포장주문 버튼 -->\r\n");
      out.write("    <div class=\"orderBtns\">\r\n");
      out.write("        <div id=\"deliveryBtn\"><img src=\"");
      out.print(contextPath );
      out.write("/resources/siteImgs/pageImg/deliveryPic.png\" alt=\"\">배달주문</div>\r\n");
      out.write("        <div id=\"takeOutBtn\"><img src=\"");
      out.print(contextPath );
      out.write("/resources/siteImgs/pageImg/takeOutPic.png\" alt=\"\">포장주문</div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- 배달/포장주문 버튼 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"customer_feedback_area\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row justify-content-center mb-50\">\r\n");
      out.write("                <div class=\"col-xl-9\">\r\n");
      out.write("                    <div class=\"section_title text-center\">\r\n");
      out.write("                        \r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-xl-12\">\r\n");
      out.write("                    <div class=\"customer_active owl-carousel\">\r\n");
      out.write("                        <div class=\"single_customer d-flex\">\r\n");
      out.write("                            <div class=\"thumb\">\r\n");
      out.write("                                <img src=\"views/common/img/testmonial/event1.png\" alt=\"\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"single_customer d-flex\">\r\n");
      out.write("                            <div class=\"thumb\">\r\n");
      out.write("                                <img src=\"views/common/img/testmonial/event1.png\" alt=\"\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"single_customer d-flex\">\r\n");
      out.write("                            <div class=\"thumb\">\r\n");
      out.write("                                <img src=\"views/common/img/testmonial/event1.png\" alt=\"\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"single_customer d-flex\">\r\n");
      out.write("                            <div class=\"thumb\">\r\n");
      out.write("                                <img src=\"views/common/img/testmonial/event1.png\" alt=\"\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html class=\"no-js\" lang=\"zxx\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n");
      out.write("    <title>Tasty Recipes</title>\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        footer{\r\n");
      out.write("            box-sizing: border-box;\r\n");
      out.write("        }\r\n");
      out.write("\t\t\r\n");
      out.write("        .copy-right{\r\n");
      out.write("            margin-right: 200px;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body style=\"margin:0; padding:0;\">\r\n");
      out.write("\r\n");
      out.write("    <!-- footer  -->\r\n");
      out.write("        <footer class=\"footer\">\r\n");
      out.write("            <div id=\"footer-logo-area\" style=\"margin-top:10px;\">\r\n");
      out.write("                <img src=\"/Meister/views/common/img/logo.png\">\r\n");
      out.write("                <h2 style=\"margin-top: 42px;\">1588-0505</h2>\r\n");
      out.write("            </div>\r\n");
      out.write("            <br>\r\n");
      out.write("            <div class=\"copy-right\">\r\n");
      out.write("            45662 서울특별시 강남구 피자로 100 장인의손길㈜｜대표이사 : 김장인<br>\r\n");
      out.write("                        사업자 등록번호: 1203-23233-3578901｜통신판매업신고: 갱냄 5103호｜개인정보 보호책임자 : 김말똥<br>\r\n");
      out.write("                        문의 : pizzameister11@gmail.com<br>\r\n");
      out.write("            Copyright ⓒ Meister Pizza. All rights reserved\r\n");
      out.write("            </div>                  \r\n");
      out.write("        </footer>\r\n");
      out.write("    <!--/ footer  -->\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
