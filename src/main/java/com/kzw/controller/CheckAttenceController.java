package com.kzw.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kzw.entity.User;
import com.kzw.service.CheckAttenceService;
import com.kzw.utils.Msg;

/**
 * 
 * @author kzw
 *
 */
@Controller
public class CheckAttenceController {

	
		@Autowired
		private CheckAttenceService cas;
	
		/**
		 * 上班打卡
		 * @param request
		 * @return
		 * @throws ParseException
		 */
	 	@RequestMapping(value ="/startwork")
	    @ResponseBody
	    public Msg startWork(HttpServletRequest request) throws ParseException{
	       HttpSession session = request.getSession();
	       User user = (User) session.getAttribute("user");
	       if(user!=null){
	    	   Integer employeeid = user.getEmployeeid();
	    	   
	    	   int res = cas.insertStartWork(employeeid);
	    	   if (res >= 1){
	    		   if(res==2){
	    			   return Msg.fail().add("startwork_error", "您今天已经打过卡了！"); 
	    		   }else{
	    			   return Msg.fail().add("startwork_error", "上班打卡失败");
	    		   }
		            
		        }
	       }
	    	
	        return Msg.success();
	    }
	    
	 	/**
	 	 * 下班打卡
	 	 * @param request
	 	 * @return
	 	 * @throws ParseException
	 	 */
	 	@RequestMapping(value ="/endwork")
	    @ResponseBody
	    public Msg endWork(HttpServletRequest request) throws ParseException{
	       HttpSession session = request.getSession();
	       User user = (User) session.getAttribute("user");
	       if(user!=null){
	    	   Integer employeeid = user.getEmployeeid();
	    	   
	    	   int res = cas.endWork(employeeid);
	    	   if (res >= 1){
	    		   if(res==2){
	    			   return Msg.fail().add("startwork_error", "您今天已经打过下班卡了！"); 
	    		   }else{
	    			   return Msg.fail().add("startwork_error", "下班打卡失败");
	    		   }
		            
		        }
	       }
	    	
	        return Msg.success();
	    }
	
}
