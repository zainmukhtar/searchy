package com.last.year.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.last.year.project.bean.Admin;
import com.last.year.project.bean.Atm;
import com.last.year.project.bean.Bank;
import com.last.year.project.bean.Loging;
import com.last.year.project.dao.AbstractHibernateDAO;
import com.last.year.project.dao.GenericHibernateDAO;

@Transactional
@Service
public class AdminService {

	public AdminService() {
		// TODO Auto-generated constructor stub
	}

	AbstractHibernateDAO<Admin> dao;

	@Autowired
	public void setDao(final GenericHibernateDAO<Admin> userDao) {
		dao = userDao;
		dao.setClazz(Admin.class);
	}
	
	AbstractHibernateDAO<Bank> bankDao;

	@Autowired
	public void setBankDao(final GenericHibernateDAO<Bank> userDao) {
		bankDao = userDao;
		bankDao.setClazz(Bank.class);
	}
	
	AbstractHibernateDAO<Atm> atmDao;

	@Autowired
	public void setAtmDao(final GenericHibernateDAO<Atm> atm) {
		atmDao = atm;
		atmDao.setClazz(Atm.class);
	}
	
	public void addBank(Bank bank)
	{
		bankDao.save(bank);
	}
	public List<Bank> getAllBanks()
	{
		return bankDao.findAll();
	}
	
	public void addAtm(Atm atm)
	{
		atmDao.save(atm);
	}
	public List<Atm> getAllAtms()
	{
		return atmDao.findAll();
	}
	
	AbstractHibernateDAO<Loging> logDao;

	@Autowired
	public void setLogDao(final GenericHibernateDAO<Loging> loging) {
		logDao = loging;
		logDao.setClazz(Loging.class);
	}
	public void addlog(Loging entity){
		logDao.save(entity);
	}
	public List<Loging> getlogs(){
		return logDao.findAll();
	}

}
