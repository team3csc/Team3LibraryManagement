package com.team3.LMS.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.LMS.dto.Ticket;
import com.team3.LMS.service.TicketService;

@Controller
public class TicketController {

	@Autowired
	TicketService service;

	@RequestMapping(value = "/ticket/list", method = RequestMethod.GET)
	@ResponseBody
	public List<Ticket> getTicketList() {
		return service.getTicketList();
	}

	@RequestMapping(value = "/ticket/findAll", method = RequestMethod.GET)
	@ResponseBody
	public Page<Ticket> findAll(Pageable pageable) {
		Page<Ticket> tickets = service.findAll(pageable);
		return tickets;
	}

	@RequestMapping(value = "/ticket/add", method = RequestMethod.POST)
	public void addTicket(@RequestBody Ticket ticket) {
		service.addTicket(ticket);
	}
	
	@RequestMapping("/ticket/remove/{id}")
	public void removeTicket(@PathVariable int id) {
		service.removeTicket(id);
	}
	
	@RequestMapping(value = "/ticket/get/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Ticket getTicket(@PathVariable int id) {
		return service.getTicket(id);
	}
	
	@RequestMapping(value = "/ticket/quantity", method = RequestMethod.GET)	
	@ResponseBody
	public String getTicketQuantity(){
		return service.getTicketQuantity();
	}
}
