package cn.mutu.land.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.common.Encoder;
import cn.mutu.land.model.UDeptInfo;
import cn.mutu.land.model.URightInfo;
import cn.mutu.land.model.URoleInfo;
import cn.mutu.land.model.URoleRight;
import cn.mutu.land.model.UUserInfo;
import cn.mutu.land.service.SystemUserManagerService;

@Controller
public class SystemUserManagerController {
	private SystemUserManagerService systemUserManagerService;

	@Autowired
	public SystemUserManagerController(SystemUserManagerService systemUserManagerService) {
		this.systemUserManagerService = systemUserManagerService;
	}
	
	// ----------------------------------部门信息-------------------------------
		// 查询部门信息
		@RequestMapping(value = "/get_DeptInfo")
		// ,method=RequestMethod.POST
		@ResponseBody
		public Map<String, Object> getDeptInfo(
				@RequestParam("searchKeyword") String searchKeyword)
				throws IOException {
			System.out.println("get_DeptInfo : " + searchKeyword);
			searchKeyword = Encoder.encode(searchKeyword);
			// this.userManagerService.addUser(user);
			return this.systemUserManagerService.getDeptInfoList(searchKeyword);
		}

		// 查询部门信息Tree
		@RequestMapping(value = "/get_DeptInfoTree", produces = "text/html;charset=UTF-8")
		// @RequestMapping(value="/Home/writeJson", method=RequestMethod.GET,
		// produces = "text/html;charset=UTF-8")
		// ,method=RequestMethod.POST
		@ResponseBody
		public String getDeptInfoTree(HttpServletResponse response)
				throws IOException {
			return this.systemUserManagerService.getDeptInfoTree(response);
		}

		// 删除部门信息
		@RequestMapping(value = "/del_DeptInfoById")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void deldeptInfoById(@RequestParam("deptId") String deptId)
				throws IOException {
			this.systemUserManagerService.deleteDeptInfoById(deptId);
		}

