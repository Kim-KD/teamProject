package com.app.project.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.propertyeditors.PropertiesEditor;

public class AuthorityPropertyEditor extends PropertiesEditor {

	// ROLE_USER		{ROLE_USER}
	// ROLE_MANAGER		{ROLE_USER,ROLE_MANAGER}
	// ROLE_ADMIN		{ROLE_USER,ROLE_MANAGER,ROLE_ADMIN}
	
	@Override
	public void setAsText(String text)throws IllegalArgumentException {
		System.out.println();
		List<String> list = new ArrayList<>();
		
		if(text.equals("ROLE_USER")) {
			list.add("ROLE_USER");
		}
		else if(text.equals("ROLE_MANAGER")) {
			list.add("ROLE_USER");
			list.add("ROLE_MANAGER");
		}
		else if(text.equals("ROLE_ADMIN")) {
			list.add("ROLE_USER");
			list.add("ROLE_MANAGER");
			list.add("ROLE_ADMIN");
		}
		else {
			new IllegalArgumentException();
		}
		setValue(list);
	}
}
