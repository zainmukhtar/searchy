package com.last.year.project.bean;

import java.lang.reflect.Type;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class AtmAdapter implements JsonSerializer<Atm> {

	public AtmAdapter() {
		// TODO Auto-generated constructor stub
	}

	public JsonElement serialize(Atm atm, Type type,
			JsonSerializationContext jsc) {
		 JsonObject jsonObject = new JsonObject();
		    jsonObject.addProperty("id", atm.getIdAtm());
		    jsonObject.addProperty("name", atm.getAddress());
		    jsonObject.addProperty("location", atm.getGeolocation());
		    jsonObject.addProperty("company", atm.getCompany());
		    jsonObject.addProperty("bank", atm.getBank().getName());
		    return jsonObject;      
	}

}
