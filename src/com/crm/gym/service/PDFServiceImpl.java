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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.xhtmlrenderer.pdf.ITextRenderer;
import org.xhtmlrenderer.resource.XMLResource;

import com.crm.gym.model.Category;
import com.crm.gym.model.Contact;
import com.crm.gym.model.Entry;
import com.crm.gym.model.Program;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;


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
	private PdfPCell getCell(String text, int alignment, Font font) {
	    PdfPCell cell = new PdfPCell(new Phrase(text,font));
	    //cell.setPadding(0);
	    cell.setHorizontalAlignment(alignment);
	    cell.setBorder(PdfPCell.NO_BORDER);
	    return cell;
	}

	private List<Entry> getDayCategoryEntries(Program program,String day, Category category){
		
		List<Entry> entries =new ArrayList<Entry>();
		for(Entry entry:program.getEntries())
		{
			if(entry.getDay().equals(day)&&entry.getExercise().getCategory().getId()==category.getId())
				entries.add(entry);
		}
		return entries;
	}
	private List<Category> getDayCategories(Program program,String day){
		
		List<Category> cat =new ArrayList<Category>();
		for(Entry entry:program.getEntries())
		{
			if(day.equals(entry.getDay()))
				if(!cat.contains(entry.getExercise().getCategory()))
					cat.add(entry.getExercise().getCategory());
		}
		//Collections.sort(cat);
		return cat;
	}
	
	private List<String> getDays(Program program){
		
		List<String> days =new ArrayList<String>();
		for(Entry entry:program.getEntries())
		{
			if(!days.contains(entry.getDay()))
				days.add(entry.getDay());
		}
		Collections.sort(days);
		return days;
	}
	@Override
	public String createProgram(Contact contact, Program program, String realPath) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Hibernate.initialize(program.getEntries());
		Document document = new Document();
		try {
			PdfWriter.getInstance(document, new FileOutputStream(realPath+"/files/pdf/program.pdf"));
			 
			document.open();
				BaseFont fonty = BaseFont.createFont(realPath+"/resources/fonts/ClearSans-Light.ttf", BaseFont.IDENTITY_H,       BaseFont.NOT_EMBEDDED);
				Font times = new Font(fonty, 9, Font.NORMAL);
				Font daysFont = new Font(fonty, 12, Font.BOLD);
				daysFont.setColor(BaseColor.WHITE);
				Font categFont = new Font(fonty, 9, Font.BOLD);
				Font nameFont = new Font(fonty, 9, Font.ITALIC);
				Font setFont = new Font(fonty, 8, Font.ITALIC);
				Font commentFont = new Font(fonty, 9, Font.UNDERLINE);
			//Font font = FontFactory.getFont(FontFactory.HELVETICA, 16, BaseColor.RED);

		   // Paragraph name=new Paragraph(contact.getName(),times);
		  //  document.add(p);
		    DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		    String startDate = "";
		    String endDate ="";
		    if(program.getDatestart()!=null)
		    	startDate = df.format(program.getDatestart()).toString();
		    if(program.getDateend()!=null)
		    	endDate = df.format(program.getDateend()).toString();
		    
		   // document.add( Chunk.NEWLINE );
		 /*   p=new Paragraph(startDate+" - "+endDate,times);
		    document.add(p);    */
	        /*// add a couple of blank lines
	        document.add( Chunk.NEWLINE );
	        document.add( Chunk.NEWLINE );*/

/*			chunk = new Chunk(program.getDatestart().toString(), times);
			document.add(chunk);*/
		    
		    PdfPTable table = new PdfPTable(3);
		    table.setWidthPercentage(100);
		    table.addCell(getCell(contact.getName(), PdfPCell.ALIGN_LEFT,nameFont));
		    table.addCell(getCell("", PdfPCell.ALIGN_CENTER,nameFont));
		    String dateStr = "";
		    //dateStr = startDate;
		    if(!startDate.equals("")&&!endDate.equals(""))
		    	dateStr=startDate+" - "+endDate;
		    else
		    	if(!startDate.equals(""))
		    		dateStr=startDate;
		    	else	if(!endDate.equals(""))
		    		dateStr=endDate;
		    table.addCell(getCell(dateStr, PdfPCell.ALIGN_RIGHT,nameFont));
		    document.add(table);
		    LineSeparator objectName = new LineSeparator();              
		    document.add(objectName);
		    document.add(new Paragraph("\n"));
	
			for(String day:getDays(program))
			{
				// Chunk c = new Chunk(day, daysFont);
			//	 c.setBackground(BaseColor.RED);
				// Paragraph par=new Paragraph(c);
				// par.setAlignment(Element.ALIGN_CENTER);
				// document.add(par);
					 if(!day.equals(""))
					 {
	
						    PdfPTable tablex = new PdfPTable(1);
						    tablex.setWidthPercentage(90);
						    PdfPCell pdfCell= getCell(day, PdfPCell.ALIGN_CENTER,daysFont);
						    pdfCell.setBackgroundColor(BaseColor.LIGHT_GRAY);
						    pdfCell.setFixedHeight(16);
						    tablex.addCell(pdfCell);
						    document.add(tablex);
					 }
					for(Category cat:getDayCategories(program,day))
					{
						 	//Paragraph cater=new Paragraph(cat,categFont);
						 	//cater.setAlignment(Element.ALIGN_LEFT);
						 	//document.add(cater);

					    	//document.add( Chunk.NEWLINE );
							 PdfPTable table0 = new PdfPTable(2);
							 table0.setWidthPercentage(90);
							 table0.addCell(getCell(cat.getTitle().toUpperCase(), PdfPCell.ALIGN_LEFT,categFont));
							// table1.addCell(getCell("Σετ "+entry.getSets(), PdfPCell.ALIGN_CENTER,times));
							 table0.addCell(getCell("", PdfPCell.ALIGN_RIGHT,categFont));
							 document.add(table0);
							for(Entry entry:getDayCategoryEntries(program,day,cat))
							{
								
								 PdfPTable table1 = new PdfPTable(2);
								 table1.setWidthPercentage(90);
								 table1.addCell(getCell(entry.getExercise().getTitle(), PdfPCell.ALIGN_LEFT,times));
								// table1.addCell(getCell("Σετ "+entry.getSets(), PdfPCell.ALIGN_CENTER,times));
								 String sets="";
								 String repeats = "";
								 if(entry.getSets()!=0)
									 sets = "Σετ "+entry.getSets();

								 if(entry.getRepeats()!=0)
								 {
									 repeats = "Επαν "+entry.getRepeats();
									 if(!sets.equals(""))
										 repeats = "/"+repeats;
								 }
								 table1.addCell(getCell(sets+repeats, PdfPCell.ALIGN_RIGHT,setFont));
								 document.add(table1);
								 
							
							}
					}
					document.add(new Paragraph("\n"));
				 
				 
			}
		    
		    

		    
	/*		table = new PdfPTable(3);
			//table.getDefaultCell().setBorder(0);
			addTableHeader(table);
			addRows(table);
			addCustomRows(table);
			 
			document.add(table);*/
			if(program.getComment()!=null&&!program.getComment().equals(""))
			{

				 Paragraph parat=new Paragraph("ΠΑΡΑΤΗΡΗΣΕΙΣ",commentFont);
				 parat.setAlignment(Element.ALIGN_CENTER);
				 document.add(parat);/*
				 LineSeparator objectName1 = new LineSeparator();              
				 document.add(objectName1);*/
				 Paragraph comment=new Paragraph(program.getComment(),times);
				 comment.setAlignment(Element.ALIGN_CENTER);
				 document.add(comment);

			}
		/*	Chunk chunk = new Chunk(program.getComment(), times);
			document.add(chunk);*/
			
			document.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

		
		return "/files/pdf/program.pdf"; 
	}
	

}
