package com.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.FindAndModifyOptions;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.CriteriaDefinition;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.beans.GeneratorLog;
import com.beans.SequenceId;
import com.beans.WorkReport;
import com.repository.UsersRepository;

import antlr.StringUtils;

@Repository
public class UserRepositoryImpl implements UsersRepository {

    @Autowired
    private MongoTemplate mongoTemplate;

	public List<GeneratorLog> getGeneratorLogs() {
		List<GeneratorLog> list = mongoTemplate.findAll(GeneratorLog.class, "generatorLog");		
		return list;
	}

	public void save(Object obj) {
		mongoTemplate.save(obj);		
	}

	@Override
	public List<WorkReport> getAllWorkReportDetails(String date) {
		 DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Calendar fromDate=Calendar.getInstance();
		Calendar toDate=Calendar.getInstance();
		if(org.apache.commons.lang.StringUtils.isNotBlank(date)) {
			try {
				Date fromDt=formatter.parse(date);
				
				fromDate.setTime(fromDt);
				fromDate.add(Calendar.HOUR,0);
				fromDate.add(Calendar.MINUTE,0);
				fromDate.add(Calendar.SECOND,0);
				toDate.setTime(fromDt);
				toDate.add(Calendar.HOUR,23);
				toDate.add(Calendar.MINUTE,59);
				toDate.add(Calendar.SECOND,59);
				
				Query query=new Query();				
				query.addCriteria(Criteria.where("createdDate").gte(fromDate.getTimeInMillis())
						.lte(toDate.getTimeInMillis()));
				List<WorkReport> workReportLst = mongoTemplate.find(query, WorkReport.class);
				System.out.println(query);
				return workReportLst;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return new ArrayList<WorkReport>();		
	}

	@Override
	public void update(WorkReport wr) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(wr.getId()));
		WorkReport wrOld = mongoTemplate.findOne(query, WorkReport.class);
		wrOld.setDate(wr.getDate());
		wrOld.setName(wr.getName());
		wrOld.setNotes(wr.getNotes());
		wrOld.setTime(wr.getTime());
		wrOld.setShift(wr.getShift());
		mongoTemplate.save(wrOld);				
	}

	@Override
	public Long getNextSequenceId(String key) {
		 //get sequence id
		  Query query = new Query(Criteria.where("_id").is(key));

		  //increase sequence id by 1
		  Update update = new Update();
		  update.inc("seq", 1);

		  //return new increased id
		  FindAndModifyOptions options = new FindAndModifyOptions();
		  options.returnNew(true);

		  //this is the magic happened.
		  SequenceId seqId = 
	            mongoTemplate.findAndModify(query, update, options, SequenceId.class);


		  return seqId.getSeq();

	}


	/*public List<GeneratorLog> getGeneratorLogs() {
		List<GeneratorLog> list = mongoTemplate.findAll(GeneratorLog.class, "generatorLog");		
		return list;
	}

	public void save(Object obj) {
		mongoTemplate.save(obj);
	}*/
}
