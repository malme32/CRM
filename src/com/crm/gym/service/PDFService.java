package com.crm.gym.service;

import com.crm.gym.model.Contact;
import com.crm.gym.model.Program;

public interface PDFService {
		void createPDFIText();
	
		void createPDF();

		String createProgram(Contact contact, Program program, String realPath);
}	
