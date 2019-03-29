package com.kzw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kzw.entity.Employee;
import com.kzw.entity.User;
import com.kzw.service.UserService;
import com.kzw.utils.Msg;

/**
 * @author kzw
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService us;
	
	@RequestMapping("/login")
	@ResponseBody
	public Msg login(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String tp = request.getParameter("type");
		int type = 0;
		if(tp!=null){
			 type = Integer.parseInt(tp);
		}
		User user = us.findUserByNameAndPassword(username, password, type);
		if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	
	@RequestMapping("/checkusername")
	@ResponseBody
	public String checkUsername(HttpServletRequest request,HttpServletResponse response,Model model){
		String username=request.getParameter("username");
		User user = us.findUserByName(username);
		if(user!=null){
			return "success";
		}
		
		return "fail";
	}
	
	@RequestMapping("/register")
	@ResponseBody
	public Msg register(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		us.regist(username,password);
		return Msg.success();
	}
	
	
	@RequestMapping("/logout")
	public String toRegister(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index";
	}
	
	
	/**
     * 更改员工信息
     * @param empId
     * @param employee
     * @return
     */
    @RequestMapping(value ="/updateadmin/{newpassword}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(@PathVariable("newpassword") String newpassword,HttpServletRequest request){
       HttpSession session = request.getSession();
       User user = (User) session.getAttribute("user");
       if(user!=null){
    	   Integer id = user.getId();
    	   User user2 = new User();
    	   user2.setId(id);
    	   user2.setPassword(newpassword);
    	   us.updateUser(user2);
    	   return Msg.success();
       }
   
       return Msg.fail();
       
       
    }
}
