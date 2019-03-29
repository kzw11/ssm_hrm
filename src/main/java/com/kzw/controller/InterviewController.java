package com.kzw.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kzw.entity.Employee;
import com.kzw.entity.Interview;
import com.kzw.entity.Recruit;
import com.kzw.entity.Salary;
import com.kzw.entity.User;
import com.kzw.service.EmployeeService;
import com.kzw.service.InterviewService;
import com.kzw.service.RecruitService;
import com.kzw.service.SalaryService;
import com.kzw.service.UserService;
import com.kzw.utils.Msg;
/**
 * @author kzw
 *
 */
@Controller
public class InterviewController {

	@Autowired
	private InterviewService is;
	
	@Autowired 
	private UserService us;
	
	@Autowired
	private RecruitService rs;
	
	@Autowired
	private EmployeeService es;
	
	@Autowired
	private SalaryService ss;
	
	@RequestMapping("/getInterList")
	public ModelAndView getEmp(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<Interview> emps =is.getAllInterview();
        
        PageInfo page = new PageInfo(emps, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/recruit/interViewPage");
        return mv;

	}
	
	
	@RequestMapping("/getInterviewNotice")
	@ResponseBody
	public Msg getInterViewByUId(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null){
			Integer id = user.getId();
			List<Interview> interlist = is.getInterviewByUId(id);
			return Msg.success().add("interlist", interlist);
		}
		
		return Msg.fail();
		
	}
	
	
	
	@RequestMapping(value = "/updateisinterview/{interviewid}", method = RequestMethod.GET)
    @ResponseBody
    public Msg updateInterview(@PathVariable("interviewid") Integer interviewid) throws Exception{
		is.updateInterview(interviewid);
		return Msg.success();
    }
	
	/**
	 * 录用以后更新一系列
	 * @param interviewId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateoffer/{interviewId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateInterviewOffer(@PathVariable("interviewId") Integer interviewId) throws Exception{
		
		Interview interview = is.getInterviewById(interviewId);
		
		Integer reid = interview.getReid();
		Integer uid = interview.getUid();
		User user = us.getUserById(uid);
		String username = user.getUsername();
		Recruit recruit = rs.getRecruitById(reid);
		Integer positionid = recruit.getPositionid();
		Integer deptid = recruit.getDeptid();
		Employee employee = new Employee();
		employee.setEmpName(username);
		employee.setDeptId(deptid);
		employee.setPositionId(positionid);
		employee.setStatus(0);
		es.save(employee);
		
		List<Employee> allEmployee = es.getAllEmployee();
		int empId=0;
		if(allEmployee!=null){
			Employee emp = allEmployee.get(allEmployee.size()-1);
			empId = emp.getEmpId();
		}
		Salary salary = new Salary();
		salary.setEmpId(empId);
		salary.setBase(4500.0);
		salary.setTime(new Date());
		salary.setSocialsec(800.0);
		salary.setIshandle(0);
		salary.setDisgree(0);
		salary.setRewardId(0);
		ss.insertSalary(salary);//赋予该员工基本工资
		
		User user2 = new User();
		user2.setId(uid);
		user2.setType(1);
		user2.setEmployeeid(empId);
		us.updateUser(user2);
		is.updateInterviewOffer(interviewId,empId);
		
		return Msg.success();
    }
	
	
	@RequestMapping(value = "/updatenotice", method = RequestMethod.POST)
    @ResponseBody
    public Msg getEmpById(HttpServletRequest request) throws Exception{
		String resumeid = request.getParameter("resumeid");
		String intertime = request.getParameter("intertime");
		 //SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX", Locale.ENGLISH);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		int reid = Integer.parseInt(resumeid);
		Date itime = sdf.parse(intertime);
		System.out.println(itime);
		//String string = sdf.format(itime).replace(" ","T");
		//System.out.println("转化后"+string);
		is.updateInterviewandtime(reid,itime);
		return Msg.success();
    }
}
