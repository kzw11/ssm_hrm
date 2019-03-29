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
import com.kzw.entity.EmpTrain;
import com.kzw.entity.Train;
import com.kzw.entity.User;
import com.kzw.service.TrainService;
import com.kzw.utils.Msg;

/**
 * @author kzw
 *
 */
@Controller
public class TrainController {

	@Autowired
	private TrainService ts;
	
	
	/**
	 * 分页查询员工数据
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("/gettrainList")
	public ModelAndView getEmp(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<Train> emps = ts.getAllTrain();
        
        PageInfo page = new PageInfo(emps, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/train/trainPage");
        return mv;

	}
	
	@RequestMapping("/addTrain")
	@ResponseBody
	public Msg save(HttpServletRequest request) throws ParseException{
		String content = request.getParameter("content");
    	String time = request.getParameter("time");
    	String deptId = request.getParameter("deptId");
    	String posId = request.getParameter("posId");
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    	if(time!=null&&deptId!=null&&posId!=null){
    		Date times = sdf.parse(time);
    		Integer deptid = Integer.parseInt(deptId);
    		int posid = Integer.parseInt(posId);
    		Train train = new Train();
    		train.setContent(content);
    		train.setDeptId(deptid);
    		train.setEmpId(posid);
    		train.setTime(times);
    		ts.insertTrain(train);
    		return Msg.success();
    	}
    		return Msg.fail();
	}

	
	 @RequestMapping(value = "/deleteTrain/{empId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public Msg deleteEmp(@PathVariable("empId") Integer empId){
	        int res = 0;
	        if (empId > 0){
	            res = ts.deleteTrainById(empId);
	        }
	        if (res > 1){
	            return Msg.fail().add("emp_del_error", "培训内容删除异常");
	        }
	        return Msg.success();
	    }

	
	 /**
	     * 更改培训信息
	     * @param empId
	     * @param employee
	     * @return
	 * @throws Exception 
	     */
	    @RequestMapping(value ="/updateTraininfo/{updatetrainId}", method = RequestMethod.PUT)
	    @ResponseBody
	    public Msg updateTrain(@PathVariable("updatetrainId") Integer updatetrainId,HttpServletRequest request) throws Exception{
	    	String content = request.getParameter("content");
	    	String time = request.getParameter("time");
	    	String deptId = request.getParameter("deptId");
	    	String posId = request.getParameter("posId");
	    	System.out.println(updatetrainId);
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	if(time!=null&&deptId!=null&&posId!=null){
	    		Date times = sdf.parse(time);
	    		Integer deptid = Integer.parseInt(deptId);
	    		int posid = Integer.parseInt(posId);
	    		Train train = new Train();
	    		train.setTrainId(updatetrainId);
	    		train.setContent(content);
	    		train.setDeptId(deptid);
	    		train.setEmpId(posid);
	    		train.setTime(times);
	    		int res = ts.updateTrain(train);
	    		if (res >= 1){
	 	            return Msg.fail().add("train_update_error", "更改异常");
	 	        }
	    		return Msg.success();
	    	}
	        return Msg.fail();
	    }
	 

	    	 /**
		     * 员工参加培训
		     * @return
		     * @throws Exception 
		     */
		    @RequestMapping(value ="/jointrain/{trainId}", method = RequestMethod.PUT)
		    @ResponseBody
		    public Msg joinEmpTrain(@PathVariable("trainId") Integer trainId,HttpServletRequest request) {
		    	HttpSession session = request.getSession();
		    	User user = (User) session.getAttribute("user");
		    	if(user!=null){
		    		EmpTrain et = new EmpTrain();
			    	et.setTrainId(trainId);
		    		et.setEmpId(user.getEmployeeid());
		    		ts.insertEmpTrain(et);
		    		return Msg.success();
		    	}
		    	return Msg.fail();
		    }
		 
}
