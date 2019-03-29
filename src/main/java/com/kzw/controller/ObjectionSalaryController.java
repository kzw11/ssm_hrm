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
import com.kzw.entity.ObjectionSalary;
import com.kzw.entity.RewardPunish;
import com.kzw.entity.User;
import com.kzw.service.ObjectionDisagreeSalaryService;
import com.kzw.service.RewardAndPunService;
import com.kzw.utils.Msg;
/**
 * 
 * @author kzw
 *
 */
@Controller
public class ObjectionSalaryController {

	@Autowired
	private ObjectionDisagreeSalaryService ods;
	@Autowired
	private RewardAndPunService raps;
	
	
	@RequestMapping("/addobjectionsalary")
	@ResponseBody
	public Msg addObjection(HttpServletRequest request){
		String content = request.getParameter("content");
		String money = request.getParameter("money");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user!=null){
			Integer employeeid = user.getEmployeeid();
			ObjectionSalary objs = new ObjectionSalary();
			objs.setEmpId(employeeid);
			objs.setErrcontent(content);
			objs.setMoney(Double.parseDouble(money));
			objs.setTime(new Date());
			objs.setReissueTime(null);
			objs.setIsexecute(0);
			ods.insert(objs);
			return Msg.success();
		}
		
		return Msg.fail();
	}
	
	
	/**
	 * 分页查询员工工资异议数据
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("/getObjSalaryList")
	public ModelAndView getobjSalary(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
     
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<ObjectionSalary> objectionSalarylist = ods.getAllObjectionSalary();	
        
        PageInfo page = new PageInfo(objectionSalarylist, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/reward/objSalary");
        return mv;

	}
	
	
	@RequestMapping(value = "/delobjSalary/{rewardId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteObjSalary(@PathVariable("rewardId") Integer rewardId){
        int res = 0;
        if (rewardId > 0){
            res = ods.deleteObjSalary(rewardId);
            if (res > 1){
                return Msg.fail();
            }
            return Msg.success();
        }
       return Msg.fail();
    }
	
	
	@RequestMapping(value ="/updateObjSalary/{rewardid}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateSalary(@PathVariable("rewardid") Integer rewardid,HttpServletRequest request) throws ParseException{
		String rewardId = request.getParameter("rewardid");
		String money = request.getParameter("money");
		String rewtime = request.getParameter("rewtime");
		String reas = request.getParameter("reas");
		
		ObjectionSalary objsalary = new ObjectionSalary();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		if(rewardId!=null&&money!=null){
			int rId = Integer.parseInt(rewardId);
			Date date = sdf.parse(rewtime);
			Double money2 = Double.parseDouble(money);
			ObjectionSalary salary = ods.getObjectionSalaryById(rId);
			if(salary!=null){
				Integer empId = salary.getEmpId();
				RewardPunish rwp = new RewardPunish();
				rwp.setEmpId(empId);
				rwp.setMoney(money2);
				rwp.setReason(reas);
				rwp.setTime(date);
				raps.insertReward(rwp);//插入一条奖惩信息
			}
			
			objsalary.setId(rewardid);
			objsalary.setMoney(money2);
			objsalary.setErrcontent(reas);
			objsalary.setTime(date);
			objsalary.setIsexecute(1);			
			objsalary.setReissueTime(new Date());
			ods.updateObjSalary(objsalary);
			return Msg.success();
		}
		
		return Msg.fail();
    }
	
	
}
