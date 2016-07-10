package cn.mutu.land.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.UDeptInfo;
import cn.mutu.land.model.URightInfo;
import cn.mutu.land.model.URoleInfo;
import cn.mutu.land.model.URoleRight;
import cn.mutu.land.model.UUserInfo;
import cn.mutu.land.model.UUserRole;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Service
public class SystemUserManagerService {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private HttpServletRequest request;

	// -----------------------------当前登录信息---------------------------
	// 当前登录用户
	public String getCurrentUser() {
		String userName = request.getUserPrincipal().getName();
		return userName;
	}

	// 当前用户权限（返回权限String）
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCurrentUserRight() {
		Map<String, Object> map = new TreeMap<String, Object>();
		try {
			// 当前系统登录用户
			String userName = request.getUserPrincipal().getName();
			if (userName == null || userName.equals("")) {
				throw new Exception("当前登录用户未找到。");
			} else {
				String sql = "select ri.right_name " + "from u_right_info ri "
						+ "where ri.right_id in" + "(SELECT rr.right_id "
						+ "from u_role_right rr " + "where rr.role_id = "
						+ "(SELECT ur.roleid " + "from u_user_role ur "
						+ "where ur.username = '" + userName + "'))";
				SQLQuery query = sessionFactory.getCurrentSession()
						.createSQLQuery(sql);
				List<Object> list = query.list();
				if (list.size() == 0 || list == null) {
					throw new Exception("当前用户无访问权限。");
				}

				Map<String, Object> tmap = new TreeMap<String, Object>();
				for (Object object : list) {
					tmap.put((String) object, true);
				}
				map.put("root", tmap);
				map.put("success", true);
			}
		} catch (Exception ex) {
			map.put("success", false);
		}
		return map;

	}

	// 当前用户权限（返回权限URightInfo）
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCurrentUserRightList(String roleId) {
		Map<String, Object> map = new TreeMap<String, Object>();
		try {
			// 当前系统登录用户
			
			if (roleId == null || roleId.equals("")) {
				throw new Exception("请输入角色编号。");
			} else {
				String sql = "select * from u_right_info ri "
						+ "where ri.right_id in" + "(SELECT rr.right_id "
						+ "from u_role_right rr " + "where rr.role_id ="+roleId+" )";
				SQLQuery query = sessionFactory.getCurrentSession()
						.createSQLQuery(sql);
				List<URightInfo> list = query.list();						
				map.put("root", list);
				map.put("success", true);
			}
		} catch (Exception ex) {
			map.put("root", null);
			map.put("success", false);
		}
		return map;

	}

