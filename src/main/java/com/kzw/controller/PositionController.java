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
import com.kzw.entity.Position;
import com.kzw.service.EmployeeService;
import com.kzw.service.PositionService;
import com.kzw.utils.Msg;
/**
 * 
 * @author kzw
 *
 */
@Controller
public class PositionController {

	
	@Autowired
	private PositionService ps;
	@Autowired
	private EmployeeService es;
	
	@RequestMapping("/getposbydept")
	@ResponseBody
	public Msg getPosition(@RequestParam(value = "deptId") Integer deptId){
		List<Position> poslist = ps.getPosByDept(deptId);
		
		if(poslist!=null){
			return Msg.success().add("poslist", poslist);
		}
		
		return Msg.fail();
	}
	
	@RequestMapping("/getposList")
	public ModelAndView getEmp(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<Position> emps = ps.getAllPos();
        
        PageInfo page = new PageInfo(emps, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/position/posPage");
        return mv;

	}
	
	@RequestMapping(value = "/deletePosition/{delposId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deletePosition(@PathVariable("delposId") Integer delposId){
        int res = 0;
        
        List<Employee> empsByDeptId = es.getEmpsByPosId(delposId);
        if(empsByDeptId==null){
        	 res =ps.deleteByPosId(delposId);
        }else{
        	return Msg.fail().add("del_pos_error", "职位中有员工，无法删除该职位信息!");
        }
        if (res > 1){
            return Msg.fail().add("del_pos_error", "职位信息删除异常");
        }
        return Msg.success();
    }
	
	
	
	/**
     * 更改员工信息
     * @param empId
     * @param employee
     * @return
     */
    @RequestMapping(value ="/updatePos/{updatePosId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(@PathVariable("updatePosId") Integer updatePosId,HttpServletRequest request){
       String posName = request.getParameter("posName");
       Position positon = new Position();
       positon.setPositionId(updatePosId);
       positon.setPositionName(posName);
       int res = ps.updatePos(positon);
       if (res >= 1){
            return Msg.fail();
        }
        return Msg.success();
    }
    
    /**
     * 更改员工信息
     * @param empId
     * @param employee
     * @return
     */
    @RequestMapping(value ="/addPos/{adddeptId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg addPos(@PathVariable("adddeptId") Integer adddeptId,HttpServletRequest request){
       String posName = request.getParameter("addposName");
       Position positon = new Position();
       positon.setDeptId(adddeptId);
       positon.setPositionName(posName);
       positon.setCreatTime(new Date());
       int res = ps.insertPosition(positon);
       if (res >= 1){
            return Msg.fail();
        }
        return Msg.success();
    }
}
