package com.kzw.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.kzw.entity.Recruit;
import com.kzw.entity.Resume;
import com.kzw.entity.User;
import com.kzw.service.InterviewService;
import com.kzw.service.RecruitService;
import com.kzw.service.ResumeService;
import com.kzw.utils.Msg;
/**
 * @author kzw
 *
 */
@Controller
public class RecruitController {

	@Autowired
	private RecruitService rs;
	
	@Autowired
	private InterviewService is;
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping("/getRecList")
	public ModelAndView getEmp(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<Recruit> emps = rs.getAllRecruit();
        
        PageInfo page = new PageInfo(emps, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/recruit/recPage");
        return mv;

	}
	
	@RequestMapping(value="/getrecruit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getRecById(@PathVariable("id") Integer id){
		Recruit recruit = rs.getRecruitById(id);
		if(recruit!=null){
			return Msg.success().add("rec", recruit);
		}
		return Msg.fail();
	}
	
	
	@RequestMapping(value="/insertrecruit/{rid}")
	@ResponseBody
	public Msg insertrecruit(@PathVariable("rid") Integer rid,HttpServletRequest request){
		System.out.println(rid);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println("user"+user);
		if(user!=null){
			
			int uid = user.getId();//获取用户Id;
			Resume resume = resumeService.getResumeBuUId(uid);//通过用户获取简历信息
			if(resume!=null){
				int resumeId = resume.getResumeId();//获得简历Id
				is.insertInterview(uid,rid,resumeId);
				return Msg.success();
			}else{
				return Msg.fail().add("msg", "您还没有录入简历，请先录入简历信息");
			}
			
		}
		return Msg.fail().add("msg", "您还没有登录，请先进行登录");
		
	}
	
	
	@RequestMapping("/addRecruit")
	@ResponseBody
	public Msg save(HttpServletRequest request) throws Exception{
     String deptId = request.getParameter("deptid");
     String posid = request.getParameter("posid");
     String describe = request.getParameter("describe");
     String numbs = request.getParameter("numbs");
     String valuetime = request.getParameter("valuetime");

     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
     Date time = sdf.parse(valuetime);
     Recruit recruit = new Recruit();
     recruit.setDeptid(Integer.parseInt(deptId));
     recruit.setPositionid(Integer.parseInt(posid));
     recruit.setDescribes(describe);
     recruit.setNumbs(numbs);
     recruit.setValuetime(time);
     
      int i = rs.insert(recruit);
     
        if (i > 1){
            return Msg.fail().add("recruit_add_error", "招聘信息新增失败！");
        }
        return Msg.success();
	}
	
	
}