		// 添加部门信息
		@RequestMapping(value = "/add_DeptInfo", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> addDeptInfo(@RequestBody UDeptInfo deptInfo)
				throws IOException {
			// System.out.println("addDeptInfo :"+deptInfo);
			this.systemUserManagerService.addDeptInfo(deptInfo);
			Map<String, Object> deptInfoResults = new HashMap<String, Object>();
			deptInfoResults.put("success", true);
			deptInfoResults.put("msg", ",successfully saved");
			return (deptInfoResults);
		}

		// 修改部门信息
		@RequestMapping(value = "/update_DeptInfo", method = RequestMethod.POST)
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void updateDeptInfo(@RequestBody UDeptInfo deptInfo)
				throws IOException {
			System.out.println("update_deptInfo: " + deptInfo.getDeptName());
			this.systemUserManagerService.updateOneDeptInfo(deptInfo);
		}

		// ----------------------------------用户信息UserInfo-------------------------------
		// 查询用户信息
		@RequestMapping(value = "/get_UserInfo")
		// ,method=RequestMethod.POST
		@ResponseBody
		public Map<String, Object> getUserInfo(
				@RequestParam("searchKeyword") String searchKeyword)
				throws IOException {
			System.out.println("searchKeyword : " + searchKeyword);
			searchKeyword = Encoder.encode(searchKeyword);
			// this.systemUserManagerService.addUser(user);
			return this.systemUserManagerService.getUserInfoList(searchKeyword);
		}

		// 删除用户信息
		@RequestMapping(value = "/del_UserInfoById")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void delUserInfoById(@RequestParam("userId") String userId)
				throws IOException {

			this.systemUserManagerService.deleteUserInfoById(userId);
		}

		// 添加用户信息
		@RequestMapping(value = "/add_UserInfo")
		@ResponseBody
		public Map<String, Object> addUserInfo(@RequestBody UUserInfo userInfo)
				throws IOException {
			// System.out.println("addUserInfo :"+userInfo);
			this.systemUserManagerService.addUserInfo(userInfo);
			Map<String, Object> userInfoResults = new HashMap<String, Object>();
			userInfoResults.put("success", true);
			userInfoResults.put("msg", ",successfully saved");
			return (userInfoResults);
		}

		// 修改用户信息
		@RequestMapping(value = "/update_UserInfo")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void updateUserInfo(@RequestBody UUserInfo userInfo)
				throws IOException {
			System.out.println("update_userInfo: " + userInfo.getUserId());
			this.systemUserManagerService.updateOneUserInfo(userInfo);
		}

		// ----------------------------------权限信息-------------------------------
		// 查询权限信息
		@RequestMapping(value = "/get_RightInfo")
		// ,method=RequestMethod.POST
		@ResponseBody
		public Map<String, Object> getRightInfo(
				@RequestParam("searchKeyword") String searchKeyword,
				@RequestParam("limit") String limit) throws IOException {
			System.out.println("searchKeyword : " + searchKeyword);
			searchKeyword = Encoder.encode(searchKeyword);
			// this.systemUserManagerService.addUser(user);
			return this.systemUserManagerService.getRightInfoList(searchKeyword, limit);
		}

		// 删除权限信息
		@RequestMapping(value = "/del_RightInfoById")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void delRightInfoById(@RequestParam("rightId") String rightId)
				throws IOException {
			this.systemUserManagerService.deleteRightInfoById(rightId);
		}

		// 添加权限信息
		@RequestMapping(value = "/add_RightInfo")
		@ResponseBody
		public Map<String, Object> addRightInfo(@RequestBody URightInfo rightInfo)
				throws IOException {
			// System.out.println("addRightInfo :"+rightInfo);
			this.systemUserManagerService.addRightInfo(rightInfo);
			Map<String, Object> rightInfoResults = new HashMap<String, Object>();
			rightInfoResults.put("success", true);
			rightInfoResults.put("msg", ",successfully saved");
			return (rightInfoResults);
		}

		// 修改权限信息
		@RequestMapping(value = "/update_RightInfo")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void updateRightInfo(@RequestBody URightInfo rightInfo)
				throws IOException {
			System.out.println("update_rightInfo: " + rightInfo.getRightName());
			this.systemUserManagerService.updateOneRightInfo(rightInfo);
		}

		// ----------------------------------角色信息-------------------------------
		// 查询角色信息
		@RequestMapping(value = "/get_RoleInfo")
		// ,method=RequestMethod.POST
		@ResponseBody
		public Map<String, Object> getRoleInfo(
				@RequestParam("searchKeyword") String searchKeyword,
				@RequestParam("enabled") String enabled)
				throws IOException {		
			searchKeyword = Encoder.encode(searchKeyword);
			System.out.println("searchKeyword : " + searchKeyword);
			// this.systemUserManagerService.addUser(user);
			return this.systemUserManagerService.getRoleInfoList(searchKeyword,enabled);
		}

		// 删除角色信息
		@RequestMapping(value = "/del_RoleInfoById")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void delRoleInfoById(@RequestParam("roleId") String roleId)
				throws IOException {
			this.systemUserManagerService.deleteRoleInfoById(roleId);
		}

		// 添加角色信息
		@RequestMapping(value = "/add_RoleInfo")
		@ResponseBody
		public Map<String, Object> addRoleInfo(@RequestBody URoleInfo roleInfo)
				throws IOException {
			System.out.println("addRoleInfo :"+roleInfo);		
			return this.systemUserManagerService.addRoleInfo(roleInfo);
		}

		// 修改角色信息
		@RequestMapping(value = "/update_RoleInfo")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void updateRoleInfo(@RequestBody URoleInfo roleInfo)
				throws IOException {
			// System.out.println("update_roleInfo: " + roleInfo.getRoleName());
			this.systemUserManagerService.updateOneRoleInfo(roleInfo);
		}

		// ----------------------------------用户角色设置-------------------------------
		// 查询用户角色信息
		@RequestMapping(value = "/get_UserRoleList")
		// ,method=RequestMethod.POST
		@ResponseBody
		public Map<String, Object> getUserRoleList(
				@RequestParam("username") String username)
				throws IOException {
			return this.systemUserManagerService.getUserRoleList(username);
		}

		// 添加用户角色信息
		@RequestMapping(value = "/update_UserRole")
		@ResponseBody
		public Map<String, Object> updateUserRole(
				@RequestParam("username") String username,
				@RequestParam("userRole") String[] userRole) throws IOException {
			// System.out.println("addRoleRight :"+roleRight);
			this.systemUserManagerService.updateUserRole(username, userRole);
			Map<String, Object> roleRightResults = new HashMap<String, Object>();
			roleRightResults.put("success", true);
			roleRightResults.put("msg", ",successfully saved");
			return (roleRightResults);
		}

		// ----------------------------------角色权限信息-------------------------------
		// 查询角色权限信息
		@RequestMapping(value = "/get_RoleRight")
		// ,method=RequestMethod.POST
		@ResponseBody
		public Map<String, Object> getRoleRight(
				@RequestParam("searchKeyword") String searchKeyword)
				throws IOException {
			System.out.println("searchKeyword : " + searchKeyword);
			searchKeyword = Encoder.encode(searchKeyword);
			// this.systemUserManagerService.addUser(user);
			return this.systemUserManagerService.getRoleRightList(searchKeyword);
		}

		// 删除角色权限信息
		@RequestMapping(value = "/del_RoleRightById")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void delRoleRightById(@RequestParam("roleId") String roleId)
				throws IOException {
			this.systemUserManagerService.deleteRoleRightById(roleId);
		}

		// 添加角色权限信息
		@RequestMapping(value = "/add_RoleRight")
		@ResponseBody
		public Map<String, Object> addRoleRight(@RequestBody URoleRight roleRight)
				throws IOException {
			// System.out.println("addRoleRight :"+roleRight);
			this.systemUserManagerService.addRoleRight(roleRight);
			Map<String, Object> roleRightResults = new HashMap<String, Object>();
			roleRightResults.put("success", true);
			roleRightResults.put("msg", ",successfully saved");
			return (roleRightResults);
		}

		// 修改角色权限信息
		@RequestMapping(value = "/update_RoleRight")
		// ,method=RequestMethod.POST)
		@ResponseBody
		public void updateRoleRight(@RequestBody URoleRight roleRight)
				throws IOException {
			System.out.println("update_roleRight: " + roleRight.getRightId());
			this.systemUserManagerService.updateOneRoleRight(roleRight);
		}

}
