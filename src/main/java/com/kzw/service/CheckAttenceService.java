package com.kzw.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.CheckAttenceMapper;
import com.kzw.dao.RewardPunishMapper;
import com.kzw.entity.CheckAttence;
import com.kzw.entity.CheckAttenceExample;
import com.kzw.entity.CheckAttenceExample.Criteria;
import com.kzw.entity.RewardPunish;

@Service
public class CheckAttenceService {

	@Autowired
	private CheckAttenceMapper checkMapper;
	@Autowired
	private RewardPunishMapper rpm;
	
	public List<CheckAttence> getAllCheckAttence(){
		
		List<CheckAttence> checklist = checkMapper.selectByExampleWithEmp(null);		
		if(checklist.size()!=0){
			return checklist;
		}
		return null;
	}
	
	/**
	 * 根据员工id得到所有考勤记录
	 * @param empId
	 * @return
	 */
	public List<CheckAttence> getAllCheckAttenceByEmpId(Integer empId){
		
		CheckAttenceExample example = new CheckAttenceExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdEqualTo(empId);		
		
		List<CheckAttence> checklist = checkMapper.selectByExample(example);
		
		if(checklist.size()!=0){
			return checklist;
		}
		
		return null;
	}
	
	/**
	 * 添加打卡记录
	 * @param empid
	 * @return
	 * @throws ParseException
	 */
	public int insertStartWork(Integer empid) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        String source = "9:00";//上班规定时间
        
        double h = 0;
        Date date = null;
        Date date1 = null;
        
        try {
            date = sdf.parse(source);//Thu Jan 01 09:00:00 CST 1970
            date1 = sdf.parse(sdf.format(new Date()));//Thu Jan 01 当前时间点 CST 1970
            h = (date1.getTime() - date.getTime()) / 1000 / 3600.0;

        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        CheckAttenceExample example = new CheckAttenceExample();
        Criteria criteria = example.createCriteria();
        criteria.andEmpIdEqualTo(empid);
        List<CheckAttence> checklist = checkMapper.selectByExample(example);
        if(checklist.size()!=0){
        	
        	CheckAttence checkAttence = null;
        	if(checklist.size()>1){
        		checkAttence = checklist.get(checklist.size()-1);
        	}else{
        		checkAttence = checklist.get(0);
        	}
        	
        	Date date2 = sdf1.parse(sdf1.format(checkAttence.getStarttime()));
            Date date3 = sdf1.parse(sdf1.format(new Date()));
            
            System.out.println(date2);
            System.out.println(date3);
            
            if (!date2.equals(date3)) {
            	CheckAttence cat = new CheckAttence();
                cat.setStarttime(new Date());
                if (0 < h && h <= 3) {
                    cat.setIslate(0);
                    cat.setIsabsent(0);
                    cat.setStatus("正常");
                } else if (h > 3) {
                	cat.setIslate(0);
                    cat.setStatus("旷工");
                }else{
                	cat.setIslate(0);
                    cat.setIsabsent(0);
                	cat.setStatus("正常");
                }
               cat.setEmpId(empid);
               int i = checkMapper.insertSelective(cat);
               return i;               
            }else{
            	return 2;
            }
	}
       
        CheckAttence cat = new CheckAttence();
        cat.setStarttime(new Date());
        if (0 < h && h <= 3) {
            cat.setIslate(0);
            cat.setIsabsent(0);
            cat.setStatus("正常");
        } else if (h > 3) {
        	cat.setIslate(1);
            cat.setStatus("旷工");
        }else{
        	cat.setIslate(0);
            cat.setIsabsent(0);
        	cat.setStatus("正常");
        }
       cat.setEmpId(empid);
       int i = checkMapper.insertSelective(cat);
       return i;     
	}

	/**
	 * 下班打卡
	 * @param employeeid
	 * @return
	 */
	public int endWork(Integer employeeid) {

			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
	        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	        String source = "17:00";//下班规定时间
	        double h = 0;
	        Date date = null;
	        Date date1 = null;
	        try {
	            date = sdf.parse(source);
	            date1 = sdf.parse(sdf.format(new Date()));
	            h = (date.getTime() - date1.getTime()) / 1000 / 3600.0;
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        
	        CheckAttenceExample example = new CheckAttenceExample();
	        Criteria criteria = example.createCriteria();
	        criteria.andEmpIdEqualTo(employeeid);
	        List<CheckAttence> checklist = checkMapper.selectByExample(example);  
	        if (checklist.size() != 0) {
	            CheckAttence cat = checklist.get(checklist.size() - 1);
	            if (cat.getStarttime() != null && cat.getEndtime() == null) {
	            	
	                RewardPunish reward = new RewardPunish();//考勤情况记录奖惩
	            	cat.setEndtime(new Date());
	                if (0 < h && h <= 3) {
	                    cat.setIslate(0);
	                    cat.setIsabsent(0);
	                    cat.setStatus("缺勤半天");
	                    reward.setMoney(-20.0);
	                    reward.setTime(new Date());
	                    reward.setReason("缺勤半天");
	                } else if (h > 3) {
	                	cat.setIslate(1);
	                    cat.setStatus("旷工");
	                    reward.setMoney(-50.0);
	                    reward.setTime(new Date());
	                    reward.setReason("无故缺勤");
	                }else{
	                	cat.setIslate(0);
	                    cat.setIsabsent(0);
	                	cat.setStatus("正常");
	                }
	                reward.setEmpId(employeeid);
	                cat.setEmpId(employeeid);
	                rpm.insertSelective(reward);
	                int i = checkMapper.updateByPrimaryKeySelective(cat);
	                return i;
	                
	            } else {
	                return 2;
	            }
	        }
	        
	        
		
		return 0;
	}
	
	
	
}
