package com.repository;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.beans.GeneratorLog;
import com.beans.WorkReport;


public interface UsersRepository {
	
	 public List<GeneratorLog> getGeneratorLogs();

	public void save(Object obj);

	public List<WorkReport> getAllWorkReportDetails(String fromDate);

	public void update(WorkReport wr);
	
	public Long getNextSequenceId(String key);

}