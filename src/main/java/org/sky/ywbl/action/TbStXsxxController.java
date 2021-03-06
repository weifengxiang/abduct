package org.sky.ywbl.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sky.log.SysControllerLog;
import org.sky.sys.action.BaseController;
import org.sky.sys.exception.ServiceException;
import org.sky.ywbl.model.TbStTxxx;
import org.sky.ywbl.model.TbStXsxx;
import org.sky.ywbl.model.TbStXsxxExample;
import org.sky.ywbl.service.ComService;
import org.sky.ywbl.service.TbStXsxxService;
import org.sky.sys.utils.BspUtils;
import org.sky.sys.utils.JsonUtils;
import org.sky.sys.utils.Page;
import org.sky.sys.utils.PageListData;
import org.sky.sys.utils.ResultData;
import org.sky.sys.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
/**
 * 
 * @ClassName:  TbStXsxxController   
 * @Description:TODO(线索管理控制层)   
 * @author: weifx 
 * @date:   2018年4月13日 下午3:05:33   
 * @version V1.0    
 * @Copyright: 2018 XXX. All rights reserved.
 */
@Controller
public class TbStXsxxController extends BaseController{
	@Autowired
	private TbStXsxxService tbstxsxxService;
	@Autowired
	private ComService comService;
	
	public TbStXsxxController() {
		// TODO Auto-generated constructor stub
	}
	/**
	*显示线索信息列表页面
	**/
	@SysControllerLog(desc = "显示线索信息列表页面")
	@RequestMapping(value = "/ywbl/TbStXsxx/initTbStXsxxListPage", method = { RequestMethod.GET })
	public String initTbStXsxxListPage(
			HttpServletRequest request, HttpServletResponse response) {
		return "jsp/ywbl/xsgl/listtbstxsxx";
	}
	/**
	 * 线索信息分页查询
	 * @param request
	 * @param response
	 * @return
	 */
	@SysControllerLog(desc = "线索信息分页查询")
	@RequestMapping(value = "/ywbl/TbStXsxx/getTbStXsxxByPage", method =RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public @ResponseBody String getTbStXsxxByPage(
			HttpServletRequest request, 
			HttpServletResponse response){
		String filter = request.getParameter("filter");
		Map filterMap = JsonUtils.json2map(filter);
		String sortfield=request.getParameter("sortfield");
		Page p= super.getPage(request);
		TbStXsxxExample pote= new TbStXsxxExample();
		if(null!=filterMap){
			pote.createCriteria();
			pote.integratedQuery(filterMap);
		}
		if(!StringUtils.isNull(sortfield)){
			pote.setOrderByClause(sortfield);
		}
		pote.setPage(p);
		PageListData pageData = tbstxsxxService.getTbStXsxxByPage(pote);
		return JsonUtils.obj2json(pageData);
	}
	/**
	*显示线索信息新增页面
	**/
	@SysControllerLog(desc = "显示线索信息新增页面")
	@RequestMapping(value = "/ywbl/TbStXsxx/initAddTbStXsxxPage", method = { RequestMethod.GET })
	public ModelAndView initAddTbStXsxxPage(
			HttpServletRequest request, HttpServletResponse response) {
		String xsbh = comService.getYwbh("X", BspUtils.getLoginUser().getCode(),BspUtils.getLoginUser().getOrganCode());
		ModelAndView mv = new ModelAndView();
		mv.addObject("xsbh", xsbh);
		mv.setViewName("jsp/ywbl/xsgl/edittbstxsxx");
		return mv;
	}
	/**
	*显示线索信息修改页面
	**/
	@SysControllerLog(desc = "显示线索信息修改页面")
	@RequestMapping(value = "/ywbl/TbStXsxx/initEditTbStXsxxPage", method = { RequestMethod.GET })
	public String initEditTbStXsxxPage(
			HttpServletRequest request, HttpServletResponse response) {
		return "jsp/ywbl/xsgl/edittbstxsxx";
	}
	/**
	*显示线索信息详细页面
	**/
	@SysControllerLog(desc = "显示线索信息详细页面")
	@RequestMapping(value = "/ywbl/TbStXsxx/initDetailTbStXsxxPage", method = { RequestMethod.GET })
	public String initDetailTbStXsxxPage(
			HttpServletRequest request, HttpServletResponse response) {
		return "jsp/ywbl/xsgl/detailtbstxsxx";
	}
	/**
	*保存新增/修改线索信息
	**/
	@SysControllerLog(desc = "保存新增/修改线索信息")
	@RequestMapping(value = "/ywbl/TbStXsxx/saveAddEditTbStXsxx", method =RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public @ResponseBody String saveAddEditTbStXsxx(
			HttpServletRequest request, 
			HttpServletResponse response){
		ResultData rd= new ResultData();
		try {
			String data = request.getParameter("data");
			List<TbStTxxx> txList=null;
			if(!StringUtils.isNull(data)) {
				txList = JsonUtils.json2list(data,TbStTxxx.class);
			}
			TbStXsxx edit = (TbStXsxx) getEntityBean(request,TbStXsxx.class);
			tbstxsxxService.saveAddEditTbStXsxx(edit,txList);
			rd.setCode(ResultData.code_success);
			rd.setName("保存成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			rd.setCode(ResultData.code_error);
			rd.setName("保存失败<br>"+e.getMessage());
		}
		return JsonUtils.obj2json(rd);
	}
	/**
	*删除线索信息
	**/
	@SysControllerLog(desc = "删除线索信息")
	@RequestMapping(value = "/ywbl/TbStXsxx/delTbStXsxx", method =RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public @ResponseBody String delTbStXsxx(
			HttpServletRequest request, 
			HttpServletResponse response){
		ResultData rd= new ResultData();
		try {
			String delRows=request.getParameter("delRows");
			List de=JsonUtils.json2list(delRows, TbStXsxx.class);
			tbstxsxxService.delTbStXsxxById(de);
			rd.setCode(ResultData.code_success);
			rd.setName("删除成功");
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			rd.setCode(ResultData.code_error);
			rd.setName("删除失败<br>"+e.getMessage());
		}
		return JsonUtils.obj2json(rd);
	}
	/**
	*根据主键查询线索信息
	**/
	@SysControllerLog(desc = "根据主键查询线索信息")
	@RequestMapping(value = "/ywbl/TbStXsxx/getTbStXsxxById", method =RequestMethod.GET,produces = "application/json;charset=UTF-8")
	public @ResponseBody String getTbStXsxxById(
			HttpServletRequest request, 
			HttpServletResponse response){
		String id = request.getParameter("id");
		TbStXsxx bean = tbstxsxxService.getTbStXsxxById(id);
		return JsonUtils.obj2json(bean);
	}
	@SysControllerLog(desc = "根据线索编号查询线索信息")
	@RequestMapping(value = "/ywbl/TbStXsxx/getTbStXsxxByXsbh", method =RequestMethod.GET,produces = "application/json;charset=UTF-8")
	public @ResponseBody String getTbStXsxxByXsbh(
			HttpServletRequest request, 
			HttpServletResponse response){
		String xsbh = request.getParameter("xsbh");
		TbStXsxx bean = tbstxsxxService.getTbStXsxxByXsbh(xsbh);
		return JsonUtils.obj2json(bean);
	}
}