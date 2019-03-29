package com.kzw.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kzw.entity.Employee;
import com.kzw.entity.Notice;
import com.kzw.entity.User;
import com.kzw.service.NoticeService;
import com.kzw.utils.Msg;

/**
 * @author kzw
 *
 */
@Controller
public class NoticeController {

	
	@Autowired
	private NoticeService ns;
	
	@RequestMapping("/getNotice")
	public ModelAndView getAllNotice(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
		
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
	        
	        List<Notice> notice = ns.getAllNotice();
		 	
	        PageInfo page = new PageInfo(notice, 5);
	        mv.addObject("pageInfo", page);
	        mv.setViewName("jsp/notice/noticePage");
	        return mv;
	}
	
	
		@RequestMapping(value = "/delNotice/{delDeptId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public Msg deleteEmp(@PathVariable("delDeptId") Integer delDeptId){
	        int res = 0;
	        if (delDeptId > 0){
	            res = ns.deleteNoticeById(delDeptId);
	        }
	        if (res > 1){
	            return Msg.fail().add("emp_del_error", "通知删除异常");
	        }
	        return Msg.success();
	    }
	
		
		@RequestMapping("/addNotice")
		@ResponseBody
		public Msg save(HttpServletRequest request) throws Exception{
	     String title = request.getParameter("title");
	     String content = request.getParameter("content");
	     User user = (User) request.getSession().getAttribute("user");
	     
	     if(user!=null){
	    	 Notice notice = new Notice();
		     notice.setContent(content);
		     notice.setTitle(title);
		     notice.setCreatetime(new Date());
	    	 Integer uid = user.getId();
	    	 notice.setUserId(uid);
	    	 int i = ns.insertNotice(notice);
	    	 if(i<1){
	    		 return Msg.success();
	    	 }
	     }
	       
	        return Msg.fail();
		}
		
		 	@RequestMapping(value = "/getNoticeById/{noticeid}", method = RequestMethod.GET)
		    @ResponseBody
		    public Msg getEmpById(@PathVariable("noticeid") Integer noticeid){

		 		Notice notice = ns.getNoticeById(noticeid);
		        if (notice != null){
		            return Msg.success().add("notice", notice);
		        }else {
		            return Msg.fail();
		        }

		    }
		
		 	
		 	@RequestMapping(value ="/updateNotice/{noticeid}", method = RequestMethod.PUT)
		    @ResponseBody
		    public Msg updateEmp(@PathVariable("noticeid") Integer noticeid,  Notice notice){
		 		notice.setId(noticeid);
		 		notice.setCreatetime(new Date());
		    	int res =ns.updateNotice(notice);
		        if (res >= 1){
		            return Msg.fail().add("notice_update_error", "通知修改异常");
		        }
		        return Msg.success();
		    }
}
