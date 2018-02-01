package com.crm.gym.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.stream.Stream;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import org.xhtmlrenderer.pdf.ITextRenderer;
import org.xhtmlrenderer.resource.XMLResource;

import com.crm.gym.model.Contact;
import com.crm.gym.model.Program;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


@Service("pDFService")
@Transactional
public class PDFServiceImpl implements PDFService {

	@Override
	public void createPDF() {
		// TODO Auto-generated method stub
		// if you have html source in hand, use it to generate document object
		
		URL yahoo;	
		String inputLine="EMPTY";
		try {
			yahoo = new URL("http://localhost:8084/CRM/admin#!/admincategories");		
			
			BufferedReader in = new BufferedReader(
		            new InputStreamReader(
		            yahoo.openStream()));

	

		while ((inputLine = in.readLine()) != null)
		    System.out.println(inputLine);

		in.close();
		
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		System.out.println(inputLine);
	//	String yourXhtmlContentAsString = "<h1>XAXAXAXA</h1>";
		org.w3c.dom.Document document = XMLResource.load( new ByteArrayInputStream( inputLine.getBytes() ) ).getDocument();

		ITextRenderer renderer = new ITextRenderer();
		renderer.setDocument( document, null );

		renderer.layout();

		String fileNameWithPath = "c://PDF-XhtmlRendered.pdf";//outputFileFolder + 
		FileOutputStream fos;
		try {
			fos = new FileOutputStream( fileNameWithPath );
			renderer.createPDF( fos );
			fos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println( "File 1: '" + fileNameWithPath + "' created." );
	}

	@Override
	public void createPDFIText() {
		// TODO Auto-generated method stub
		Document document = new Document();
		try {
			PdfWriter.getInstance(document, new FileOutputStream("c://PDF-XhtmlRendered1.pdf"));
			 
			document.open();
			Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
			Chunk chunk = new Chunk("Hello World", font);
			 
			document.add(chunk);
			document.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	private void addTableHeader(PdfPTable table) {
	    Stream.of("column header 1", "column header 2", "column header 3")
	      .forEach(columnTitle -> {
	        PdfPCell header = new PdfPCell();
	        header.setBorder(0);
	        header.setHorizontalAlignment(Element.ALIGN_CENTER);
	        header.setBackgroundColor(BaseColor.LIGHT_GRAY);
	        header.setBorderWidth(2);
	        header.setPhrase(new Phrase(columnTitle));
	        table.addCell(header);
	    });
	}
	
	private void addRows(PdfPTable table) {
		/*PdfPCell 
	    table.addCell("row 1, col 1");
	    table.addCell("row 1, col 2");
	    table.addCell("row 1, col 3");*/
	}
	
	private void addCustomRows(PdfPTable table) 
			  	throws URISyntaxException, BadElementException, IOException {
				PdfPCell horizontalAlignCell4 = new PdfPCell(new Phrase("row 2, col 1"));
				
	    		horizontalAlignCell4.setHorizontalAlignment(Element.ALIGN_CENTER);
				horizontalAlignCell4.setBorder(0);
	    		table.addCell(horizontalAlignCell4);
			 
			    PdfPCell horizontalAlignCell = new PdfPCell(new Phrase("row 2, col 2"));
			    horizontalAlignCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			    horizontalAlignCell.setBorder(0);
			    table.addCell(horizontalAlignCell);
			 
			    PdfPCell verticalAlignCell = new PdfPCell(new Phrase("row 2, col 3"));
			    verticalAlignCell.setVerticalAlignment(Element.ALIGN_BOTTOM);
			    verticalAlignCell.setBorder(0);
			    table.addCell(verticalAlignCell);
			}
	
	
	@Override
	public void createProgram(Contact contact, Program program) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Document document = new Document();
		try {
			PdfWriter.getInstance(document, new FileOutputStream("c://PDF-XhtmlRendered1.pdf"));
			 
			document.open();
			Font font = FontFactory.getFont(FontFactory.HELVETICA, 16, BaseColor.BLACK);
			Chunk chunk = new Chunk(contact.getName()+"\n", font);
			 
			document.add(chunk);
			chunk = new Chunk(program.getDatestart().toString(), font);
			document.add(chunk);
			
			PdfPTable table = new PdfPTable(3);
			//table.getDefaultCell().setBorder(0);
			addTableHeader(table);
			addRows(table);
			addCustomRows(table);
			 
			document.add(table);

			chunk = new Chunk(program.getComment(), font);
			document.add(chunk);
			
			document.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
