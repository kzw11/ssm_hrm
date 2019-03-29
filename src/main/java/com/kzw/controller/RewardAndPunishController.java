package com.kzw.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.kzw.entity.RewardPunish;
import com.kzw.service.RewardAndPunService;
import com.kzw.utils.Msg;

/**
 * @author kzw
 *
 */
@Controller
public class RewardAndPunishController {

	@Autowired
	private RewardAndPunService rps;
	
	/**
	 * 分页查询奖惩信息
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("/getRewardList")
	public ModelAndView getReward(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        //获取指定页数包含的员工信息
		ModelAndView mv = new ModelAndView("");
        PageHelper.startPage(pageNo, 5);
        
        List<RewardPunish> rewardlist = rps.getAllRewardPunish();
        
        PageInfo page = new PageInfo(rewardlist, 5);
        
        mv.addObject("pageInfo", page);
        mv.setViewName("jsp/reward/rewardPage");
        return mv;

	} 
	
	@RequestMapping(value = "/delReward/{rewardId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteReward(@PathVariable("rewardId") Integer rewardId){
        int res = 0;
        if (rewardId > 0){
            res = rps.deleteReward(rewardId);
        }
        if (res > 1){
            return Msg.fail().add("Reward_del_error", "该员工奖惩信息删除异常");
        }
        return Msg.success();
    }
	
	@RequestMapping(value ="/updateReward/{rewardid}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateReward(@PathVariable("rewardid") Integer rewardid,HttpServletRequest request) throws ParseException{
		String rewardId = request.getParameter("rewardid");
		String money = request.getParameter("money");
		String rewtime = request.getParameter("rewtime");
		String reas = request.getParameter("reas");
		
		RewardPunish reward = new RewardPunish();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		if(rewardId!=null&&money!=null){
			int rId = Integer.parseInt(rewardId);
			Date date = sdf.parse(rewtime);
			Double money2 = Double.parseDouble(money);
			reward.setId(rewardid);
			reward.setMoney(money2);
			reward.setReason(reas);
			reward.setTime(date);
		}
		
		int res =rps.updateReward(reward);
        if (res >= 1){
            return Msg.fail().add("reward_update_error", "奖惩信息修改异常");
        }
        return Msg.success();
    }
	
}
