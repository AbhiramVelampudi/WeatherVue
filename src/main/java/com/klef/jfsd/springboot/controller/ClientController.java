package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Form;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.model.WeatherData;
import com.klef.jfsd.springboot.repository.UserRepository;
import com.klef.jfsd.springboot.repository.WeatherDataRepository;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.EmailService;
import com.klef.jfsd.springboot.service.FormService;
import com.klef.jfsd.springboot.service.UserService;
import com.klef.jfsd.springboot.service.WeatherService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FormService formService;
	
	private final UserRepository userRepository;

    @Autowired
    public ClientController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
	
	@Autowired
    private JavaMailSender javaMailSender;
	
	@GetMapping("/")
	public String main() {
		
		return "index";
	}
	
	@GetMapping("about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("about");
		return mv;
		
	}
	
	@GetMapping("summer")
	public ModelAndView summer() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("summer");
		return mv;
		
	}
	

	
	@GetMapping("winter")
	public ModelAndView winter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("winter");
		return mv;
		
	}
	
	@GetMapping("wmap")
	public ModelAndView wmap() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("wmap");
		return mv;
		
	}
	
	@GetMapping("news")
	public ModelAndView news() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news");
		return mv;
		
	}
	
	@GetMapping("adminaction")
	public ModelAndView adminaction() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminaction");
		return mv;
		
	}
	
	@GetMapping("contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contact");
		return mv;
		
	}
	
	@GetMapping("weather")
	public ModelAndView weather() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("weather");
		return mv;
		
	}
	
	@GetMapping("regweather")
	public ModelAndView regweather() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("regweather");
		return mv;
		
	}
	
	@GetMapping("service")
	public ModelAndView service() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service");
		return mv;
		
	}
	
	@GetMapping("updatestatus")
    public ModelAndView updatestatus()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("updatestatus");
      long customercount = adminService.customercount();
      
      mv.addObject("ccount",customercount);
      List<User> userlist = adminService.viewallusers();
      mv.addObject("userdata", userlist);
      
      return mv;
    }
    
   @GetMapping("setstatus")
    public ModelAndView setstatusaction(@RequestParam("id") int eid, @RequestParam("status") boolean status)
    {
      int n = adminService.updatestatus(eid, status);
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("updatestatus");
        
        
        List<User> userlist = adminService.viewallusers();
        mv.addObject("userdata", userlist);
        
        if(n>0)
        {
          mv.addObject("message", "Status Updated Successfully");
        }
        else
        {
          mv.addObject("message", "Failed to Update Status");
        }
        return mv;
    }
	
	@GetMapping("userreg")
	public ModelAndView userregistraion() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userreg");
		return mv;
		
	}
	@GetMapping("userlogin")
	public ModelAndView userlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userlogin");
		return mv;
		
	}
	@PostMapping("checkuserlogin")
	public  ModelAndView checkuserlogin(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     
	     String email = request.getParameter("email");
	     String pwd = request.getParameter("pwd");
	     
	     User user = userService.checkuserlogin(email, pwd);
	     if(user!=null) {
	    	 
	    	 HttpSession session = request.getSession();
	    	 
	    	 session.setAttribute("eid", user.getId());
	    	 session.setAttribute("ename", user.getName());
	    	 
	    	 
	    	 
	    	 mv.setViewName("news");
	     }
	     else {
	    	 mv.setViewName("userreg");
	    	 mv.addObject("message","Login Failed");
	     }

	     return mv;
	}
	@GetMapping("userhome")
	   public ModelAndView userhome(HttpServletRequest request)
	   {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("userhome");
    	 HttpSession session = request.getSession();
    	  
    	 int eid = (int)session.getAttribute("eid"); // eid is a session variable 
    	 String ename =(String)session.getAttribute("ename");  // ename is a session variable
    	 
    	 mv.addObject("eid",eid);
    	 mv.addObject("ename",ename);

	     
	     return mv;
	   }
	
	
	@GetMapping("adminlogin") 
	   public ModelAndView adminlogin(){
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("adminlogin");
	     return mv;
	   }
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request) {
	     String uname = request.getParameter("uname");
    	 String pwd = request.getParameter("pwd");
    	 
    	 Admin a = adminService.checkadminlogin(uname, pwd);
	     ModelAndView mv = new ModelAndView();

	     if(a!=null) {
	    	 
	    	//session
				
				HttpSession session = request.getSession();			
				
				session.setAttribute("eid", a.getId()); 		//eid is a session variable
				session.setAttribute("ename", a.getUsername());		//ename is a session variable
				
	    	 
	    	 mv.setViewName("adminhome");
	     }
	     else {
	    	 mv.setViewName("adminlogin");
	    	 mv.addObject("message","Login Failed");
	     }
	     return mv;

	}
	@GetMapping("viewallusers")
	public ModelAndView viewallusers() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewallusers");
		
		List<User> userlist = adminService.viewallusers();
		mv.addObject("userdata", userlist);
		
		return mv;
	}
	
	@PostMapping("insertuser")
	public ModelAndView insertaction(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     String msg = null;
	     try 
	     {
	    	 String name = request.getParameter("name");
	    	 String email = request.getParameter("email");
	    	 String pwd = request.getParameter("pwd");
	    	 String location = request.getParameter("location");
	    	 String contact = request.getParameter("contact");
	    	 
	    	 User user = new User();
	    	  user.setName(name);
	          user.setEmail(email);
	          user.setPassword(pwd);
	          user.setLocation(location);
	          user.setContact(contact);
	          user.setActive(true);
	    	 
	          msg = userService.adduser(user);
	          String username = user.getName(); // Fetching the username
	          String subject = "Welcome to WeatherVue - Your Personal Weather Hub 🌤️";
	          String body = "Dear " + username + ",\n\n" +
	                        "Welcome to WeatherVue, your one-stop destination for all things weather! We are thrilled to have you on board. Prepare to stay ahead of the weather curve with our dynamic graphical interface and comprehensive updates. \n\n" +
	                        "Here's what you can look forward to with your new WeatherVue account:\n\n" +
	                        "1. Real-Time Weather Updates: Receive instant updates on the current weather conditions in your area, ensuring you're always one step ahead.\n" +
	                        "2. Customized Forecasts: Tailored weather forecasts based on your location, preferences, and interests, ensuring you're well-prepared for any upcoming weather changes.\n" +
	                        "3. Informative Weather News: Stay informed with the latest weather news, expert analysis, and insightful articles, all beautifully presented in our user-friendly interface.\n" +
	                        "4. Interactive Graphics: Visualize weather patterns like never before with our interactive graphical interface, making it easier to understand complex weather data at a glance.\n\n" +
	                        "Feel free to explore our website, customize your preferences, and make the most of your personalized WeatherVue experience.\n\n" +
	                        "Should you have any questions, feedback, or suggestions, please don't hesitate to reach out to our dedicated support team at weathervue004@gmail.com. We value your input and are committed to providing you with the best possible user experience.\n\n" +
	                        "Thank you for choosing WeatherVue. Let's stay ahead of the weather, together!\n\n" +
	                        "Warm regards,\n" +
	                        "The WeatherVue Team\n" +
	                        "www.weathervue.com\n\n" +
	                        "Follow us on [Facebook/Twitter/Instagram] for the latest updates and tips!";
	          emailService.sendEmail(user.getEmail(), subject, body);






	          mv.setViewName("displaymsg");
	          mv.addObject("message",msg);
	     } 
	     catch (Exception e) 
	     {
			mv.setViewName("displayerror");
			
			msg = e.getMessage();
	        mv.addObject("message",msg);
	     }
	     return mv;
	}
	@GetMapping("adminhome")
	   public ModelAndView adminhome(HttpServletRequest request)
	   {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("adminhome");
	     
	     HttpSession session = request.getSession();
	     
	     long customercount = adminService.customercount();
	      
	       mv.addObject("ccount",customercount);
	       
	     int eid = (int) session.getAttribute("eid");		//eid is a session variable
	     String ename = (String) session.getAttribute("ename");		//ename is a session variable
	     
	     List<User> userlist = adminService.viewallusers();
		mv.addObject("userdata", userlist);
		 mv.addObject("eid", eid);
	     mv.addObject("ename",ename);
	     return mv;
	   }
	@GetMapping("view")
	   public ModelAndView viewuserdemo(@RequestParam("id") int eid)
	   {
	     User user = adminService.viewuserbyid(eid);
	     ModelAndView mv = new ModelAndView();
	     long customercount = adminService.customercount();
	      
	       mv.addObject("ccount",customercount);
	     mv.setViewName("viewuserbyid");
	     mv.addObject("user", user);
	     return mv;
	   }
	@GetMapping("deleteuser")
	   public ModelAndView deleteuser()
	   {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("deleteuser");
	     
	     long customercount = adminService.customercount();
	      
	       mv.addObject("ccount",customercount);
	     
	     List<User> userlist =  adminService.viewallusers();
	     
	     mv.addObject("userdata", userlist);
	     
	     return mv;
	   }
	
	@GetMapping("delete/{id}")
	public String deleteaction(@PathVariable("id") int eid) {
		adminService.deleteuser(eid);
		return "redirect:/deleteuser";
	}
	@GetMapping("updateprofile")
	   public ModelAndView updateuser(HttpServletRequest request)
	   {
	     ModelAndView mv = new ModelAndView();
	     
	     HttpSession session = request.getSession();
	     
	     mv.setViewName("updateprofile");
	     
	     mv.addObject("eid", session.getAttribute("eid"));
	     mv.addObject("ename", session.getAttribute("ename"));
	     
	     int id = (int) session.getAttribute("eid");
	     
	     User user = userService.viewuserbyid(id);
	     
	     mv.addObject("user", user);
	     
	     return mv;
	   }
	   
	   @PostMapping("update")
	   public ModelAndView updateaction(HttpServletRequest request)
	   {
	     String msg = null;
	     
	     ModelAndView mv = new ModelAndView();
	     
	       HttpSession session = request.getSession();
	     
	     mv.addObject("eid", session.getAttribute("eid"));
	     mv.addObject("ename", session.getAttribute("ename"));
	     
	     int id = (int) session.getAttribute("eid");
	     
	    try
	    {
	      String name = request.getParameter("name");
	      String email = request.getParameter("email");
	      String pwd = request.getParameter("pwd");
	      String location = request.getParameter("location");
	      String contact = request.getParameter("contact");
	      
	      User user = new User();
	       user.setId(id);
	       user.setName(name);
	       user.setEmail(email);
	       user.setPassword(pwd);
	       user.setLocation(location);
	       user.setContact(contact);
	       
	       
	       msg = userService.updateuser(user);
	       
	       mv.setViewName("userlogin");
	       mv.addObject("message",msg);
	      
	    }
	    catch(Exception e)
	    {
	      msg = e.getMessage();
	      
	      mv.setViewName("updateerror");
	       mv.addObject("message",msg);
	    }
	     
	    
	     return mv;

	   }
	   
	   @GetMapping("addbyid")
	    public String addbyid(Model m)
	    {
	      m.addAttribute("user", new User());
	      return "addbyid";
	    }
	   @PostMapping("insertmessage")
	     public ModelAndView msgaction(HttpServletRequest request)
	     {
	       ModelAndView mv = new ModelAndView();
	         String msg = null;
	         try 
	         {
	           String name = request.getParameter("name");
	           String email = request.getParameter("email");
	    
	           String subject = request.getParameter("subject");
	           String message = request.getParameter("message");
	           
	           Form f = new Form();
	            f.setName(name);
	            f.setEmail(email);
	            f.setSubject(subject);
	            f.setMessage(message);
	           msg = formService.addform(f);
	             
	           mv.setViewName("displaymsg");
	              mv.addObject("message",msg);
	         } 
	         catch (Exception e) 
	         {
	        mv.setViewName("displayerror");
	        
	        msg = e.getMessage();
	            mv.addObject("message",msg);
	         }
	         return mv;
	     }
	   
	   @GetMapping("viewallmsgs")
	    public ModelAndView viewallmsgs() {
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("viewallmsgs");
	      long customercount = adminService.customercount();
	      
	       mv.addObject("ccount",customercount);
	      List<Form> msglist = adminService.viewallmsgs();
	      mv.addObject("formdata", msglist);
	      
	      return mv;
	    }
	   
	   @GetMapping("viewmsg")
	     public ModelAndView viewmsgdemo(@RequestParam("id") int fid)
	     {
	       Form form = adminService.viewmsgbyid(fid);
	       ModelAndView mv = new ModelAndView();
	       long customercount = adminService.customercount();
	        
	         mv.addObject("ccount",customercount);
	       mv.setViewName("viewmsgbyid");
	       mv.addObject("form", form);
	       return mv;
	     }
	   
	   
	   @PostMapping("sendWeatherAlerts")
	   public ModelAndView sendWeatherAlerts(RedirectAttributes redirectAttributes, @RequestParam("subject") String subject, @RequestParam("message") String message) {
	       String msg = null;
	       try {
	           List<User> userList = userService.getAllUsers();
	           for (User user : userList) {
	               String userEmail = user.getEmail();
	               emailService.sendEmail(userEmail, subject, message);
	           }
	           msg = "Weather alerts sent successfully to all users.";
	       } catch (Exception e) {
	           e.printStackTrace();
	           msg = "Failed to send weather alerts. Please try again later.";
	       }

	       // Add a flash attribute to display the message on the adminhome page
	       redirectAttributes.addFlashAttribute("message", msg);

	       // Redirect back to the adminhome page
	       return new ModelAndView("redirect:/bulkmail");
	   }
	   
	   @GetMapping("/bulkmail")
	    public String showSendEmailPage(Model model) {
	        List<String> locations = userRepository.findDistinctLocations();
	        model.addAttribute("locations", locations);
	        
	        return "bulkmail";
	    }
	   
	   @PostMapping("/bulkmail") 
	    public String sendEmailToLocation(@RequestParam String location, @RequestParam String subject, @RequestParam String message, Model model) {
	        List<User> users = userRepository.findByLocation(location);

	        for (User user : users) {
	            if (user.isActive()) {
	                // Create and send an email to each user
	                try {
	                    SimpleMailMessage mailMessage = new SimpleMailMessage();
	                    mailMessage.setTo(user.getEmail());
	                    mailMessage.setSubject(subject);
	                    mailMessage.setText(message);
	                    javaMailSender.send(mailMessage);
	                } catch (Exception e) {
	                    // Handle any exceptions that may occur during email sending
	                    // You can log the error or take appropriate action
	                    e.printStackTrace();
	                }
	            }
	        }

	        // You may want to add a success message or handle email sending logic here
	        model.addAttribute("users", users);
	        model.addAttribute("emailSent", true); // You can use this to display a success message in the JSP
	        return "bulkmail";
	    }
	   
	   
	   @GetMapping("/bulkbyloc")
	    public String showSendEmailPage2(Model model) {
	        List<String> locations = userRepository.findDistinctLocations();
	        model.addAttribute("locations", locations);
	        
	        return "bulkbyloc";
	    }
	   
	    @Autowired
	    private WeatherService weatherService;
	    @Autowired
	    private WeatherDataRepository weatherDataRepository;

	    @GetMapping("weatherdb")
	    public String weatherdb(Model model) {
	        // Fetch and display weather data from the database
	        List<WeatherData> weatherDataList = weatherDataRepository.findAll();
	        model.addAttribute("weatherDataList", weatherDataList);
	        return "weatherdb";
	    }

	  
	    @PostMapping("search")
	    public String searchWeather(@RequestParam("city") String city, Model model) {
	        WeatherData weatherData = weatherService.fetchWeatherData(city);
	        model.addAttribute("weatherData", weatherData);
	        return "weatherdb";
	    }
	   
	   @PostMapping("/bulkbyloc") 
	    public String sendEmailToLocation2(@RequestParam String location, @RequestParam String subject, @RequestParam String message, Model model) {
	        List<User> users = userRepository.findByLocation(location);

	        for (User user : users) {
	            if (user.isActive()) {
	                // Create and send an email to each user
	                try {
	                    SimpleMailMessage mailMessage = new SimpleMailMessage();
	                    mailMessage.setTo(user.getEmail());
	                    mailMessage.setSubject(subject);
	                    mailMessage.setText(message);
	                    javaMailSender.send(mailMessage);
	                } catch (Exception e) {
	                    // Handle any exceptions that may occur during email sending
	                    // You can log the error or take appropriate action
	                    e.printStackTrace();
	                }
	            }
	        }

	        // You may want to add a success message or handle email sending logic here
	        model.addAttribute("users", users);
	        model.addAttribute("emailSent", true); // You can use this to display a success message in the JSP
	        return "bulkbyloc";
	    }
	   
	   @GetMapping("/login")
	    @ResponseBody
	    public User checkUserLogin(@RequestParam String email, @RequestParam String password) {
	        return userRepository.checkuserlogin(email, password);
	    }

	    @GetMapping("/byLocation")
	    @ResponseBody
	    public List<User> getUsersByLocation(@RequestParam String location) {
	        return userRepository.findByLocation(location);
	    }

	    @GetMapping("/distinctLocations")
	    @ResponseBody
	    public List<String> getDistinctLocations() {
	        return userRepository.findDistinctLocations();
	    }
	    
	    @PostMapping("/downloadCsv")
	    public void downloadCsv(HttpServletResponse response) throws IOException {
	        List<WeatherData> allWeatherData = weatherService.getAllWeatherData();

	        response.setContentType("text/csv");
	        response.setHeader("Content-Disposition", "attachment; filename=weather_data_all.csv");

	        try (PrintWriter writer = response.getWriter()) {
	            writer.println("City,Date,Temperature (°C),Humidity (%),Description,Raining");

	            for (WeatherData weatherData : allWeatherData) {
	                writer.println(String.format("%s,%s,%.1f,%d,%s,%s",
	                        weatherData.getCity(),
	                        weatherData.getDate(),
	                        weatherData.getTemperature(),
	                        weatherData.getHumidity(),
	                        weatherData.getDescription(),
	                        weatherData.isRaining() ? "Yes" : "No"));
	            }
	        }
	    }


	}

	   

	
