package com.last.year.project.bl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.google.api.gbase.client.Location;
import com.last.year.project.bean.Atm;
import com.last.year.project.service.AdminService;

@Service
public class Algo {

	public Algo() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	AdminService service;
	private static final int earthRadius = 6371;
	public List<Atm> getNearest(double lat1,double lon1){
		
		List<Atm> list = service.getAllAtms();
		

		
		for(Atm atm: list)
		{
		
			double[] a= convertString(atm.getGeolocation());
			atm.setDistance(calculateDistance(lat1, lon1,a[0],a[1]));
			
			
		}
		
		
		Collections.sort(list, new CustomComparator());
	    list = new ArrayList<Atm>(list.subList(0, 5));
		
		
		
		
		return list;
		
		
	}
	
	public double calculateDistance(double e, double f, double g,
			double h) {
		double dLat = (double) Math.toRadians(g - e);
		double dLon = (double) Math.toRadians(h - f);
		double a = (double) (Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math
				.cos(Math.toRadians(e))
				* Math.cos(Math.toRadians(g))
				* Math.sin(dLon / 2) * Math.sin(dLon / 2));
		double c = (double) (2 * Math.atan2(Math.sqrt(a),
				Math.sqrt(1 - a)));
		double d = earthRadius * c;
		return d;
	}
	public double[] convertString(String str){
		
		double lat;
		double lon;
		  String strlat = str.substring(0, str.indexOf(','));
		  String strlon = str.substring(str.indexOf(',')+1,str.length());
		 
		  lat = Double.parseDouble(strlat);
		  lon = Double.parseDouble(strlon);
		  double[] result = new double[2];
		  result[0]=lat;
		  result[1]=lon;
		  
		  return result;
	}

	public List<Atm> getNearestByBank(double lat, double lon, int parseInt) {
List<Atm> list = service.getAllAtms();
		List<Atm> secondList =new ArrayList<Atm>();
		for(Atm atm:list){
			
			if(atm.getBank().getIdbank()==parseInt){
				secondList.add(atm);
			}
			
		}

		
		for(Atm atm: secondList)
		{
		
			double[] a= convertString(atm.getGeolocation());
			atm.setDistance(calculateDistance(lat, lon,a[0],a[1]));
			
			
		}
		
		
		Collections.sort(secondList, new CustomComparator());
	    list = new ArrayList<Atm>(secondList.subList(0, 5));
		
		
		
		
		return secondList;
	}

}
