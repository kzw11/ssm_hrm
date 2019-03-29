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
import com.kzw.entity.Dept;
import com.kzw.entity.Employee;
import com.kzw.service.DeptService;
import com.kzw.service.EmployeeService;
import com.kzw.utils.Msg;
/**
 * 
 * @author kzw
 *
 */
@Controller
public class DeptController {

	@Autowired
	private DeptService ds;
	
	@Autowired
	private EmployeeService es;
	
	@RequestMapping("/getDeptList")
	public ModelAndView getEmp(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<Dept> emps = ds.getAllDept();
        
        PageInfo page = new PageInfo(emps, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/dept/departmentPage");
        return mv;

	}
	
	@RequestMapping("/getDeptName")
	@ResponseBody
	public Msg getDept(){
		
		List<Dept> allDept = ds.getAllDept();
		if(allDept.size()>0){
			return Msg.success().add("departmentList", allDept);
		}
		return Msg.fail();
		
	}
	 
		@RequestMapping(value = "/delDept/{delDeptId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public Msg deleteEmp(@PathVariable("delDeptId") Integer delDeptId){
	        int res = 0;
	        
	        List<Employee> empsByDeptId = es.getEmpsByDeptId(delDeptId);
	        if(empsByDeptId==null){
	        	 res = ds.deleteDeptById(delDeptId);
	        }else{
	        	return Msg.fail().add("del_dept_error", "部门中有员工，无法删除部门信息!");
	        }
	        if (res > 1){
	            return Msg.fail().add("del_dept_error", "部门删除异常");
	        }
	        return Msg.success();
	    }
	
		
		/**
	     * 更改部门信息
	     * @param empId
	     * @param employee
	     * @return
	     */
	    @RequestMapping(value ="/updateDept/{edit_deptId}", method = RequestMethod.PUT)
	    @ResponseBody
	    public Msg updateDept(@PathVariable("edit_deptId") Integer edit_deptId, HttpServletRequest request){
	       String deptName = request.getParameter("deptName");
	       String empName = request.getParameter("deptLeader");
	       Employee employee = es.getEmpByName(empName);
	       if(employee!=null){
	    	   int empId = employee.getEmpId();
	    	   Dept dept = new Dept();
	    	   dept.setDeptId(edit_deptId);
	    	   dept.setCreatTime(new Date());
	    	   dept.setDeptName(deptName);
	    	   dept.setEmpId(empId);
	    	   ds.updateDept(dept);
	    	   return Msg.success();
	       }
	       return Msg.fail();
	      
	    }
	    
	

		/**
	     * 更改部门信息
	     * @param empId
	     * @param employee
	     * @return
	     */
	    @RequestMapping(value ="/addDept", method = RequestMethod.PUT)
	    @ResponseBody
	    public Msg addDept(HttpServletRequest request){
	       String deptName = request.getParameter("deptName");
	       String empName = request.getParameter("deptLeader");
	       Employee employee = es.getEmpByName(empName);
	       
	       Dept deptByName = ds.getDeptByName(deptName);
	       if(deptByName==null){
		       if(employee!=null){
		    	   int empId = employee.getEmpId();
		    	   Dept dept = new Dept();
		    	   dept.setCreatTime(new Date());
		    	   dept.setDeptName(deptName);
		    	   dept.setEmpId(empId);
		    	   ds.insert(dept);
		    	   return Msg.success();
		       }else{
		    	   return Msg.fail().add("dept_add_info", "无此员工！");
		       }
	       }else{
	    	   return Msg.fail().add("dept_add_info", "此部门已经存在！");
	       }
	       
	      
	    }
	    
	    
}
