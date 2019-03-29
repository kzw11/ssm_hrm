package com.kzw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kzw.entity.Recruit;
import com.kzw.service.RecruitService;
/**
 * @author kzw
 *
 */
@Controller
public class IndexController {

	@Autowired
	private RecruitService rs;
	
	@RequestMapping("/adminindex")
	public String Index(){
		return "jsp/main";
	}
	
	//写招聘信息的分页
	@RequestMapping("/index")
	public ModelAndView toIndex(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){		
		ModelAndView mv = new ModelAndView("");
		//设置页码和每页显示数量
        PageHelper.startPage(pageNo, 5);        
		//查询所有招聘信息
		List<Recruit> allRecruit = rs.getAllRecruit();		
		//封装成为PageInfo对象
        PageInfo page = new PageInfo(allRecruit, 5);
        //将page对象加到ModelAndView中
        mv.addObject("pageInfo", page);
        mv.setViewName("index");
        return mv;
	}
	
	@RequestMapping("/tologin")
	public String Login(){
		return "login";
	}
	
	
	@RequestMapping("/toregister")
	public String toRegister(){
		return "register";
	}
	
	@RequestMapping("/toResume")
	public String addResume(){
		return "addResume";
	}
	
	
	@RequestMapping("/toobjectionSalary")
	public String toobjectionSalary(){
		return "jsp/objectionSalary";
	}
	
}
