/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tmdt.web.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tmdt.web.entity.User;
import tmdt.web.entity.UserDAO;

/**
 *
 * @author Saber
 */
@Controller
public class LoginController {
    UserDAO dao = null;
    
    public LoginController(){
         dao = new UserDAO();
    }
    
    @RequestMapping(value="/doLogin",method = RequestMethod.POST)
    public String checkLogin(@RequestParam String email,@RequestParam String password,HttpServletRequest request,Model m,RedirectAttributes ra){
        if(request.getSession().getAttribute("user")==null){
        if(dao.checkLogin(email,password)) {
            User u = dao.getUser(email);
            request.getSession(true).setAttribute("user", u);
            return "redirect:";
        }
        else{
            ra.addFlashAttribute("loginMessage","Login Fail!");
            //m.asMap().clear();
            return "redirect:/login";
        }
        } else{
            return "redirect:";
        }
        
    }
    
    @RequestMapping(value="/doRegister",method = RequestMethod.POST)
    public String doRegister(HttpServletRequest request,Model m,RedirectAttributes ra){
        if(request.getSession().getAttribute("user")==null){
            String fisrtName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String telephone = request.getParameter("telephone");
            String city = request.getParameter("city");
            User u = new User(fisrtName, lastName, password, email, telephone, city, city,'0');
            if(dao.addUser(u).equals("success")){
                request.getSession(true).setAttribute("user", u);
                return "redirect:";
            } else{
                String registerMes = "Email's in used";
                ra.addFlashAttribute("rm",registerMes);
                //m.asMap().clear();
                return "redirect:/register";
            }
            
        } return "redirect:";
    }
    @RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public ModelAndView getAdminPagesLogined(HttpServletRequest request) {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println(username+password);
            if(dao.checkLogin(username,password)) {
            User u = dao.getUser(username);
            request.getSession(true).setAttribute("admin", u);
            return new ModelAndView("redirect:admin");
        } else
		return new ModelAndView("admin");

	}
}
