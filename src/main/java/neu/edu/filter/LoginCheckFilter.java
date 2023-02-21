package neu.edu.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = { "/comment/*", "/like/*", "/profile/*", "/admin/*" })
public class LoginCheckFilter extends HttpFilter implements Filter {
    public void destroy() {
        // TODO Auto-generated method stub
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();



        if(session.getAttribute("LogInUsername") == null) {
            req.setAttribute("errorType","notLogin");
            req.setAttribute("errorMsg","You have to login first!");
            res.sendRedirect("post");
        }else {
            chain.doFilter(request, response);
        }
    }


}
