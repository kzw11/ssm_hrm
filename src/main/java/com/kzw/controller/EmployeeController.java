package com.kzw.controller;

import java.util.List;

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
import com.kzw.entity.CheckAttence;
import com.kzw.entity.Dept;
import com.kzw.entity.Employee;
import com.kzw.entity.Interview;
import com.kzw.entity.Position;
import com.kzw.entity.RewardPunish;
import com.kzw.entity.Salary;
import com.kzw.entity.Train;
import com.kzw.entity.User;
import com.kzw.service.CheckAttenceService;
import com.kzw.service.DeptService;
import com.kzw.service.EmployeeService;
import com.kzw.service.InterviewService;
import com.kzw.service.PositionService;
import com.kzw.service.RewardAndPunService;
import com.kzw.service.SalaryService;
import com.kzw.service.TrainService;
import com.kzw.utils.Msg;
/**
 * 
 * @author kzw
 *
 */
@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService es;
	
	@Autowired
	private CheckAttenceService cs;
	
	@Autowired
	private PositionService ps;
	
	@Autowired
	private DeptService ds;
	
	@Autowired
	private TrainService ts;
	
	@Autowired
	private RewardAndPunService rs;
	
	@Autowired
	private SalaryService ss;
	
	@RequestMapping("/getEmp")
	@ResponseBody
	public Msg getEmpList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,Model model){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
        PageHelper.startPage(pageNo, 5);
        
        List<Employee> emps = es.getAllEmployee();
        
        PageInfo page = new PageInfo(emps, 5);

        
        return Msg.success().add("pageInfo", page);

	}
	
	/**
	 * 分页查询员工数据
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("/getEmpList")
	public ModelAndView getEmp(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<Employee> emps = es.getAllEmployee();
        
        PageInfo page = new PageInfo(emps, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/employee/employeePage");
        return mv;

	}
	
	@RequestMapping("/addEmp")
	@ResponseBody
	public Msg save(Employee emp){
		
		if(emp!=null){
			
			String empName = emp.getEmpName();
			Employee empByName = es.getEmpByName(empName);
			if(empByName==null){
				  es.save(emp);
				 return Msg.success();
			}else{
				return Msg.fail().add("addempMsg", "添加的员工名已存在！");
			}
		}
		
		return Msg.fail().add("addempMsg", "添加失败！");
	}
	
	
    @RequestMapping(value = "/deleteEmp/{empId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("empId") Integer empId){
        int res = 0;
        if (empId > 0){
            res = es.deleteEmpById(empId);
        }
        if (res > 1){
            return Msg.fail().add("emp_del_error", "员工删除异常");
        }
        return Msg.success();
    }

    
    @RequestMapping(value = "/getEmpById/{empId}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("empId") Integer empId){
        Employee employee = es.getEmpById(empId);
        if (employee != null){
            return Msg.success().add("employee", employee);
        }else {
            return Msg.fail();
        }

    }
    
    /**
     * 更改员工信息
     * @param empId
     * @param employee
     * @return
     */
    @RequestMapping(value ="/updateEmp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(@PathVariable("empId") Integer empId,  Employee employee){
       
    	int res = es.updateEmpById(employee);
        if (res >= 1){
            return Msg.fail().add("emp_update_error", "更改异常");
        }
        return Msg.success();
    }
    
    /**
     * 跳转到员工的主页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/toempindex")
	public String toEmpIndex(HttpServletRequest request,Model model){
    	
    	HttpSession session = request.getSession();
    	User user = (User) session.getAttribute("user");
    	if(user!=null){
    		Integer employeeid = user.getEmployeeid();
    		Employee employee = es.getEmpById(employeeid);
    		model.addAttribute("emp", employee);
    		List<CheckAttence> checklist = cs.getAllCheckAttenceByEmpId(employeeid);
    		
    		model.addAttribute("checklist", checklist);
    		
    		List<Dept> deptlist = ds.getAllDept();
    		model.addAttribute("deptlist", deptlist);
    		

    		List<Position> poslist = ps.getAllPos();
    		model.addAttribute("poslist", poslist);
    		
    		if(employee!=null){
    			Integer deptId = employee.getDeptId();
        		List<Employee> empsByDeptId = es.getEmpsByDeptId(deptId);
        		model.addAttribute("empbydeptid", empsByDeptId);
    		}
    	
    		
    		List<Train> allTrain = ts.getAllTrain();
    		model.addAttribute("alltrain", allTrain);
    		
    		List<RewardPunish> rplist = rs.getAllRewardPubishById(employeeid);
    		model.addAttribute("rplist", rplist);
    		
    		List<Salary> salarylist = ss.getAllSalaryByEmpId(employeeid);
    		model.addAttribute("salarylist", salarylist);
    	}
		return "empindex";
	}
	
}
