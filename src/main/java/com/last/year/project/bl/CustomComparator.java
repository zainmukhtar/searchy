package com.last.year.project.bl;

import java.util.Comparator;

import com.last.year.project.bean.Atm;


public class CustomComparator implements Comparator<Atm> {

	public int compare(Atm o1, Atm o2) {
		
		 
		return o1.getDistance().compareTo(o2.getDistance());
	}
	
	
}