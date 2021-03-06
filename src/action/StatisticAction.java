package action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;

import logic.logicInterface.IStatisticService;

public class StatisticAction extends ActionSupport implements RequestAware{
	private IStatisticService statisticService;
	
	private String diagramJson;
	private Map<String, Object> request;

	
	public String getBusinessStatistic(){
		return SUCCESS;
	}
	
	public String getUserStatistic(){
		return SUCCESS;
	}
	
	
	public String makeForecast(){
		int peopleNextMonth = statisticService.getPeopleInNextMonth();
		
		String hotTag = statisticService.getHotTag();
		
		request.put("peopleInNextMonth", peopleNextMonth);
		request.put("hotTag", hotTag);
		
		return SUCCESS;
	}
	
	public String doJson(){
		diagramJson="lala";
		return SUCCESS;
	}
	
	public String getDiagramJson(){
		return diagramJson;
	}
	
	
	public IStatisticService getStatisticService() {
		return statisticService;
	}

	public void setStatisticService(IStatisticService statisticService) {
		this.statisticService = statisticService;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}
