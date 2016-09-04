package cn.mutu.land.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;









import cn.mutu.land.common.Encoder;
import cn.mutu.land.model.BusinessInfo;
import cn.mutu.land.model.BusinessMap;
import cn.mutu.land.model.LawRegulation;
import cn.mutu.land.model.LawTypes;
import cn.mutu.land.model.TaskInfo;
import cn.mutu.land.model.ZdInfo;
import cn.mutu.land.service.BusinessInfoManagerService;
import cn.mutu.land.service.BusinessMapManagerService;
import cn.mutu.land.service.TaskInfoManagerService;

@Controller
public class TaskInfoManagerController {

	private TaskInfoManagerService infoService;

	@Autowired
	public TaskInfoManagerController(TaskInfoManagerService infoService) {
		this.infoService = infoService;
	}

	// --------------------获取任务列表-------------------------
	// 查询
	@RequestMapping(value = "/get_task")
	@ResponseBody
	public Map<String, Object> getInfoList(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.infoService.getTaskInfoList(searchKeyword);
		//,@RequestParam("guyt")String gysj
	}
	// 下发任务
		@RequestMapping(value = "/add_task",method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> addTask(@RequestBody TaskInfo taskInfo)
				throws IOException {		

			Map<String, Object> result = new HashMap<String, Object>();
			try {			     	
				this.infoService.addTask(taskInfo);
				result.put("success", true);
				result.put("msg", ",successfully saved");
			} catch (Exception er) {
				er.printStackTrace();
				result.put("failure", true);
				result.put("msg", ",failed saved");
			}
			return result;
		}
}