	// -----------------------------用户信息userInfo---------------------------
	// 查询用户信息
	@SuppressWarnings("unchecked")
	public Map<String, Object> getUserInfoList(String searchKey) {
		String sql = "SELECT u.user_id,u.user_name,u.user_pwd,"
				+ " u.true_name,u.email,u.mobile_num,u.phone_num,"
				+ " d.dept_name AS dept_id,u.enabled,u.registerdate,u.description"
				+ " FROM u_user_info AS u" + " LEFT JOIN u_dept_info AS d"
				+ " ON u.dept_id = d.dept_id";
		if (!"".equals(searchKey)) {
			String hql2 = " WHERE u.user_name like '%" + searchKey + "%'"
					+ " or u.true_name like '%" + searchKey + "%'"
					+ " or u.description like '%" + searchKey + "%'";

			sql += hql2;
		}

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<Object[]> userList = query.list();

		List<Map<String, Object>> userMapList = new ArrayList<Map<String, Object>>();
		for (Object[] object : userList) {
			Map<String, Object> map = new TreeMap<String, Object>();
			map.put("userId", (int) object[0]);
			map.put("userName", (String) object[1]);
			map.put("userPwd", (String) object[2]);
			map.put("trueName", (String) object[3]);
			map.put("email", (String) object[4]);
			map.put("mobileNum", (String) object[5]);
			map.put("phoneNum", (String) object[6]);
			map.put("deptId", (String) object[7]);
			map.put("enabled", (Boolean) object[8]);
			map.put("registerdate", (Date) object[9]);
			map.put("description", (String) object[10]);
			userMapList.add(map);
		}

		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", userMapList);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 删除用户信息
	public void deleteUserInfoById(String userId) {
		UUserInfo result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (UUserInfo) session.get(UUserInfo.class,
					Integer.parseInt(userId));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 添加用户信息
	@SuppressWarnings("unchecked")
	public void addUserInfo(UUserInfo userInfo) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String pwd = userInfo.getUserPwd();
			String md5Pwd = makeMd5(pwd);
			userInfo.setUserPwd(md5Pwd);
			session.save(userInfo);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新用户信息
	public void updateOneUserInfo(UUserInfo userInfo) {
		try {
			// 使用hibernateSQL语句，执行部分修改
			String sql = "UPDATE u_user_info AS u SET u.user_name = '"
					+ userInfo.getUserName() + "'" + ",u.true_name = '"
					+ userInfo.getTrueName() + "'" + ",u.email = '"
					+ userInfo.getEmail() + "'" + ",u.mobile_num = '"
					+ userInfo.getMobileNum() + "'" + ",u.phone_num = '"
					+ userInfo.getPhoneNum() + "'" + ",u.description = '"
					+ userInfo.getDescription() + "'";

			// 处理enabled
			if (userInfo.getEnabled()) {
				sql += ",u.enabled = 1";
			} else {
				sql += ",u.enabled =0";
			}
			String pwd = userInfo.getUserPwd();
			if (!"".equals(pwd)) {
				// MD5加密
				String md5Pwd = makeMd5(pwd);
				sql += ",u.user_pwd = '" + md5Pwd + "'";
			}
			sql += " WHERE u.user_id = " + userInfo.getUserId();
			// session.beginTransaction();
			// org.hibernate.Query query = session.createQuery(hql);
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();
			// session.getTransaction().commit();

			// session.saveOrUpdate(userInfo);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// -----------------------------角色信息---------------------------
	// 查询角色信息
	@SuppressWarnings("unchecked")
	public Map<String, Object> getRoleInfoList(String searchKey, String enabled) {
		String hql = "FROM URoleInfo as r";
		if (!searchKey.equals("")) {
			String hql2 = " where r.roleName like '%" + searchKey + "%'"
					+ " or r.description like '%" + searchKey + "%'"
					+ " or r.roleNameCn like '%" + searchKey + "%'";
			if ("true".equals(enabled) || "1".equals(enabled)) {
				hql2 += " AND r.enabled = 1";
			}
			hql = hql + hql2;
		}
		List<URoleInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<URoleInfo>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 删除角色信息
	public void deleteRoleInfoById(String roleId) {
		URoleInfo result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (URoleInfo) session.get(URoleInfo.class,
					Integer.parseInt(roleId));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 添加角色信息
	@SuppressWarnings("unchecked")
	public Map<String, Object> addRoleInfo(URoleInfo roleInfo) {
		Session session = sessionFactory.getCurrentSession();
		Map<String, Object> roleInfoResults = new HashMap<String, Object>();
		try {
			session.save(roleInfo);
			roleInfoResults.put("success", true);
			roleInfoResults.put("msg", ",successfully saved");
		} catch (Exception er) {
			roleInfoResults.put("failure", true);
			roleInfoResults.put("msg", ",failure saved。");
			System.out.println(er.getMessage());
		}
		return roleInfoResults;

	}

	// 编辑更新角色信息
	public void updateOneRoleInfo(URoleInfo roleInfo) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(roleInfo);
	}

	// -----------------------------权限信息---------------------------
	// 查询权限信息
	@SuppressWarnings("unchecked")
	public Map<String, Object> getRightInfoList(String searchKey, String limit) {
		String hql = "FROM URightInfo as URightInfo";
		if (!searchKey.equals("")) {
			String hql2 = " where URightInfo.rightName like '%" + searchKey
					+ "%'" + " or URightInfo.description like '%" + searchKey
					+ "%'";
			hql = hql + hql2;
		}
		List<URightInfo> rightList = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		query.setMaxResults(Integer.parseInt(limit));
		rightList = (List<URightInfo>) query.list();

		// 利用空格形成层次结构
		List<URightInfo> rightRankList = new ArrayList<URightInfo>();
		Iterator<URightInfo> it = rightList.iterator();
		while (it.hasNext()) {
			URightInfo uri = it.next();
			int zeroIndex = uri.getRightId().indexOf("00"); // 得到00的位置
			String blankInsert = "";
			switch (zeroIndex) {
			case 2:
				blankInsert = "";
				break;
			case 4:
				blankInsert = "&nbsp;&nbsp;&nbsp;";
				break;
			case 6:
				blankInsert = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				break;
			case 8:
				blankInsert = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				break;
			case -1:
				blankInsert = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				break;
			}
			uri.setRightName(blankInsert + uri.getRightName());// 将空格插入在名称前面
			rightRankList.add(uri);
		}

		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", rightRankList);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 删除权限信息
	public void deleteRightInfoById(String rightId) {
		URightInfo result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			String pattern = "0000000000";
			DecimalFormat df = new DecimalFormat(pattern);
			result = (URightInfo) session.get(URightInfo.class,
					df.format(Integer.parseInt(rightId)));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 添加权限信息
	@SuppressWarnings("unchecked")
	public void addRightInfo(URightInfo rightInfo) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String rightIdParent = rightInfo.getRightId(); // 取得了上一级部门的id
			int firstNotZeroIndex = rightIdParent.indexOf("00");

			String parentRightCode = "";
			String hql = "";
			if (firstNotZeroIndex == 0) { // 则表明已经是最高层级
				String sql = " FROM UDeptInfo ";
				List<URightInfo> rightList = null;
				org.hibernate.Query tempQuery = sessionFactory
						.getCurrentSession().createQuery(sql);
				rightList = (List<URightInfo>) tempQuery.list();
				if (rightList.size() == 0) {
					// 整个部门表为空的情况
					rightInfo.setRightId("0100000000");
					session.save(rightInfo);
					return;
				} else {
					// 有其他顶级部门的情况
					parentRightCode = "00000000";
					hql = "FROM URightInfo as r where r.RightId like '%"
							+ parentRightCode + "'";
				}
			} else if (firstNotZeroIndex < 0) { // 为最后一级别的情况
				parentRightCode = rightIdParent.substring(0, 8);
				firstNotZeroIndex = 8;
				hql = "FROM URightInfo as r where r.rightId like '"
						+ parentRightCode + "%'";
			} else { // 中间的情况
				parentRightCode = rightIdParent.substring(0, firstNotZeroIndex);
				hql = "FROM URightInfo as r where r.rightId like '"
						+ parentRightCode + "%'";
			}

			List<URightInfo> results = null;
			org.hibernate.Query query = sessionFactory.getCurrentSession()
					.createQuery(hql);
			results = (List<URightInfo>) query.list();
			// System.out.println("results.size():" + results.size());
			List<Integer> childRightList = new ArrayList<Integer>();
			Iterator<URightInfo> it = results.iterator();
			while (it.hasNext()) {
				URightInfo udi = it.next();
				String childRightId = udi.getRightId();
				// System.out.println("childDeptId:" + childDeptId);
				if (childRightId.length() == 10) {
					String subStr = childRightId.substring(firstNotZeroIndex,
							firstNotZeroIndex + 2);
					// System.out.println("subStr:" + subStr);
					int childId = Integer.parseInt(subStr);
					if (childId >= 0) {
						childRightList.add(childId);
					}
				}
			}
			Collections.sort(childRightList); // 排序
			// 查找是否有空缺的id，有的话，就插入
			int indexToInsert = 0;
			int index = 0;
			for (; index < childRightList.size(); index++) {
				if (index + 1 < childRightList.size()) {
					if ((childRightList.get(index + 1) - childRightList
							.get(index)) > 1) {
						indexToInsert = childRightList.get(index) + 1;
					}
				}
			}
			// 如果没有空缺id，就顺序+1
			if (indexToInsert == 0) {
				indexToInsert = childRightList.get(index - 1) + 1;
			}
			String pattern = "00";
			DecimalFormat df = new DecimalFormat(pattern);
			String rightId = "";
			if ("00000000".equals(parentRightCode)) { // 为最高级别时
				rightId = df.format(indexToInsert) + parentRightCode;
			} else {
				rightId = parentRightCode + df.format(indexToInsert);
			}
			int zeroLeft = 10 - parentRightCode.length() - 2;
			if (10 - parentRightCode.length() - 2 > 0) {
				for (int zeroIndex = 0; zeroIndex < zeroLeft; zeroIndex++) {
					rightId += '0';
				}
			}
			// System.out.println("rightId" + rightId);
			rightInfo.setRightId(rightId);
			session.save(rightInfo);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新权限信息
	public void updateOneRightInfo(URightInfo rightInfo) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(rightInfo);
		// System.out.println("updateOneDraft: "+infoArticle.getArticlePublishtime());
	}

	// -----------------------------角色权限设置---------------------------
	// 查询角色权限信息
	@SuppressWarnings("unchecked")
	public Map<String, Object> getRoleRightList(String roleId) {
		String hql = "FROM URoleRight where roleId = " + roleId;

		List<URoleRight> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<URoleRight>) query.list();
		// System.out.println("date:"+results.get(0).getLoginTime());//输出时间
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 删除角色权限信息
	public void deleteRoleRightById(String roleId) {
		// System.out.println("roleId:" + roleId);
		URoleRight result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			String pattern = "0000000000";
			DecimalFormat df = new DecimalFormat(pattern);
			result = (URoleRight) session.get(URoleRight.class,
					df.format(Integer.parseInt(roleId)));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 添加角色权限信息
	@SuppressWarnings("unchecked")
	public void addRoleRight(String roleId, String[] rightIds) {
		Session session = sessionFactory.getCurrentSession();

		try {
			for (int i = 0; i < rightIds.length; i++) {
				URoleRight rr = new URoleRight();
				rr.setRoleId(roleId);
				rr.setRightId(rightIds[i]);
				session.save(rr);
			}
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新角色权限信息
	public void updateOneRoleRight(URoleRight uRoleRight) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(uRoleRight);
	}

	// -----------------------------部门信息---------------------------
	// 查询部门信息
	@SuppressWarnings("unchecked")
	public Map<String, Object> getDeptInfoList(String searchKey) {
		String hql = "FROM UDeptInfo as d";
		if (!"".equals(searchKey)) {
			String hql2 = " where d.deptName like '%" + searchKey + "%'"
					+ " or d.description like '%" + searchKey + "%'";
			hql = hql + hql2;
		}
		List<UDeptInfo> deptList = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		deptList = (List<UDeptInfo>) query.list();
		List<UDeptInfo> resultList = new ArrayList<UDeptInfo>();
		// 利用空格形成层次结构
		// List<Integer> childDeptList = new ArrayList<Integer>();
		Iterator<UDeptInfo> it = deptList.iterator();
		while (it.hasNext()) {
			UDeptInfo udi = it.next();
			int zeroIndex = udi.getDeptId().indexOf("00"); // 得到00的位置
			String blankInsert = "";
			switch (zeroIndex) {
			case 2:
				blankInsert = "";
				break;
			case 4:
				blankInsert = "&nbsp;&nbsp;&nbsp;";
				break;
			case 6:
				blankInsert = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				break;
			case 8:
				blankInsert = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				break;
			case -1:
				blankInsert = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				break;
			}
			udi.setDeptName(blankInsert + udi.getDeptName());// 将空格插入在名称前面
			resultList.add(udi);
		}
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", resultList);
		myMapResult.put("success", true);

		return myMapResult;
	}

	// 查询部门信息
	@SuppressWarnings("unchecked")
	public String getDeptInfoTree(HttpServletResponse response) {
		String hql = "FROM UDeptInfo as UDeptInfo";
		List<UDeptInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<UDeptInfo>) query.list();
		// System.out.println("deptInfoResult:"+results);
		if (results.size() == 0) {
			return null;
		}
		// 先根据id进行排序
		Comparator<UDeptInfo> comparator = new Comparator<UDeptInfo>() {
			public int compare(UDeptInfo u1, UDeptInfo u2) {
				int code1 = Integer.parseInt(u1.getDeptId());
				int code2 = Integer.parseInt(u2.getDeptId());
				return (code1 - code2);
			}
		};
		Collections.sort(results, comparator);// 排序

		int index = 0;
		Map<String, Object> mapJson = new TreeMap<String, Object>();
		UDeptInfo dept = results.get(index);
		mapJson.put("id", index); // 序号，保持唯一
		mapJson.put("deptId", dept.getDeptId()); // 部门编号
		mapJson.put("deptName", dept.getDeptName()); // 部门名称
		mapJson.put("enabled", dept.getEnabled().toString()); // 是否启用
		mapJson.put("description", dept.getDescription()); // 描述

		testMapJson(results, index, mapJson); // 测试json

		Gson gson = new GsonBuilder().enableComplexMapKeySerialization()
				.create();
		String jsonStr = gson.toJson(mapJson);
		return jsonStr;
	}

	public int createJsonFromList(List<UDeptInfo> deptList, int index,
			Map<String, Object> mapJson) {
		UDeptInfo preDept = deptList.get(index);
		// 如果超出deptList的大小，则终止
		if (deptList.size() < ++index) {
			return index;
		}
		UDeptInfo dept = deptList.get(index); // 取得下一个dept
		int preDoubleZeroIndex = preDept.getDeptId().indexOf("00"); // 取得第一个00的index，即取得部门等级
		int doubleZeroIndex = dept.getDeptId().indexOf("00"); // 同上取得部门等级
		int deptGrade = doubleZeroIndex - preDoubleZeroIndex; // 部门等级之差，判断上下级关系
		if (deptGrade > 0) {
			Map<String, Object> map = new TreeMap<String, Object>();
			map.put("id", index); // 序号，保持唯一
			map.put("deptId", dept.getDeptId());
			map.put("deptName", dept.getDeptName().toString());
			map.put("enabled", dept.getEnabled().toString());
			map.put("description", dept.getDescription().toString());
			mapJson.put("children", map);
			createJsonFromList(deptList, index, map);
		} else if (deptGrade == 0) {

		}

		return index;
	}

	// 测试json
	public void testMapJson(List<UDeptInfo> deptList, int index,
			Map<String, Object> mapJson) {
		Map<String, Object> map = new TreeMap<String, Object>();
		UDeptInfo dept = deptList.get(index);
		mapJson.put("id", index); // 序号，保持唯一
		mapJson.put("deptId", dept.getDeptId()); // 部门编号
		mapJson.put("deptName", dept.getDeptName()); // 部门名称
		mapJson.put("enabled", dept.getEnabled().toString()); // 是否启用
		mapJson.put("description", dept.getDescription()); // 描述

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// children1
		index++;
		Map<String, Object> mapChildren1 = new TreeMap<String, Object>();
		UDeptInfo dept1 = deptList.get(index);
		mapChildren1.put("id", index); // 序号，保持唯一
		mapChildren1.put("deptId", dept1.getDeptId()); // 部门编号
		mapChildren1.put("deptName", dept1.getDeptName()); // 部门名称
		mapChildren1.put("enabled", dept1.getEnabled().toString()); // 是否启用
		mapChildren1.put("description", dept1.getDescription()); // 描述
		list.add(mapChildren1);
		// children2
		index++;
		Map<String, Object> mapChildren2 = new TreeMap<String, Object>();
		UDeptInfo dept2 = deptList.get(index);
		mapChildren2.put("id", index); // 序号，保持唯一
		mapChildren2.put("deptId", dept2.getDeptId()); // 部门编号
		mapChildren2.put("deptName", dept2.getDeptName()); // 部门名称
		mapChildren2.put("enabled", dept2.getEnabled().toString()); // 是否启用
		mapChildren2.put("description", dept2.getDescription()); // 描述
		list.add(mapChildren2);
		mapJson.put("children", list);
	}

	// 删除部门信息
	public void deleteDeptInfoById(String deptId) {
		// System.out.println("deptId:" + deptId);
		UDeptInfo result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			String pattern = "0000000000";
			DecimalFormat df = new DecimalFormat(pattern);
			result = (UDeptInfo) session.get(UDeptInfo.class,
					df.format(Integer.parseInt(deptId)));
			session.delete(result);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 添加部门信息
	@SuppressWarnings("unchecked")
	public void addDeptInfo(UDeptInfo deptInfo) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String deptIdParent = deptInfo.getDeptId(); // 取得了上一级部门的id
			int firstNotZeroIndex = deptIdParent.indexOf("00");

			String parentDeptCode = "";
			String hql = "";
			if (firstNotZeroIndex == 0) { // 则表明已经是最高层级
				String sql = " FROM UDeptInfo ";
				List<UDeptInfo> deptList = null;
				org.hibernate.Query tempQuery = sessionFactory
						.getCurrentSession().createQuery(sql);
				deptList = (List<UDeptInfo>) tempQuery.list();
				if (deptList.size() == 0) {
					// 整个部门表为空的情况
					deptInfo.setDeptId("0100000000");
					session.save(deptInfo);
					return;
				} else {
					// 有其他顶级部门的情况
					parentDeptCode = "00000000";
					hql = "FROM UDeptInfo as UDeptInfo where UDeptInfo.deptId like '%"
							+ parentDeptCode + "'";
				}
			} else if (firstNotZeroIndex < 0) { // 为最后一级别的情况
				parentDeptCode = deptIdParent.substring(0, 8);
				firstNotZeroIndex = 8;
				hql = "FROM UDeptInfo as UDeptInfo where UDeptInfo.deptId like '"
						+ parentDeptCode + "%'";
			} else { // 中间的情况
				parentDeptCode = deptIdParent.substring(0, firstNotZeroIndex);
				hql = "FROM UDeptInfo as UDeptInfo where UDeptInfo.deptId like '"
						+ parentDeptCode + "%'";
			}

			List<UDeptInfo> results = null;
			org.hibernate.Query query = sessionFactory.getCurrentSession()
					.createQuery(hql);
			results = (List<UDeptInfo>) query.list();
			// System.out.println("results.size():" + results.size());
			List<Integer> childDeptList = new ArrayList<Integer>();
			Iterator<UDeptInfo> it = results.iterator();
			while (it.hasNext()) {
				UDeptInfo udi = it.next();
				String childDeptId = udi.getDeptId();
				// System.out.println("childDeptId:" + childDeptId);
				if (childDeptId.length() == 10) {
					String subStr = childDeptId.substring(firstNotZeroIndex,
							firstNotZeroIndex + 2);
					// System.out.println("subStr:" + subStr);
					int childId = Integer.parseInt(subStr);
					if (childId >= 0) {
						childDeptList.add(childId);
					}
				}
			}
			Collections.sort(childDeptList); // 排序
			// 查找是否有空缺的id，有的话，就插入
			int indexToInsert = 0;
			int index = 0;
			for (; index < childDeptList.size(); index++) {
				if (index + 1 < childDeptList.size()) {
					if ((childDeptList.get(index + 1) - childDeptList
							.get(index)) > 1) {
						indexToInsert = childDeptList.get(index) + 1;
					}
				}
			}
			// 如果没有空缺id，就顺序+1
			if (indexToInsert == 0) {
				indexToInsert = childDeptList.get(index - 1) + 1;
			}
			String pattern = "00";
			DecimalFormat df = new DecimalFormat(pattern);
			String deptId = "";
			if ("00000000".equals(parentDeptCode)) { // 为最高级别时
				deptId = df.format(indexToInsert) + parentDeptCode;
			} else {
				deptId = parentDeptCode + df.format(indexToInsert);
			}
			int zeroLeft = 10 - parentDeptCode.length() - 2;
			if (10 - parentDeptCode.length() - 2 > 0) {
				for (int zeroIndex = 0; zeroIndex < zeroLeft; zeroIndex++) {
					deptId += '0';
				}
			}
			deptInfo.setDeptId(deptId);
			session.save(deptInfo);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新部门信息
	public void updateOneDeptInfo(UDeptInfo deptInfo) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(deptInfo);
	}

	public Map<String, Object> getMapFromCodeId(List<UDeptInfo> deptList) {
		if (deptList.size() == 0) {
			return null;
		}
		Map<String, Object> map = new TreeMap<String, Object>();
		// 先根据id进行排序
		Comparator<UDeptInfo> comparator = new Comparator<UDeptInfo>() {
			public int compare(UDeptInfo u1, UDeptInfo u2) {
				int code1 = Integer.parseInt(u1.getDeptId());
				int code2 = Integer.parseInt(u2.getDeptId());
				return (code1 - code2);
			}
		};
		Collections.sort(deptList, comparator);// 排序
		UDeptInfo dept1 = deptList.get(0); // 取得第一个dept
		map.put("deptId", dept1.getDeptId());
		map.put("deptName", dept1.getDeptName());
		map.put("enabled", dept1.getEnabled());
		map.put("description", dept1.getDescription());
		return map;
	}

	public Map<String, Object> setMap(List<UDeptInfo> deptList,
			UDeptInfo preDept, UDeptInfo dept) {
		Map<String, Object> map = new TreeMap<String, Object>();
		map.put("deptId", dept.getDeptId());
		map.put("deptName", dept.getDeptName());
		map.put("enabled", dept.getEnabled());
		map.put("description", dept.getDescription());
		int diffIndex = getStrDiffIndex(preDept.getDeptId(), dept.getDeptId());
		if (diffIndex > 0) {

		}
		return map;
	}

	public int getStrDiffIndex(String s1, String s2) {
		int flag = -1;
		if (s1.length() != s2.length()) {
			return flag;
		}
		char[] ch1 = s1.toCharArray();
		char[] ch2 = s2.toCharArray();

		for (int index = 0; index < s1.length(); index++) {
			if (ch1[index] != ch2[index]) {
				flag = index;
			}
		}
		return flag;
	}

	// -----------------------------用户角色设置---------------------------
	// 查询角色权限信息
	@SuppressWarnings("unchecked")
	public Map<String, Object> getUserRoleList(String username) {
		String hql = "FROM UUserRole as ur";
		if (!"".equals(username)) {
			String hql2 = " where ur.username like '%" + username + "%'";

			hql = hql + hql2;
		}
		// System.out.println(hql);
		List<UUserRole> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<UUserRole>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 添加角色权限信息
	@SuppressWarnings("unchecked")
	public void updateUserRole(String username, int roleId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			UUserRole ur = new UUserRole();
			ur.setId(null);
			ur.setUsername(username);
			ur.setRoleid(roleId);
			session.saveOrUpdate(ur);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// -----------------------------一些公用函数------------------------------
	@SuppressWarnings("unused")
	private static String makeMd5(String password)
			throws NoSuchAlgorithmException {
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		// String password = "wodemima";
		byte[] bytes = md5.digest(password.getBytes());
		String result = "";
		for (byte b : bytes) {
			String temp = Integer.toHexString(b & 0xff);
			if (temp.length() == 1) {
				temp = "0" + temp;
			}
			result = result + temp;
		}
		return result;
	}

}
