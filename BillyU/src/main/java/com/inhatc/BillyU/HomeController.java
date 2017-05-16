package com.inhatc.BillyU;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value="/Y_Main")
	public String Y_Main(){
		return "Y_Main";
	}
	@RequestMapping(value="/Y_Login")
	public String Y_Login(){
		return "Y_Login";
	}
	@RequestMapping(value="/K_view")
	public String K_view(){
		return "K_view";
	}
	@RequestMapping(value="/Y_All_Category")
	public String Y_All_Category(){
		return "Y_All_Category";
	}
	@RequestMapping(value="/Y_Submit_Product")
	public String Y_Submit_Product(){
		return "Y_Submit_Product";
	}
	@RequestMapping(value="/Y_Login_OK")
	public String Y_Login_OK(){
		return "Y_Login_OK";
	}
	@RequestMapping(value="/Y_ID_Check")
	public String Y_ID_Check(){
		return "Y_ID_Check";
	}
	@RequestMapping(value="/Y_Join_NickName")
	public String Y_Join_NickName(){
		return "Y_Join_NickName";
	}
	@RequestMapping(value="/Y_Join_OK")
	public String Y_Join_OK(){
		return "Y_Join_OK";
	}
	@RequestMapping(value="/Y_JoinForm")
	public String Y_JoinForm(){
		return "Y_JoinForm";
	}
	@RequestMapping(value="/Y_MyPage")
	public String Y_MyPage(){
		return "Y_MyPage";
	}
	@RequestMapping(value="/Y_MyProduct")
	public String Y_MyProduct(){
		return "Y_MyProduct";
	}
	@RequestMapping(value="/Y_MyMail")
	public String Y_MyMail(){
		return "Y_MyMail";
	}
	@RequestMapping(value="/Y_MyPerson")
	public String Y_MyPerson(){
		return "Y_MyPerson";
	}
	@RequestMapping(value="/Y_MyWait")
	public String Y_MyWait(){
		return "Y_MyWait";
	}
	@RequestMapping(value="/Y_Delete_MyProduct")
	public String Y_Delete_MyProduct(){
		return "Y_Delete_MyProduct";
	}
	@RequestMapping(value="/Y_Rent")
	public String Y_Rent(){
		return "Y_Rent";
	}
}
