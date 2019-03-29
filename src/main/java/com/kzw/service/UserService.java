package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.UserMapper;
import com.kzw.entity.User;
import com.kzw.entity.UserExample;
import com.kzw.entity.UserExample.Criteria;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 通过用户名查找用户
	 * @param username
	 * @return
	 */
	public User findUserByName(String username) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> userlist = userMapper.selectByExample(example);
		if(userlist.size()>0){
			return userlist.get(0);
		}
		 //long count = userMapper.countByExample(example);
		 return null;
	}
	
	/**
	 *通过用户名和密码进行登录操作 
	 * @param username
	 * @param password
	 * @return
	 */
	public User findUserByNameAndPassword(String username, String password,int type) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		criteria.andTypeEqualTo(type);
		List<User> userlist = userMapper.selectByExample(example);
		if(userlist.size()>0){
			return userlist.get(0);
		}
		 return null;
	}
	
	public void regist(String username,String password){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmployeeid(0);
		user.setType(0);
		int insert = userMapper.insert(user);
	}
	
	public User getUserById(Integer uid){
		User user = userMapper.selectByPrimaryKey(uid);
		if(user!=null){
			return user;
		}
		return null;
	}

	public void updateUser(User user2) {
		userMapper.updateByPrimaryKeySelective(user2);
	}
	
}
