package com.team3.LMS.service;

import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.team3.LMS.dao.TicketDao;
import com.team3.LMS.dto.Ticket;

@Service
public class TicketService {
	@Autowired
	private TicketDao ticketDao;

	public List<Ticket> getTicketList() {
		return (List<Ticket>) ticketDao.findAll();
	}

	public Page<Ticket> findAll(Pageable pageable) {
		return ticketDao.findAll(pageable);
	}

	public void addTicket(Ticket ticket) {
		ticketDao.save(ticket);
	}

	public void removeTicket(int id) {
		ticketDao.delete(id);
	}

	public Ticket getTicket(int id) {
		return ticketDao.findOne(id);
	}
		
	public String getTicketQuantity(){
//		List<Ticket> lst = (List<Ticket>) ticketDao.findAll();
//		Date borrowedDate = lst.get(0).getBorrowedDate();
//		Date today = new Date();
			
//		System.out.println(borrowedDate);
//		System.out.println(today);
//		System.out.println(borrowedDate.compareTo(today));
//		int limit = lst.get(0).getLimitionNumber();
//		int size = lst.size();		
		String dt2 = "{"
				+ "		\"chart\": {"
				+ "			\"xAxisName\": \"Month\","
				+ "			\"yAxisName\": \"Ticket Quantity\""
				+ "				},"
				+ "		\"data\":["
				+ "		{"
				+ "			\"label\": \"jan\","
				+ "			\"value\": \"500\""
				+ "		},"
				+ "		{"
				+ "			\"label\": \"jun\","
				+ "			\"value\": \"100\""
				+ "		}"
				+ "				]"
				+ "}";
		return  dt2;
	}
}
