package com.kzw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kzw.entity.Resume;
import com.kzw.entity.User;
import com.kzw.service.ResumeService;
import com.kzw.utils.Msg;

/**
 * @author kzw
 *
 */
@Controller
public class ResumeController {

	@Autowired
	private ResumeService rs;
	
	
	@RequestMapping("/addResume")
	@ResponseBody
	public Msg addResume(Resume resume,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null){
			resume.setUserid(user.getId());
			resume.setDeptId(0);
			resume.setPositonId(0);
			System.out.println(resume);
			int i = rs.insert(resume);
			if(i>1){
				return Msg.fail();
			}
			return Msg.success();
		}
		return Msg.fail().add("msg", "您还没有登录，请先去登录在进行！");
		
	}
	
	
	
	@RequestMapping("/lookresume")
	public String getResumeByUserId(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null){
			Integer id = user.getId();
			Resume resume = rs.getResumeBuUId(id);
			if(resume!=null){
				model.addAttribute("resume", resume);
			}
		}
		
		return "resumeinfo";
	}
	
	
	
	@RequestMapping(value ="/updateResume", method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateResume(Resume resume,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null){
			Integer id = user.getId();
			//int i = rs.updateResume(resume, id);
			System.out.println("resumeid="+resume.getResumeId());
			int i = rs.updateResumeByPrimaryKey(resume);
			System.out.println(i);
			if(i>1){
				return Msg.fail();
			}
		}
		
		return Msg.success();
	}
}
