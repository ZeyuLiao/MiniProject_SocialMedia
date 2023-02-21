//package neu.edu.controller;
//
//import neu.edu.entity.AccountData;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@WebServlet("/ServletRedirect")
//public class ServletRedirect extends HttpServlet {
//
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        PrintWriter out = resp.getWriter();
//        String email = "checked";
//        String sms = "checked";
//        HttpSession session = req.getSession();
//        AccountData ad = (AccountData) session.getAttribute("firstName");
//        try {
//            if (ad.getContactPreference().equals("Email")) sms = "";
//            else email = "";
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        ;
//
//        out.append(
//                "<!DOCTYPE html>"
//                        + "<html lang=\"en\">"
//                        + "<head>"
//                        + "<meta charset=\"UTF-8\">"
//                        + "<title>Title</title>"
//                        + "<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\">"
//                        + "<link href=\"stylesheet.css\" rel=\"stylesheet\">"
//                        + "<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js\"></script>"
//                        + "</head>"
//                        + "<body>"
//                        + "<header>"
//                        + "<nav class=\"navbar\">"
//                        + "<div class=\"container-fluid\">"
//                        + "<a class=\"navbar-brand\" href=\"https://www.northeastern.edu/\">"
//                        + "<img src=\"Neu_Logo.png\" alt=\"Logo\""
//                        + "width=\"80\" height=\"80\""
//                        + "class=\"d-inline-block align-text-top\">"
//                        + "Bootstrap"
//                        + "</a>"
//                        + "</div>"
//                        + "</nav>"
//                        + "</header>"
//                        + "<div class=\"container\">"
//                        + "<div class=\"py-5 text-center\">"
//                        + "<h2>Account Info</h2>"
//                        + "</div>"
//                        + "<div class=\"row justify-content-md-center\">"
//                        + "<div class=\"col-md-8 row\">"
//                        + "<h4 class=\"mb-1\">Account Information</h4>"
//                        + "<hr class=\"my-1\">"
//                        + "<div class=\"col-md-4\">"
//                        + "<label for=\"firstName\" class=\"form-label\">First Name</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getFirstName() + "\" id=\"firstName\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-4\">"
//                        + "<label for=\"middleName\" class=\"form-label\">Middle Name</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getMiddleName() + "\" id=\"middleName\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-4\">"
//                        + "<label for=\"lastName\" class=\"form-label\">Last Name</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getLastName() + "\" id=\"lastName\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-4\">"
//                        + "<label for=\"gender\" class=\"form-label\">Gender</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getGender() + "\" id=\"gender\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-10\">"
//                        + "<label for=\"username\" class=\"form-label\">Username</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getUsername() + "\" id=\"username\" disabled>"
//                        + "</div>"
//// I think we should not display the password here.
////            + "<div class=\"col-md-10\">"
////            + "<label for=\"password1\" class=\"form-label\">Password</label>"
////            + "<input type=\"password\" class=\"form-control\" value=\"\" id=\"password1\" disabled>"
////            + "</div>"
////            + "<div class=\"col-md-10\">"
////            + "<label for=\"password2\" class=\"form-label\">Password</label>"
////            + "<input type=\"password\" class=\"form-control\" value=\"\" id=\"password2\" disabled>"
////            + "</div>"
//                        + "<h4 class=\"mb-1\">Address</h4>"
//                        + "<hr class=\"my-1\">"
//                        + "<div class=\"col-md-12\">"
//                        + "<label for=\"address1\" class=\"form-label\">Address Line #1</label>"
//                        + "<div class=\"input-group has-validation\">"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getAddress1() + "\" id=\"address1\" disabled>"
//                        + "</div>"
//                        + "</div>"
//                        + "<div class=\"col-md-12\">"
//                        + "<label for=\"address2\" class=\"form-label\">Address Line #2</label>"
//                        + "<div class=\"input-group has-validation\">"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getAddress2() + "\" id=\"address2\" disabled>"
//                        + "</div>"
//                        + "</div>"
//                        + "<div class=\"col-md-6\">"
//                        + "<label for=\"City\" class=\"form-label\">City</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getCity() + "\" id=\"City\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-6\">"
//                        + "<label for=\"State\" class=\"form-label\">State</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getState() + "\" id=\"State\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-6\">"
//                        + "<label for=\"country\" class=\"form-label\">Country</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getCountry() + "\" id=\"country\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-6\">"
//                        + "<label for=\"PostalCode\" class=\"form-label\">Postal Code</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getPostalCode() + "\" id=\"PostalCode\" disabled>"
//                        + "</div>"
//                        + "<h4 class=\"mb-1\">Contact</h4>"
//                        + "<hr class=\"my-1\">"
//                        + "<div class=\"col-md-12\">"
//                        + "<label for=\"mobileNumber\" class=\"form-label\">Mobile Number</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getMobileNumber() + "\" id=\"mobileNumber\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-12\">"
//                        + "<label for=\"workNumber\" class=\"form-label\">Work Number</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getWorkNumber() + "\" id=\"workNumber\" disabled>"
//                        + "</div>"
//                        + "<div class=\"col-md-12\">"
//                        + "<label for=\"email\" class=\"form-label\">Email</label>"
//                        + "<input type=\"text\" class=\"form-control\" value=\"" + ad.getEmail() + "\" id=\"email\" disabled>"
//                        + "</div>"
//                        + "<label for=\"contactPreference\">Contact Preference</label>"
//                        + "<div class=\"col-md-12\" id=\"contactPreference\">"
//                        + "<div class=\"form-check form-check-inline\">"
//                        + "<input class=\"form-check-input\" type=\"radio\" name=\"Radio\" id=\"smsRadio\" " + sms + " disabled>"
//                        + "<label class=\"form-check-label\" for=\"smsRadio\">"
//                        + "SMS"
//                        + "</label>"
//                        + "</div>"
//                        + "<div class=\"form-check form-check-inline\">"
//                        + "<input class=\"form-check-input\" type=\"radio\" name=\"Radio\" id=\"emailRadio\" " + email + " disabled>"
//                        + "<label class=\"form-check-label\" for=\"emailRadio\">"
//                        + "Email"
//                        + "</label>"
//                        + "</div>"
//                        + "</div>"
//                        + "<div class=\"py-5 text-center\">"
//                        + "<hr class=\"my-1\">"
//                        + "</div>"
//                        + "</div>"
//                        + "</div>"
//                        + "</div>"
//                        + "<footer>"
//                        + "<nav class=\"navbar py-0\">"
//                        + "<div class=\"container-fluid\">"
//                        + "<span class=\"navbar-text text-light\">"
//                        + "</span>"
//                        + "<p class=\"mt-5 mb-3 text-light\">@ZeyuLiao Assignment3</p>"
//                        + "</div>"
//                        + "</nav>"
//                        + "</footer>"
//                        + "</body>"
//                        + "</html>"
//        );
//    }
//
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req, resp);
//    }
//
//}