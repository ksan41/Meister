/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.53
 * Generated at: 2020-04-12 12:39:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.menubar;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class NewFile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      out.write("  \r\n");
      out.write("\r\n");
      out.write("    <!-- <link rel=\"stylesheet\" href=\"css/responsive.css\"> -->\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css\">\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("\t\t @import url(\"css/bootstrap.min.css\");\r\n");
      out.write("  \t\t  @import url(\"css/owl.carousel.min.css\");\r\n");
      out.write("   \t\t @import url(\"css/magnific-popup.css\");\r\n");
      out.write("    @import url(\"css/font-awesome.min.css\");\r\n");
      out.write("    @import url(\"css/themify-icons.css\");\r\n");
      out.write("    @import url(\"css/nice-select.css\");\r\n");
      out.write("    @import url(\"css/flaticon.css\");\r\n");
      out.write("    @import url(\"css/gijgo.css\");\r\n");
      out.write("    @import url(\"css/animate.min.css\");\r\n");
      out.write("    @import url(\"css/slick.css\");\r\n");
      out.write("    @import url(\"css/slicknav.css\");\r\n");
      out.write("    @import url(\"css/style.css\");\r\n");
      out.write("\t\r\n");
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
      out.write("                                <a href=\"#\"><img src=\"img/icons/add_cart.png\" alt=\"\"></a>\r\n");
      out.write("                                <a href=\"#\">로그인</a>\r\n");
      out.write("                                <a href=\"#\">회원가입</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"logo\" style=\"margin-left:105%;\">\r\n");
      out.write("                                <a href=\"index.html\">\r\n");
      out.write("                                    <img src=\"img/logo.png\" alt=\"\">\r\n");
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
      out.write("    <!-- bradcam_area  -->\r\n");
      out.write("    <div class=\"bradcam_area bradcam_bg_1\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-xl-12\">\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- /bradcam_area  -->\r\n");
      out.write("\t\r\n");
      out.write("\t<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>\r\n");
      out.write("    <!-- 메인메뉴바 끝-->   \r\n");
      out.write("    <!-- JS here -->\r\n");
      out.write("    <script src=\"js/vendor/modernizr-3.5.0.min.js\"></script>\r\n");
      out.write("    <script src=\"js/vendor/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("    <script src=\"js/popper.min.js\"></script>\r\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"js/owl.carousel.min.js\"></script>\r\n");
      out.write("    <script src=\"js/isotope.pkgd.min.js\"></script>\r\n");
      out.write("    <script src=\"js/ajax-form.js\"></script>\r\n");
      out.write("    <script src=\"js/waypoints.min.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.counterup.min.js\"></script>\r\n");
      out.write("    <script src=\"js/imagesloaded.pkgd.min.js\"></script>\r\n");
      out.write("    <script src=\"js/scrollIt.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.scrollUp.min.js\"></script>\r\n");
      out.write("    <script src=\"js/wow.min.js\"></script>\r\n");
      out.write("    <script src=\"js/nice-select.min.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.slicknav.min.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.magnific-popup.min.js\"></script>\r\n");
      out.write("    <script src=\"js/plugins.js\"></script>\r\n");
      out.write("    <script src=\"js/gijgo.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!--contact js-->\r\n");
      out.write("    <script src=\"js/contact.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.ajaxchimp.min.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.form.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.validate.min.js\"></script>\r\n");
      out.write("    <script src=\"js/mail-script.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"js/main.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
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
