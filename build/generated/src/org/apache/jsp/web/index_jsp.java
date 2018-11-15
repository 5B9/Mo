package org.apache.jsp.web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import br.edu.ifpr.irati.modelo.Usuario;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        ");

            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        
      out.write("\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Currículos</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.min.js\" integrity=\"sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=\"  crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("    <header>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "cabecalho.jsp", out, true);
      out.write("\n");
      out.write("    </header>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <main>\n");
      out.write("                            ");
 if (u != null) {
                
      out.write("<\n");
      out.write("              <div class=\"carousel carousel-slider center\">\n");
      out.write("    <div class=\"carousel-fixed-item center\">\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item red white-text\" href=\"#one!\">\n");
      out.write("      <h2>First Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your first panel</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item amber white-text\" href=\"#two!\">\n");
      out.write("      <h2>Second Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your second panel</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item green white-text\" href=\"#three!\">\n");
      out.write("      <h2>Third Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your third panel</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item blue white-text\" href=\"#four!\">\n");
      out.write("      <h2>Fourth Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your fourth panel</p>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("            ");
 } else { 
      out.write("\n");
      out.write("            ");
 }
      out.write(" <div class=\"carousel carousel-slider center\">\n");
      out.write("    <div class=\"carousel-fixed-item center\">\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item red white-text\" href=\"#one!\">\n");
      out.write("      <h2>First Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your first panel</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item amber white-text\" href=\"#two!\">\n");
      out.write("      <h2>Second Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your second panel</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item green white-text\" href=\"#three!\">\n");
      out.write("      <h2>Third Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your third panel</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"carousel-item blue white-text\" href=\"#four!\">\n");
      out.write("      <h2>Fourth Panel</h2>\n");
      out.write("      <p class=\"white-text\">This is your fourth panel</p>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("        </main>\n");
      out.write("  \n");
      out.write("    <footer>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "rodape.jsp", out, true);
      out.write("\n");
      out.write("    </footer>                \n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js\"></script>        \n");
      out.write("  </body>\n");
      out.write("  <script>\n");
      out.write("     var instance = M.Carousel.init({\n");
      out.write("    fullWidth: true,\n");
      out.write("    indicators: true\n");
      out.write("  });\n");
      out.write("\n");
      out.write("  // Or with jQuery\n");
      out.write("\n");
      out.write("  $('.carousel.carousel-slider').carousel({\n");
      out.write("    fullWidth: true,\n");
      out.write("    indicators: true\n");
      out.write("  });\n");
      out.write("      </script>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
