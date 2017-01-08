package com.stldesis.action;

import com.stldesis.util.DateHelper;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.stldesis.model.Ad;
import com.stldesis.model.Category;
import com.stldesis.model.Classifieds;
import com.stldesis.model.Events;
import com.stldesis.model.Faq;
import com.stldesis.model.Interviews;
import com.stldesis.model.Movies;
import com.stldesis.model.Offers;
import com.stldesis.model.PlacesToVisit;
import com.stldesis.model.User;
import com.stldesis.model.Contactus;
import com.stldesis.model.Propertie;
import com.stldesis.model.YellowPages;
import com.stldesis.util.StldesisMail;

public class AdminAction extends MasterAction{

	private static final long serialVersionUID = 3311550398900123041L;

	private static final Logger log = Logger.getLogger(AdminAction.class);
	
	private String loginName;
	private String password;
	private Integer startRecord;
	
	private String attachment;
	private InputStream inputStream;
	private Propertie propertie;
	private YellowPages tyellowPages;
	private Events tEvents;
	private PlacesToVisit tPlacesToVisit;
	private Movies tMovies;
	private Offers tOffers;
	private Interviews tInterviews;
	private Faq tFaq;
	private Category tCategory;
	private Classifieds tClassifieds;
	
	//Lists
	private List<Contactus> contactusList;
	
	//getByIds
	private Long contactId;
	
	//View
	private Contactus contactus;
	//User
	private Integer userId;
	private String firstName;
	private String lastName;
	private String contactNo;
	
	//Contactus
	public String phoneNo;
	public String datefrom;
	public String dateto;
	public String message;
	
	//Category
	public String categoryName;
	public String categoryUrlName;
	private Long parentCategoryId;
	private Long pId;
	private User tuser;
	private String metaKeywords;
	private String metaDescription;
	
	//YellowPages
	private String website;
	private String url;

	private String dateFrom;
	private String dateTo;
	private Date fromDate;
	private Date toDate;
	private Integer status;
	
	private String contactPerson;
	private Integer adType;
	private List<Category> parentCategoriesList;
	private List<User> adminsList;
	
	//Classifieds
	
	private Integer activeAccomodation;
	private Integer pendingAccomodation;
	private Integer activeAuto;
	private Integer pendingAuto;
	private Integer activeCatering;
	private Integer pendingCatering;
	private Integer activeChildCare;
	private Integer pendingChildCare;
	private Integer activeForSale;
	private Integer pendingForSale;
	private Integer activeJobs;
	private Integer pendingJobs;
	private Integer activeLadiesCorner;
	private Integer pendingLadiesCorner;
	private Integer activeTravelCompanion;
	private Integer pendingTravelCompanion;
	private Integer activeOthers;
	private Integer pendingOthers;
		
	//Events
	private String linkUrl;
	
	//Movies
	 private String starring;
	 private String director;
	 private String music;
	 private String producer;
	 private String latestShowTimingsLink;
	 
	 //Ads
	 private String imageAltMsg;
	 private Integer priority;
	
 	public String getLoginPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "login";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getLogotPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "login";
			session.put("user", null);
			msg="Loged Out Successfully.";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String loginUser(){
		try{
			session = ActionContext.getContext().getSession();
			user = userBo.getUser(loginName, password);
			if(user!=null){
				urlPage = "login";
				session.put("user", user);
				if(user.getStatus()==ACTIVE){
					return SUCCESS;
				}else {
					errorMsg = "Sorry !! You are under IN-ACTIVE Status !!!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
	}

	public String getForgotPassword(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "forgetPassword";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String getResetPassword(){
		try{
			session = ActionContext.getContext().getSession();
			user = userBo.getUser(loginName);
			if(user==null){
				urlPage = "forgetPassword";
				errorMsg = "Invalid E-mail Id.";
				return "failure";
			}
			urlPage = "resetPassword";
			UUID uuid = UUID.randomUUID();
			String verificationCode = uuid.toString().substring(0, 6);
			userBo.updateUser(user.getUserId(), verificationCode);
			Propertie propertie = propertieBo.getPropertie();
			if(propertie!=null){
				
				String subject = propertie.getAdminPasswordRecoverySubject().replaceAll("#email#", loginName);
				String body = propertie.getAdminPasswordRecoveryBody().replaceAll("#email#", loginName).replaceAll("#password#", verificationCode);
				
				StldesisMail.postMail(loginName, propertie.getAdminId(), subject, body,propertie.getSmtpHost(), 
						propertie.getSmtpPort1(), propertie.getSmtpPort2(), propertie.getSmtpSocketFactory(), 
						propertie.getSmtpSocketFactoryport(), propertie.getSmtpAuth(), 
						propertie.getSmtpUserid(), propertie.getSmtpPassword(), propertie.getAdminId());
				
			}
			msg = "An E-mail has been sent to your Mail Id with Verification Code and a Link to Reset Your Password.";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String updatePassword(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "login";
			user = userBo.getUser(loginName);
			if(user==null){
				errorMsg = "User does not Exist with this Email Id.";
				return "failure";
			}else{
				if(user.getVerificationCode()==null){
					errorMsg = "Please Go To the Forgot Password Page.";
				}else{
					if(securitycode.equals(user.getVerificationCode())){
						userBo.updateUser(user.getUserId(), null, password);
						msg = "Password Updated Successfully.";
					}else{
						errorMsg = "Please Go To the Forgot Password Page.";
						return "failure";
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getChangePasswordPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "changePassword";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String updateAdminChangePassword(){
		try{
			getGlobalContent();
			urlPage = "changePassword";
			user = (User) session.get("user");
			if(user==null){
				errorMsg = "User does not Exist with this Email Id.";
				return "failure";
			}else{	
					if(currentPassword.equals(user.getPassword())){
						userBo.updateUser(user.getUserId(), null, password);
						msg = "Password Updated Successfully.";
					}else{
						errorMsg = "This is not your Current Password";
						return "failure";
					}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	
	//Admin Home
	
	@SuppressWarnings("unchecked")
	public String getAdminHomePage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminHome";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				activeAccomodation = classifiedsBo.getClassifiedsByPageCount(null, ACCOMODATION, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingAccomodation = classifiedsBo.getClassifiedsByPageCount(null, ACCOMODATION, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeAuto = classifiedsBo.getClassifiedsByPageCount(null, AUTO, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingAuto = classifiedsBo.getClassifiedsByPageCount(null, AUTO, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeCatering = classifiedsBo.getClassifiedsByPageCount(null, CATERING, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingCatering = classifiedsBo.getClassifiedsByPageCount(null, CATERING, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeChildCare = classifiedsBo.getClassifiedsByPageCount(null, CHILD_CARE, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingChildCare = classifiedsBo.getClassifiedsByPageCount(null, CHILD_CARE, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeForSale = classifiedsBo.getClassifiedsByPageCount(null, FOR_SALE, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingForSale = classifiedsBo.getClassifiedsByPageCount(null, FOR_SALE, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeJobs = classifiedsBo.getClassifiedsByPageCount(null, JOBS, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingJobs = classifiedsBo.getClassifiedsByPageCount(null, JOBS, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeLadiesCorner = classifiedsBo.getClassifiedsByPageCount(null, LADIES_CORNER, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingLadiesCorner = classifiedsBo.getClassifiedsByPageCount(null, LADIES_CORNER, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeTravelCompanion = classifiedsBo.getClassifiedsByPageCount(null, TRAVEL_COMPANION, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingTravelCompanion = classifiedsBo.getClassifiedsByPageCount(null, TRAVEL_COMPANION, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
				
				activeOthers = classifiedsBo.getClassifiedsByPageCount(null, OTHERS, null, null, null, null, null, null, null,
						null, null, null, null, null, null, ACTIVE);
				pendingOthers = classifiedsBo.getClassifiedsByPageCount(null, OTHERS, null, null, null, null, null, null, null,
						null, null, null, null, null, null, PENDING);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Admin All Classifieds
	
	@SuppressWarnings("unchecked")
	public String getAdminAllClassifiedsPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminAllClassifieds";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(CLASSIFIEDS);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = classifiedsBo.getClassifiedsByPageCount(id, categoryId, null, null, null, null, null, emailId, null, null, null, fromDate, toDate, null, null, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					classifiedsList = classifiedsBo.getClassifiedsByPage(id, categoryId, null, null, null, null, null, emailId, null, null, null, fromDate, toDate, null, null, status, startNo, pageSize);

					return SUCCESS;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminViewClassifiedsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(CLASSIFIEDS);
				if(id!=null && id!=0 && categoryList!=null && !categoryList.isEmpty()){
					classifieds = classifiedsBo.getClassifiedsById(id);
					if(classifieds==null){
						errorMsg = "Classified Not Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Classified Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminClassifiedsEditPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminClassifiedsEdit";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(CLASSIFIEDS);
				if(id!=null && id!=0 && categoryList!=null && !categoryList.isEmpty()){
					classifieds = classifiedsBo.getClassifiedsById(id);
					if(classifieds==null){
						errorMsg = "Classified Not Found with the Given Id !!";
						return "failure";
					}
				}else{
					errorMsg = "Classified Id can't be Empty / NULL !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminUpdateClassifiedsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			urlPage = "adminClassifiedsEdit";
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0 && categoryId!=0 && title!=null && !title.equals("") && price!=null && price!=new BigDecimal(0) && 
							name!=null && !name.equals("") && phone!=null && !phone.equals("") && description!=null && !description.equals("") && emailId!=null && !emailId.equals("") && 
							address!=null && !address.equals("") && status!=null && !status.equals("")){	
						
						classifieds = classifiedsBo.getClassifiedsById(id);
						if(classifieds!=null){
							if(title.length()>200){
								url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}else{
								url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}

							if(!classifieds.getUrl().equals(url)){
								tClassifieds = classifiedsBo.getClassifiedsByUrl(url);
		
								if(tClassifieds!=null){
									errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
									return "failure";
								}
							}
							classifieds.setCategoryId(categoryId);
							classifieds.setTitle(title);
							classifieds.setUrl(url);
							classifieds.setPrice(price);
							classifieds.setName(name);
							classifieds.setPhone(phone);
							classifieds.setEmailId(emailId);
							classifieds.setDescription(description);
							classifieds.setAddress(address);
							classifieds.setPostedDate(new Date());
							classifieds.setApprovedBy(user.getUserId());
							classifieds.setLastUpdatedBy(user.getUserId());
							classifieds.setAdminName(user.getFirstName());
							classifieds.setLastUpdatedTime(new Date());
							classifieds.setStatus(status);
							if(image1!=null){
								imageName = CLASSIFIEDS_DIRECTORY + File.separator + id + "_1"+ "." + FilenameUtils.getExtension(image1FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image1, fileToCreate);
						    	classifieds.setImage1(imageName);
							}
							if(image2!=null){
								imageName = CLASSIFIEDS_DIRECTORY + File.separator + id + "_2"+ "." + FilenameUtils.getExtension(image2FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image2, fileToCreate);
						    	classifieds.setImage2(imageName);
							}
							if(image3!=null){
								imageName = CLASSIFIEDS_DIRECTORY + File.separator + id + "_3"+ "." + FilenameUtils.getExtension(image3FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image3, fileToCreate);
						    	classifieds.setImage3(imageName);
							}
							if(image4!=null){
								imageName = CLASSIFIEDS_DIRECTORY + File.separator + id + "_4"+ "." + FilenameUtils.getExtension(image4FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image4, fileToCreate);
						    	classifieds.setImage4(imageName);
							}
						    classifiedsBo.updateClassifieds(classifieds);
					}else {
						errorMsg = "No Classified is Found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
				
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String adminActivateClassifieds(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					classifieds = classifiedsBo.getClassifiedsById(pId);
					if(classifieds!=null){
						if(classifieds.getStatus()==PENDING){
							classifiedsBo.updateActivateClassifieds(pId, ACTIVE);
							
							propertie = propertieBo.getPropertie();
							if(propertie!=null){
								
								String adminAdPostedEmailSubject = propertie.getAdminAdPostedEmailSubject().replaceAll("#email#", classifieds.getEmailId());
								String adminAdPostedEmailBody = propertie.getAdminAdPostedEmailBody().replaceAll("#name#", classifieds.getName()+"").replaceAll("#title#", classifieds.getTitle()+"").replaceAll("#adId#", classifieds.getId()+"")
										.replaceAll("#emailId#", classifieds.getEmailId()+"").replaceAll("#phone#", classifieds.getPhone()+"").replaceAll("#url#", classifieds.getUrl()+"");
								
								StldesisMail.postMail(classifieds.getEmailId(), propertie.getAdminId(), adminAdPostedEmailSubject, 
										adminAdPostedEmailBody, propertie.getSmtpHost(), propertie.getSmtpPort1(), propertie.getSmtpPort2(), 
										propertie.getSmtpSocketFactory(), propertie.getSmtpSocketFactoryport(), propertie.getSmtpAuth(), 
										propertie.getSmtpUserid(), propertie.getSmtpPassword(), propertie.getAdminId());		
							}
							
						    msg = "Ad Published Email has been sent to the Ad Holder's Mail Id!!";
						    return SUCCESS;
							
						}else if(classifieds.getStatus()==ACTIVE){
							classifiedsBo.updateActivateClassifieds(pId, PENDING);
						}
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String deleteAdminClassifieds(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					classifieds = classifiedsBo.getClassifiedsById(pId);
					if(classifieds!=null){
						classifiedsBo.deleteClassifieds(classifieds);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	
	// Admin Yellow Pages List
	
	@SuppressWarnings("unchecked")
	public String getAdminYellowPagesList(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminYellowPagesList";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(YELLOW_PAGES);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = yellowPagesBo.getYellowPagesByPageCount(id, categoryId, null, contactPerson, emailId, phone,  null, null, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;	
					yellowPagesList = yellowPagesBo.getYellowPagesByPage(id, categoryId, null, contactPerson, emailId, phone, null, null, null, null, null, null, null, fromDate, toDate, status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminViewYellowPagesPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(YELLOW_PAGES);
				if(id!=null && id!=0 && categoryList!=null && !categoryList.isEmpty()){
					yellowPages = yellowPagesBo.getYellowPagesById(id);
					if(yellowPages==null){
						errorMsg = "No Yellow Pages Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Yellow Pages Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminAddYellowPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(YELLOW_PAGES);
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Eppty !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminSaveYellowPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(categoryId!=0 && title!=null && !title.equals("") && contactPerson!=null && !contactPerson.equals("") && 
						emailId!=null && !emailId.equals("") && phone!=null && !phone.equals("") && 
						website!=null && !website.equals("") && address!=null && !address.equals("") && 
						description!=null && !description.equals("")){
					if(title.length()>200){
						url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}else{
						url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}
					tyellowPages = yellowPagesBo.getYellowPagesByUrl(url);
					if(tyellowPages!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						yellowPages = new YellowPages();
						yellowPages.setCategoryId(categoryId);
						yellowPages.setTitle(title);
						yellowPages.setUrl(url);
						yellowPages.setContactPerson(contactPerson);
						yellowPages.setEmailId(emailId);
						yellowPages.setPhone(phone);
						yellowPages.setWebsite(website);
						yellowPages.setAddress(address);
						yellowPages.setDescription(description);
						yellowPages.setPostedBy(user.getUserId());
						yellowPages.setLastUpdatedBy(user.getUserId());
						yellowPages.setCreationTime(new Date());
						yellowPages.setLastUpdatedTime(new Date());
						yellowPages.setStatus(ACTIVE);
						yellowPagesBo.addYellowPages(yellowPages);
					}
				}else{
					categoryList = categoryBo.getCategoryByParentCategoryId(YELLOW_PAGES);
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminEditYellowPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(YELLOW_PAGES);
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Eppty !!";
					return "failure";
				}else{
					yellowPages  = yellowPagesBo.getYellowPagesById(id);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminUpdateYellowPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0 && categoryId!=0 && title!=null && !title.equals("") && 
						contactPerson!=null && !contactPerson.equals("") && 
						emailId!=null && !emailId.equals("") && phone!=null && !phone.equals("") && 
						website!=null && !website.equals("") && address!=null && !address.equals("") && 
						description!=null && !description.equals("")){
					yellowPages = yellowPagesBo.getYellowPagesById(id);
					if(yellowPages!=null){

						if(title.length()>200){
							url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
						}else{
							url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
						}

						if(!yellowPages.getUrl().equals(url)){
							tyellowPages = yellowPagesBo.getYellowPagesByUrl(url);
	
							if(tyellowPages!=null){
								errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
								return "failure";
							}
						}
						yellowPages.setCategoryId(categoryId);
						yellowPages.setTitle(title);
						yellowPages.setUrl(url);
						yellowPages.setContactPerson(contactPerson);
						yellowPages.setEmailId(emailId);
						yellowPages.setPhone(phone);
						yellowPages.setWebsite(website);
						yellowPages.setAddress(address);
						yellowPages.setDescription(description);
						yellowPages.setLastUpdatedBy(user.getUserId());
						yellowPages.setLastUpdatedTime(new Date());
						yellowPages.setStatus(status);
						yellowPagesBo.updateYellowPages(yellowPages);
						
					}else{
						errorMsg = "No Yellow Page found with the given Id !!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password !!";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String deleteYellowPagesAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					yellowPages = yellowPagesBo.getYellowPagesById(pId);
					if(yellowPages!=null){
						yellowPagesBo.deleteYellowPages(yellowPages);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Admin Events
	
	@SuppressWarnings("unchecked")
	public String getAdminEventsPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminEvents";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(EVENTS);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				
				totalSize = eventsBo.getEventsByPageCount(id, null, null, null, name, phone, emailId, null, null,
						null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					eventsList = eventsBo.getEventsByPage(id, null, null, null, name, phone, emailId, null, null, null,
							null, null, null, null, fromDate, toDate, status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminViewEventsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0){
					event = eventsBo.getEventsById(id);
					if(event==null){
						errorMsg = "No Events Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Events Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminAddEventsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminEvents(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(title!=null && !title.equals("") && name!=null && !name.equals("") &&
						emailId!=null && !emailId.equals("") && phone!=null && !phone.equals("") && address!=null && !address.equals("") &&
						description!=null && !description.equals("") && dateFrom!=null && !dateFrom.equals("") && dateTo!=null && !dateTo.equals("")){
					if(title.length()>200){
						url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}else{
						url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}
					tEvents = eventsBo.getEventsByUrl(url);
					if(tEvents!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						if(dateFrom!=null && !dateFrom.equals("")){
							fromDate = DateHelper.getUtilDateTimeFromString(dateFrom);
						}
						if(dateTo!=null && !dateTo.equals("")){
							toDate = DateHelper.getUtilDateTimeFromString(dateTo);
						}
						event = new Events();
						event.setCategoryId(EVENTS);
						event.setTitle(title);
						event.setUrl(url);
						event.setName(name);
						event.setEmailId(emailId);
						event.setPhone(phone);
						event.setAddress(address);
						event.setDescription(description);
						event.setFromTime(fromDate);
						event.setToTime(toDate);
						event.setPostedBy(user.getUserId());
						event.setLastUpdatedBy(user.getUserId());
						event.setCreationTime(new Date());
						event.setLastUpdatedTime(new Date());
						event.setStatus(ACTIVE);
						eventsBo.addEvents(event);
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditEventsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				event = eventsBo.getEventsById(id);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminEvents(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0 && title!=null && !title.equals("") && name!=null && !name.equals("") &&
						emailId!=null && !emailId.equals("") && phone!=null && !phone.equals("") && address!=null && !address.equals("") &&
						description!=null && !description.equals("") && dateFrom!=null && !dateFrom.equals("") && dateTo!=null && !dateTo.equals("")){
					
					event = eventsBo.getEventsById(id);
					if(event!=null){
							if(dateFrom!=null && !dateFrom.equals("")){
								fromDate = DateHelper.getUtilDateTimeFromString(dateFrom);
							}
							if(dateTo!=null && !dateTo.equals("")){
								toDate = DateHelper.getUtilDateTimeFromString(dateTo);
							}
							if(title.length()>200){
								url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}else{
								url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}
							if(!event.getUrl().equals(url)){
								tEvents = eventsBo.getEventsByUrl(url);
		
								if(tEvents!=null){
									errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
									return "failure";
								}
							}
							event.setCategoryId(EVENTS);
							event.setTitle(title);
							event.setUrl(url);
							event.setName(name);
							event.setEmailId(emailId);
							event.setPhone(phone);
							event.setAddress(address);
							event.setDescription(description);
							event.setFromTime(fromDate);
							event.setToTime(toDate);
							event.setPostedBy(user.getUserId());
							event.setLastUpdatedBy(user.getUserId());
							event.setCreationTime(new Date());
							event.setLastUpdatedTime(new Date());
							event.setStatus(status);
							eventsBo.updateEvents(event);
						}else {
						errorMsg = "No Events id found with the given Id !!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	@SuppressWarnings("unchecked")
	public String deleteEventsAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					event = eventsBo.getEventsById(pId);
					if(event!=null){
						eventsBo.deleteEvents(event);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Admin Offers
	
	@SuppressWarnings("unchecked")
	public String getAdminOffersPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminOffers";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(OFFERS);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = offersBo.getOffersByPageCount(id, categoryId, null, null, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					offersList = offersBo.getOffersByPage(id, categoryId, null, null, null, null, null, null, null, fromDate,
							toDate, status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminViewOffersPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(OFFERS);
				if(id!=null && id!=0 && categoryList!=null && !categoryList.isEmpty()){
					offers = offersBo.getOffersById(id);
					if(offers==null){
						errorMsg = "No Offers Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Offers Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminAddOffersPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(OFFERS);
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Eppty !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminOffers(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			id = offersBo.getNextOffersId();
			if(user!=null){
				session.put("user", user);
				if(categoryId!=0 && linkUrl!=null && !linkUrl.equals("") && url!=null && !url.equals("") &&
						( image!=null || (description!=null && !description.equals("")) )){
					tOffers = offersBo.getOffersByUrl(url);
					if(tOffers!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						offers = new Offers();
						offers.setCategoryId(categoryId);
						offers.setUrl(url);
						offers.setLinkUrl(linkUrl);
						if(image!=null){
							imageName = OFFERS_DIRECTORY + File.separator + id + "." + FilenameUtils.getExtension(imageFileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image, fileToCreate);
					    	offers.setImage(imageName);
						}
						offers.setDescription(description);
						offers.setPostedBy(user.getUserId());
						offers.setLastUpdatedBy(user.getUserId());
						offers.setCreationTime(new Date());
						offers.setLastUpdatedTime(new Date());
						offers.setStatus(ACTIVE);
						offersBo.addOffers(offers);
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditOffersPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(OFFERS);
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Empty !!";
					return "failure";
				}else{
					offers = offersBo.getOffersById(id);
				}		
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminOffers(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0 && categoryId!=0 && linkUrl!=null && !linkUrl.equals("") && url!=null && !url.equals("") &&
						( image!=null || (description!=null && !description.equals("")) ) && status!=null && !status.equals("")){
					offers = offersBo.getOffersById(id);
					if(offers!=null){
						if(!offers.getUrl().equals(url)){
							tOffers = offersBo.getOffersByUrl(url);
							if(tOffers!=null){
								errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
								return "failure";
							}
						}
						offers.setCategoryId(categoryId);
						offers.setUrl(url);
						offers.setLinkUrl(linkUrl);
						if(image!=null){
							imageName = OFFERS_DIRECTORY + File.separator + id + "." + FilenameUtils.getExtension(imageFileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image, fileToCreate);
					    	offers.setImage(imageName);
						}
						offers.setDescription(description);
						offers.setPostedBy(user.getUserId());
						offers.setLastUpdatedBy(user.getUserId());
						offers.setCreationTime(new Date());
						offers.setLastUpdatedTime(new Date());
						offers.setStatus(status);
						offersBo.updateOffers(offers);
					}else {
						errorMsg = "No Offer is Found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	@SuppressWarnings("unchecked")
	public String deleteOffersAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					offers = offersBo.getOffersById(pId);
					if(offers!=null){
						offersBo.deleteOffers(offers);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Admin Places To Visit
	
	@SuppressWarnings("unchecked")
	public String getAdminPlacesToVisitPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminPlacesToVisit";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(PLACES_TO_VISIT);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = placesToVisitBo.getPlacesToVisitByPageCount(id, null, title, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					placesToVisitList = placesToVisitBo.getPlacesToVisitByPage(id, null, title, null, null, null, null, null, fromDate, toDate, status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminViewPlacesToVisitPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0){
					placesToVisit = placesToVisitBo.getPlacesToVisitById(id);
					if(placesToVisit==null){
						errorMsg = "No Places To Visit Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Places To Visit Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	@SuppressWarnings("unchecked")
	public String getAdminAddPlacesToVisitPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminPlacesToVisit(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			id = placesToVisitBo.getNextPlacesToVisitId();
			if(user!=null){
				session.put("user", user);
				if(title!=null && !title.equals("") && description!=null && !description.equals("") && 
						(image1!=null || image2!=null || image3!=null || image4!=null)){
					
					if(title.length()>200){
						url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}else{
						url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}
					tPlacesToVisit = placesToVisitBo.getPlacesToVisitByUrl(url);
					if(tPlacesToVisit!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						placesToVisit = new PlacesToVisit();
						placesToVisit.setCategoryId(PLACES_TO_VISIT);
						placesToVisit.setTitle(title);
						placesToVisit.setUrl(url);
						placesToVisit.setDescription(description);
						placesToVisit.setPostedBy(user.getUserId());
						placesToVisit.setLastUpdatedBy(user.getUserId());
						placesToVisit.setCreationTime(new Date());
						placesToVisit.setLastUpdatedTime(new Date());
						placesToVisit.setStatus(ACTIVE);
						if(image1!=null){
							imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_1"+ "." + FilenameUtils.getExtension(image1FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image1, fileToCreate);
					    	placesToVisit.setImage1(imageName);
						}
						if(image2!=null){
							imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_2"+ "." + FilenameUtils.getExtension(image2FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image2, fileToCreate);
					    	placesToVisit.setImage2(imageName);
						}
						if(image3!=null){
							imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_3"+ "." + FilenameUtils.getExtension(image3FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image3, fileToCreate);
					    	placesToVisit.setImage3(imageName);
						}
						if(image4!=null){
							imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_4"+ "." + FilenameUtils.getExtension(image4FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image4, fileToCreate);
					    	placesToVisit.setImage4(imageName);
						}
						placesToVisitBo.addPlacesToVisit(placesToVisit);
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditPlacesToVisitPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				placesToVisit = placesToVisitBo.getPlacesToVisitById(id);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminPlacesToVisit(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0 && title!=null && !title.equals("") && description!=null && !description.equals("")
						&& status!=null && !status.equals("")){
					placesToVisit = placesToVisitBo.getPlacesToVisitById(id);
					if(placesToVisit!=null){
							if(title.length()>200){
								url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}else{
								url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}
							if(!placesToVisit.getUrl().equals(url)){
								tPlacesToVisit = placesToVisitBo.getPlacesToVisitByUrl(url);
		
								if(tPlacesToVisit!=null){
									errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
									return "failure";
								}
							}
							placesToVisit.setCategoryId(PLACES_TO_VISIT);
							placesToVisit.setTitle(title);
							placesToVisit.setUrl(url);
							if(image1!=null){
								imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_1"+ "." + FilenameUtils.getExtension(image1FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image1, fileToCreate);
						    	placesToVisit.setImage1(imageName);
							}
							if(image2!=null){
								imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_2"+ "." + FilenameUtils.getExtension(image2FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image2, fileToCreate);
						    	placesToVisit.setImage2(imageName);
							}
							if(image3!=null){
								imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_3"+ "." + FilenameUtils.getExtension(image3FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image3, fileToCreate);
						    	placesToVisit.setImage3(imageName);
							}
							if(image4!=null){
								imageName = PLACES_TO_VISIT_DIRECTORY + File.separator + id + "_4"+ "." + FilenameUtils.getExtension(image4FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image4, fileToCreate);
						    	placesToVisit.setImage4(imageName);
							}
							placesToVisit.setDescription(description);
							placesToVisit.setPostedBy(user.getUserId());
							placesToVisit.setLastUpdatedBy(user.getUserId());
							placesToVisit.setCreationTime(new Date());
							placesToVisit.setLastUpdatedTime(new Date());
							placesToVisit.setStatus(status);
							placesToVisitBo.updatePlacesToVisit(placesToVisit);
						
					}else {
						errorMsg = "No Place is Found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	@SuppressWarnings("unchecked")
	public String deletePlacesToVisitAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					placesToVisit = placesToVisitBo.getPlacesToVisitById(pId);
					if(placesToVisit!=null){
						placesToVisitBo.deletePlacesToVisit(placesToVisit);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	// Admin Movies List
	
	@SuppressWarnings("unchecked")
	public String getAdminMoviesListPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminMovies";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(MOVIES);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = moviesBo.getMoviesByPageCount(id, categoryId, title, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
						
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					moviesList = moviesBo.getMoviesByPage(id, categoryId, title, null, null, null, null, null, fromDate, toDate,
							status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminViewMoviesPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(MOVIES);
				if(id!=null && id!=0 && categoryList!=null && !categoryList.isEmpty()){
					movies = moviesBo.getMoviesById(id);
					if(movies==null){
						errorMsg = "No Movies Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Movies Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	@SuppressWarnings("unchecked")
	public String getAdminAddMoviesPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(MOVIES);
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Eppty !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminMovies(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			id = moviesBo.getNextMovieId();
			if(user!=null){
				session.put("user", user);
				if(categoryId!=0 && title!=null && !title.equals("") && producer!=null && !producer.equals("")
						&& starring!=null && !starring.equals("") && director!=null && !director.equals("") && music!=null && !music.equals("") 
						&& latestShowTimingsLink!=null && !latestShowTimingsLink.equals("") && description!=null && !description.equals("") && 
						(image1!=null || image2!=null || image3!=null || image4!=null)){
					if(title.length()>200){
						url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}else{
						url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}
					tMovies = moviesBo.getMoviesByUrl(url);
					if(tMovies!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						movies = new Movies();
						movies.setCategoryId(categoryId);
						movies.setTitle(title);
						movies.setUrl(url);
						if(image1!=null){
							imageName = MOVIES_DIRECTORY + File.separator + id + "_1"+ "." + FilenameUtils.getExtension(image1FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image1, fileToCreate);
					    	movies.setImage1(imageName);
						}
						if(image2!=null){
							imageName = MOVIES_DIRECTORY + File.separator + id + "_2"+ "." + FilenameUtils.getExtension(image2FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image2, fileToCreate);
					    	movies.setImage2(imageName);
						}
						if(image3!=null){
							imageName = MOVIES_DIRECTORY + File.separator + id + "_3"+ "." + FilenameUtils.getExtension(image3FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image3, fileToCreate);
					    	movies.setImage3(imageName);
						}
						if(image4!=null){
							imageName = MOVIES_DIRECTORY + File.separator + id + "_4"+ "." + FilenameUtils.getExtension(image4FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image4, fileToCreate);
					    	movies.setImage4(imageName);
						}
						movies.setStarring(starring);
						movies.setMusic(music);
						movies.setDirector(director);
						movies.setProducer(producer);
						movies.setDescription(description);
						movies.setLatestShowTimingsLink(latestShowTimingsLink);
						movies.setPostedBy(user.getUserId());
						movies.setLastUpdatedBy(user.getUserId());
						movies.setCreationTime(new Date());
						movies.setLastUpdatedTime(new Date());
						movies.setStatus(ACTIVE);
						moviesBo.addMovies(movies);
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditMoviesPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(MOVIES);
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Eppty !!";
					return "failure";
				}else{
					movies = moviesBo.getMoviesById(id);
				}		
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminMovies(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(categoryId!=0 && title!=null && !title.equals("") && producer!=null && !producer.equals("")
						&& starring!=null && !starring.equals("") && director!=null && !director.equals("") && music!=null && !music.equals("") 
						&& latestShowTimingsLink!=null && !latestShowTimingsLink.equals("") && description!=null && !description.equals("")
						&& status!=null && !status.equals("")){
					movies = moviesBo.getMoviesById(id);
					if(movies!=null){
							if(title.length()>200){
								url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}else{
								url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}
							if(!movies.getUrl().equals(url)){
								tMovies = moviesBo.getMoviesByUrl(url);
		
								if(tMovies!=null){
									errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
									return "failure";
								}
							}
							movies.setCategoryId(categoryId);
							movies.setTitle(title);
							movies.setUrl(url);
							if(image1!=null){
								imageName = MOVIES_DIRECTORY + File.separator + id + "_1"+ "." + FilenameUtils.getExtension(image1FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image1, fileToCreate);
						    	movies.setImage1(imageName);
							}
							if(image2!=null){
								imageName = MOVIES_DIRECTORY + File.separator + id + "_2"+ "." + FilenameUtils.getExtension(image2FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image2, fileToCreate);
						    	movies.setImage2(imageName);
							}
							if(image3!=null){
								imageName = MOVIES_DIRECTORY + File.separator + id + "_3"+ "." + FilenameUtils.getExtension(image3FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image3, fileToCreate);
						    	movies.setImage3(imageName);
							}
							if(image4!=null){
								imageName = MOVIES_DIRECTORY + File.separator + id + "_4"+ "." + FilenameUtils.getExtension(image4FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image4, fileToCreate);
						    	movies.setImage4(imageName);
							}
							movies.setStarring(starring);
							movies.setMusic(music);
							movies.setDirector(director);
							movies.setProducer(producer);
							movies.setDescription(description);
							movies.setLatestShowTimingsLink(latestShowTimingsLink);
							movies.setPostedBy(user.getUserId());
							movies.setLastUpdatedBy(user.getUserId());
							movies.setCreationTime(new Date());
							movies.setLastUpdatedTime(new Date());
							movies.setStatus(status);
							moviesBo.updateMovies(movies);
						
					}else {
						errorMsg = "No Movie is Found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String deleteMoviesAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					movies = moviesBo.getMoviesById(pId);
					if(movies!=null){
						moviesBo.deleteMovies(movies);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	

	// Admin Interviews List
	
	@SuppressWarnings("unchecked")
	public String getAdminInterviewsListPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminInterviews";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(INTERVIEWS);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = interviewsBo.getInterviewsByPageCount(id, null, title, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					interviewsList = interviewsBo.getInterviewsByPage(id, null, title, null, null, null, null, null, fromDate, toDate, status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminViewInterviewsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0){
					interviews = interviewsBo.getInterviewsById(id);
					if(interviews==null){
						errorMsg = "No Interviews Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Interviews Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminAddInterviewsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminInterviews(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			id = interviewsBo.getNextInterviewId();
			if(user!=null){
				session.put("user", user);
				if(title!=null && !title.equals("") && description!=null && !description.equals("")
						&& (image1!=null || image2!=null || image3!=null || image4!=null)){
					if(title.length()>200){
						url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}else{
						url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}
					tInterviews = interviewsBo.getInterviewsByUrl(url);
					if(tInterviews!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						interviews = new Interviews();
						interviews.setCategoryId(INTERVIEWS);
						interviews.setTitle(title);
						interviews.setUrl(url);
						if(image1!=null){
							imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_1"+ "." + FilenameUtils.getExtension(image1FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image1, fileToCreate);
					    	interviews.setImage1(imageName);
						}
						if(image2!=null){
							imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_2"+ "." + FilenameUtils.getExtension(image2FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image2, fileToCreate);
					    	interviews.setImage2(imageName);
						}
						if(image3!=null){
							imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_3"+ "." + FilenameUtils.getExtension(image3FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image3, fileToCreate);
					    	interviews.setImage3(imageName);
						}
						if(image4!=null){
							imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_4"+ "." + FilenameUtils.getExtension(image4FileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image4, fileToCreate);
					    	interviews.setImage4(imageName);
						}
						interviews.setDescription(description);
						interviews.setPostedBy(user.getUserId());
						interviews.setLastUpdatedBy(user.getUserId());
						interviews.setCreationTime(new Date());
						interviews.setLastUpdatedTime(new Date());
						interviews.setStatus(ACTIVE);
						interviewsBo.addInterviews(interviews);
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditInterviewsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				interviews = interviewsBo.getInterviewsById(id);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminInterviews(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0 && title!=null && !title.equals("") && 
						description!=null && !description.equals("") && status!=null && !status.equals("")){
					interviews = interviewsBo.getInterviewsById(id);
					if(interviews!=null){
							if(title.length()>200){
								url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}else{
								url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}
							if(!interviews.getUrl().equals(url)){
								tInterviews = interviewsBo.getInterviewsByUrl(url);
		
								if(tInterviews!=null){
									errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
									return "failure";
								}
							}
							interviews.setCategoryId(INTERVIEWS);
							interviews.setTitle(title);
							interviews.setUrl(url);
							if(image1!=null){
								imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_1"+ "." + FilenameUtils.getExtension(image1FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image1, fileToCreate);
						    	interviews.setImage1(imageName);
							}
							if(image2!=null){
								imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_2"+ "." + FilenameUtils.getExtension(image2FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image2, fileToCreate);
						    	interviews.setImage2(imageName);
							}
							if(image3!=null){
								imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_3"+ "." + FilenameUtils.getExtension(image3FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image3, fileToCreate);
						    	interviews.setImage3(imageName);
							}
							if(image4!=null){
								imageName = INTERVIEWS_DIRECTORY + File.separator + id + "_4"+ "." + FilenameUtils.getExtension(image4FileName);
								File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
						    	FileUtils.copyFile(image4, fileToCreate);
						    	interviews.setImage4(imageName);
							}
							interviews.setDescription(description);
							interviews.setPostedBy(user.getUserId());
							interviews.setLastUpdatedBy(user.getUserId());
							interviews.setCreationTime(new Date());
							interviews.setLastUpdatedTime(new Date());
							interviews.setStatus(status);
							interviewsBo.updateInterviews(interviews);
						}else {
						errorMsg = "No Interview is Found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	@SuppressWarnings("unchecked")
	public String deleteInterviewsAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					interviews = interviewsBo.getInterviewsById(pId);
					if(interviews!=null){
						interviewsBo.deleteInterviews(interviews);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	// Admin FAQ List
	
	@SuppressWarnings("unchecked")
	public String getAdminFAQListPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminFaq";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.getCategoryByParentCategoryId(FAQ);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = faqBo.getFaqByPageCount(id, null, title, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					faqList = faqBo.getFaqByPage(id, null, title, null, null, null, null, null, fromDate, toDate, status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminViewFAQPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0){
					faq = faqBo.getFaqById(id);
					if(faq==null){
						errorMsg = "No FAQ Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "FAQ Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminAddFAQPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminFAQ(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(title!=null && !title.equals("") && description!=null && !description.equals("")){
					if(title.length()>200){
						url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}else{
						url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}
					tFaq = faqBo.getFaqByUrl(url);
					if(tFaq!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						faq = new Faq();
						faq.setCategoryId(FAQ);
						faq.setTitle(title);
						faq.setUrl(url);
						faq.setDescription(description);
						faq.setPostedBy(user.getUserId());
						faq.setLastUpdatedBy(user.getUserId());
						faq.setCreationTime(new Date());
						faq.setLastUpdatedTime(new Date());
						faq.setStatus(ACTIVE);
						faqBo.addFaq(faq);
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditFAQPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				faq = faqBo.getFaqById(id);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminFAQ(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(title!=null && !title.equals("") && description!=null && !description.equals("")
						&& status!=null && !status.equals("")){
					faq = faqBo.getFaqById(id);
					if(faq!=null){
							if(title.length()>200){
								url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}else{
								url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}
							if(!faq.getUrl().equals(url)){
								tFaq = faqBo.getFaqByUrl(url);
		
								if(tFaq!=null){
									errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
									return "failure";
								}
							}
							faq.setCategoryId(FAQ);
							faq.setTitle(title);
							faq.setUrl(url);
							faq.setDescription(description);
							faq.setPostedBy(user.getUserId());
							faq.setLastUpdatedBy(user.getUserId());
							faq.setCreationTime(new Date());
							faq.setLastUpdatedTime(new Date());
							faq.setStatus(status);
							faqBo.updateFaq(faq);
						}else {
						errorMsg = "No FAQ is found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	@SuppressWarnings("unchecked")
	public String deleteFAQAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					faq = faqBo.getFaqById(pId);
					if(faq!=null){
						faqBo.deleteFaq(faq);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	// Admin Ads List
	
	@SuppressWarnings("unchecked")
	public String getAdminAdsListPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminAds";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.listCategory();
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = adBo.getAdByPageCount(id, categoryId, adType, null, null, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					adList = adBo.getAdByPage(id, categoryId, adType, null, null, null, null, null, null, null, fromDate, toDate, status, startNo, pageSize);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminViewAdsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(id!=null && id!=0){
					ad = adBo.getAdById(id);
					if(ad.getCategoryId()==0){
						category = new Category();
						category.setCategoryName("Home Page");
					}else{
						category = categoryBo.getCategoryById(ad.getCategoryId());
					}
					if(ad==null){
						errorMsg = "No Ad Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Ad Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminAddAdsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.listCategory();
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Empty !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminAds(){
		try{
			session = ActionContext.getContext().getSession();
			id = adBo.getNextAdId();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);				
				if(id!=null && id!=0 && adType!=null && !adType.equals("") && image!=null && description!=null && !description.equals("")
						&& imageAltMsg!=null && !imageAltMsg.equals("") && linkUrl!=null && !linkUrl.equals("") && priority!=null && !priority.equals("") ){
					ad = new Ad();
					ad.setId(id);
					ad.setCategoryId(categoryId);
					ad.setAdType(adType);
					if(image!=null){
						imageName = ADS_DIRECTORY + File.separator + id + "." + FilenameUtils.getExtension(imageFileName);
						File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
				    	FileUtils.copyFile(image, fileToCreate);
				    	ad.setImage(imageName);
					}
					ad.setImageAltMsg(imageAltMsg);
					ad.setLinkUrl(linkUrl);
					ad.setPriority(priority);
					ad.setAdDescription(description);
					ad.setPostedBy(user.getUserId());
					ad.setLastUpdatedBy(user.getUserId());
					ad.setCreationTime(new Date());
					ad.setLastUpdatedTime(new Date());
					ad.setStatus(ACTIVE);
					adBo.addAd(ad);
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditAdsPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				categoryList = categoryBo.listCategory();
				if(categoryList==null || categoryList.isEmpty()){
					errorMsg = "Category List is Empty !!";
					return "failure";
				}else {
					ad = adBo.getAdById(id);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminAds(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(adType!=null && !adType.equals("") && description!=null && !description.equals("")
						&& imageAltMsg!=null && !imageAltMsg.equals("") && linkUrl!=null && !linkUrl.equals("") && priority!=null && !priority.equals("")
						&& status!=null && !status.equals("")){
					ad = adBo.getAdById(id);
					if(ad!=null){
						ad.setCategoryId(categoryId);
						ad.setAdType(adType);
						if(image!=null){
							imageName = ADS_DIRECTORY + File.separator + id + "." + FilenameUtils.getExtension(imageFileName);
							File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
					    	FileUtils.copyFile(image, fileToCreate);
					    	ad.setImage(imageName);
						}
						ad.setImageAltMsg(imageAltMsg);
						ad.setLinkUrl(linkUrl);
						ad.setPriority(priority);
						ad.setAdDescription(description);
						ad.setPostedBy(user.getUserId());
						ad.setLastUpdatedBy(user.getUserId());
						ad.setCreationTime(new Date());
						ad.setLastUpdatedTime(new Date());
						ad.setStatus(status);
						adBo.updateAd(ad);
				}else {
						errorMsg = "No Ad is found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String deleteAdminAds(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					ad = adBo.getAdById(pId);
					if(ad!=null){
						adBo.deleteAd(ad);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	// Admin All Categories
	
	@SuppressWarnings("unchecked")
	public String getAdminAllCategoriesPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminAllCategories";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				parentCategoriesList = categoryBo.getCategoryByParentCategoryId(new Long(INACTIVE));
				totalSize = categoryBo.getCategoryByPageCount(id, categoryName, null, null, null, null, null, parentCategoryId, status);
				if(totalSize!=null && totalSize>0){
										
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					categoryList = categoryBo.getCategoryByPage(id, categoryName, null, null, null, null, null, parentCategoryId, status, startNo, pageSize);
					if(categoryList!=null && !categoryList.isEmpty()){
						for(Category tCategory : categoryList){
							if(tCategory.getParentCategoryId()!=0){
								tCategory.setParentCategory(categoryBo.getCategoryById(tCategory.getParentCategoryId()));
							}
						}
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getAdminViewAllCategoriesPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(categoryId!=0){
					category = categoryBo.getCategoryById(categoryId);
					if(category.getIsChildCategory()==1){
						category.setParentCategory(categoryBo.getCategoryById(category.getParentCategoryId()));
					}
					if(category==null){
						errorMsg = "No Category Found with the Given Id !!";
						return ERROR;
					}
				}else{
					errorMsg = "Category Id can't be Empty / NULL !!";
					return ERROR;
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminAddCategoriesPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminCategories(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(parentCategoryId!=0 && categoryName!=null && !categoryName.equals("") && title!=null && !title.equals("")
						&& metaKeywords!=null && !metaKeywords.equals("") && metaDescription!=null && !metaDescription.equals("") && priority!=null && !priority.equals("") ){
					if(title.length()>200){
						url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}else{
						url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
					}
					tCategory = categoryBo.getCategoryByCategoryUrlName(url);
					if(tCategory!=null){
						errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
						return "failure";
					}else{
						category = new Category();
						category.setCategoryName(categoryName);
						category.setCategoryUrlName(categoryUrlName);
						category.setTitle(title);
						category.setCategoryUrlName(url);	
						category.setMetaKeywords(metaKeywords);
						category.setPriority(priority);
						category.setMetaDescription(metaDescription);
						category.setIsParentCategory(INACTIVE);
						category.setIsChildCategory(ACTIVE);
						category.setParentCategoryId(parentCategoryId);
						category.setStatus(ACTIVE);
						categoryBo.addCategory(category);
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAdminEditCategoriesPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminEditCategoriesPage";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				category = categoryBo.getCategoryById(categoryId);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminCategories(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(parentCategoryId!=0 && categoryName!=null && !categoryName.equals("") && title!=null && !title.equals("")
						&& metaKeywords!=null && !metaKeywords.equals("") && metaDescription!=null && !metaDescription.equals("") && priority!=null && !priority.equals("") 
						&& status!=null && !status.equals("") ){
					category = categoryBo.getCategoryById(categoryId);
					if(category!=null){
							if(title.length()>200){
								url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}else{
								url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
							}
							if(!category.getCategoryUrlName().equals(url)){
								tCategory = categoryBo.getCategoryByCategoryUrlName(url);
		
								if(tCategory!=null){
									errorMsg = "Title with same URL is Already Exist.. Choose a New Title !!";
									return "failure";
								}
							}
							category.setCategoryName(categoryName);
							category.setTitle(title);
							category.setCategoryUrlName(url);
							category.setMetaKeywords(metaKeywords);
							category.setPriority(priority);
							category.setMetaDescription(metaDescription);
							category.setIsParentCategory(INACTIVE);
							category.setIsChildCategory(ACTIVE);
							category.setParentCategoryId(parentCategoryId);
							category.setStatus(status);
							categoryBo.updateCategory(category);
						}else {
						errorMsg = "No Category is found with this ID !!!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String deleteAdminCategories(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(categoryId == 0){
					errorMsg = "Invalid Id";
				}else{
					category = categoryBo.getCategoryById(categoryId);
					if(category!=null){
						categoryBo.deleteCategory(category);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Contact-Us Admin
	
	@SuppressWarnings("unchecked")
	public String getContactusAdminPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			urlPage = "contactusAdmin";
			if(user!=null){
				session.put("user", user);
				if(dateFrom!=null && !dateFrom.equals("")){
					fromDate = DateHelper.getDateFromString(dateFrom);
				}
				if(dateTo!=null && !dateTo.equals("")){
					toDate = DateHelper.getDateFromString(dateTo);
				}
				totalSize = contactusBo.getContactusListByPageCount(contactId, name, emailId, null, null, null, null, null, fromDate, toDate, status);
				if(totalSize!=null && totalSize>0){
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					contactusList = contactusBo.getContactusListByPage(contactId, name, emailId, null, null, null, null, null, fromDate, toDate, status, startNo, pageSize);
				}	
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getViewContactusAdminPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(contactId==null || contactId.equals("") || contactId == 0){
					errorMsg = "Invalid Contact Id";
					return ERROR;
				}else{
					contactus = contactusBo.getContactus(contactId);
					if(contactus==null){
						errorMsg = "Does not exist";
						return ERROR;
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String downloadAttachment() throws Exception {
		if(contactId!=null && contactId!=0){
			contactus = contactusBo.getContactus(contactId);
			attachment = contactus.getAttachment();
			inputStream = new FileInputStream(new File(IMAGE_DIRECTORY + File.separator + attachment));
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String deleteContactusAdmin(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(contactId==null || contactId.equals("") || contactId == 0){
					errorMsg = "Invalid Id";
				}else{
					contactus = contactusBo.getContactus(contactId);
					if(contactus!=null){
						contactusBo.deleteContactus(contactus);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	// Admins List
	
	@SuppressWarnings("unchecked")
	public String getListOfAdminsPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminsList";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(user.getDesignation()==1){
					adminsList = userBo.listUser();
				}else {
					adminsList = userBo.getUsersByDesignation(2);
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String searchAdmins(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminsList";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				adminsList = userBo.searchUser(userId, loginName, contactNo, status);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getViewListOfAdminPage(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(userId==null || userId.equals("") || userId == 0){
					errorMsg = "Invalid User Id";
					return ERROR;
				}else{
					user = userBo.getUser(userId);
					if(user==null){
						errorMsg = "Does not exist";
						return ERROR;
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String addAdminDetails(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String saveAdminDetails(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(firstName!=null && !firstName.equals("") && lastName!=null && !lastName.equals("") && emailId!=null && !emailId.equals("") && phone!=null && !phone.equals("") && 
						password!=null && !password.equals("") && address!=null && !address.equals("")){
					
						tuser = new User();
						tuser.setLoginName(loginName);
						tuser.setFirstName(firstName);
						tuser.setLastName(lastName);
						tuser.setLoginName(emailId);
						tuser.setContactNo(phone);
						tuser.setPassword(password);
						tuser.setAddress(address);
						tuser.setDesignation(PENDING);
						tuser.setTime(new Date());
						tuser.setStatus(ACTIVE);
						userBo.addUser(tuser);
				}else{
					errorMsg = "Invalid Form Fields !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password !!";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String editAdminDetails(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user==null){
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}else{
				if(userId==null || userId==0){
					errorMsg = "Invalid User Id";
				}else{
					tuser = userBo.getUser(userId);
					if(tuser==null){
						errorMsg = "User not found with the given User Id";
						return "failure";
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String updateAdminDetails(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(userId!=null && userId!=0 && firstName!=null && !firstName.equals("") && 
						lastName!=null && !lastName.equals("") &&
						emailId!=null && !emailId.equals("") && phone!=null && !phone.equals("") && 
						password!=null && !password.equals("") && address!=null && !address.equals("")){
					tuser = userBo.getUser(userId);
					if(tuser!=null){
						tuser.setFirstName(firstName);
						tuser.setLastName(lastName);
						tuser.setLoginName(emailId);
						tuser.setContactNo(phone);
						tuser.setPassword(password);
						tuser.setAddress(address);
						tuser.setTime(new Date());
						tuser.setStatus(status);
						userBo.updateUser(tuser);
					}else{
						errorMsg = "No Admin found with the given Id !!";
						return "failure";
					}
				}else{
					errorMsg = "Invalid Form Fields !!";
					return "failure";
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password !!";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String deleteListOfAdmins(){
		try{
			session = ActionContext.getContext().getSession();
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
				if(pId==null || pId.equals("") || pId == 0){
					errorMsg = "Invalid Id";
				}else{
					user = userBo.getUser(pId.intValue());
					if(user!=null){
						userBo.deleteUser(user);
					}else{
						errorMsg = "Does not exist!!";
					}
				}
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Admins Account Details
	
	@SuppressWarnings("unchecked")
	public String getAdminAccountDetailsPage(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "adminAccountDetails";
			user = (User) session.get("user");
			if(user!=null){
				session.put("user", user);
			}else{
				urlPage = "login";
				errorMsg = "Invalid UserName / Password";
				return "failure";
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Contactus> getContactusList() {
		return contactusList;
	}

	public void setContactusList(List<Contactus> contactusList) {
		this.contactusList = contactusList;
	}

	public Long getContactId() {
		return contactId;
	}

	public void setContactId(Long contactId) {
		this.contactId = contactId;
	}

	public Contactus getContactus() {
		return contactus;
	}

	public void setContactus(Contactus contactus) {
		this.contactus = contactus;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getDatefrom() {
		return datefrom;
	}

	public void setDatefrom(String datefrom) {
		this.datefrom = datefrom;
	}

	public String getDateto() {
		return dateto;
	}

	public void setDateto(String dateto) {
		this.dateto = dateto;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(Integer startRecord) {
		this.startRecord = startRecord;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}

	public String getDateTo() {
		return dateTo;
	}

	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public Integer getAdType() {
		return adType;
	}

	public void setAdType(Integer adType) {
		this.adType = adType;
	}

	public List<User> getAdminsList() {
		return adminsList;
	}

	public void setAdminsList(List<User> adminsList) {
		this.adminsList = adminsList;
	}

	public List<Category> getParentCategoriesList() {
		return parentCategoriesList;
	}

	public void setParentCategoriesList(List<Category> parentCategoriesList) {
		this.parentCategoriesList = parentCategoriesList;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Long getParentCategoryId() {
		return parentCategoryId;
	}

	public void setParentCategoryId(Long parentCategoryId) {
		this.parentCategoryId = parentCategoryId;
	}

	public Long getPId() {
		return pId;
	}

	public void setPId(Long pId) {
		this.pId = pId;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public User getTuser() {
		return tuser;
	}

	public void setTuser(User tuser) {
		this.tuser = tuser;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getStarring() {
		return starring;
	}

	public void setStarring(String starring) {
		this.starring = starring;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getMusic() {
		return music;
	}

	public void setMusic(String music) {
		this.music = music;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getLatestShowTimingsLink() {
		return latestShowTimingsLink;
	}

	public void setLatestShowTimingsLink(String latestShowTimingsLink) {
		this.latestShowTimingsLink = latestShowTimingsLink;
	}

	public String getMetaKeywords() {
		return metaKeywords;
	}

	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}

	public String getMetaDescription() {
		return metaDescription;
	}

	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}

	public String getImageAltMsg() {
		return imageAltMsg;
	}

	public void setImageAltMsg(String imageAltMsg) {
		this.imageAltMsg = imageAltMsg;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public String getCategoryUrlName() {
		return categoryUrlName;
	}

	public void setCategoryUrlName(String categoryUrlName) {
		this.categoryUrlName = categoryUrlName;
	}

	public Integer getActiveAccomodation() {
		return activeAccomodation;
	}

	public void setActiveAccomodation(Integer activeAccomodation) {
		this.activeAccomodation = activeAccomodation;
	}

	public Integer getPendingAccomodation() {
		return pendingAccomodation;
	}

	public void setPendingAccomodation(Integer pendingAccomodation) {
		this.pendingAccomodation = pendingAccomodation;
	}

	public Integer getActiveAuto() {
		return activeAuto;
	}

	public void setActiveAuto(Integer activeAuto) {
		this.activeAuto = activeAuto;
	}

	public Integer getPendingAuto() {
		return pendingAuto;
	}

	public void setPendingAuto(Integer pendingAuto) {
		this.pendingAuto = pendingAuto;
	}

	public Integer getActiveCatering() {
		return activeCatering;
	}

	public void setActiveCatering(Integer activeCatering) {
		this.activeCatering = activeCatering;
	}

	public Integer getPendingCatering() {
		return pendingCatering;
	}

	public void setPendingCatering(Integer pendingCatering) {
		this.pendingCatering = pendingCatering;
	}

	public Integer getActiveChildCare() {
		return activeChildCare;
	}

	public void setActiveChildCare(Integer activeChildCare) {
		this.activeChildCare = activeChildCare;
	}

	public Integer getPendingChildCare() {
		return pendingChildCare;
	}

	public void setPendingChildCare(Integer pendingChildCare) {
		this.pendingChildCare = pendingChildCare;
	}

	public Integer getActiveForSale() {
		return activeForSale;
	}

	public void setActiveForSale(Integer activeForSale) {
		this.activeForSale = activeForSale;
	}

	public Integer getPendingForSale() {
		return pendingForSale;
	}

	public void setPendingForSale(Integer pendingForSale) {
		this.pendingForSale = pendingForSale;
	}

	public Integer getActiveJobs() {
		return activeJobs;
	}

	public void setActiveJobs(Integer activeJobs) {
		this.activeJobs = activeJobs;
	}

	public Integer getPendingJobs() {
		return pendingJobs;
	}

	public void setPendingJobs(Integer pendingJobs) {
		this.pendingJobs = pendingJobs;
	}

	public Integer getActiveLadiesCorner() {
		return activeLadiesCorner;
	}

	public void setActiveLadiesCorner(Integer activeLadiesCorner) {
		this.activeLadiesCorner = activeLadiesCorner;
	}

	public Integer getPendingLadiesCorner() {
		return pendingLadiesCorner;
	}

	public void setPendingLadiesCorner(Integer pendingLadiesCorner) {
		this.pendingLadiesCorner = pendingLadiesCorner;
	}

	public Integer getActiveTravelCompanion() {
		return activeTravelCompanion;
	}

	public void setActiveTravelCompanion(Integer activeTravelCompanion) {
		this.activeTravelCompanion = activeTravelCompanion;
	}

	public Integer getPendingTravelCompanion() {
		return pendingTravelCompanion;
	}

	public void setPendingTravelCompanion(Integer pendingTravelCompanion) {
		this.pendingTravelCompanion = pendingTravelCompanion;
	}

	public Integer getActiveOthers() {
		return activeOthers;
	}

	public void setActiveOthers(Integer activeOthers) {
		this.activeOthers = activeOthers;
	}

	public Integer getPendingOthers() {
		return pendingOthers;
	}

	public void setPendingOthers(Integer pendingOthers) {
		this.pendingOthers = pendingOthers;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Propertie getPropertie() {
		return propertie;
	}

	public void setPropertie(Propertie propertie) {
		this.propertie = propertie;
	}

	public YellowPages getTyellowPages() {
		return tyellowPages;
	}

	public void setTyellowPages(YellowPages tyellowPages) {
		this.tyellowPages = tyellowPages;
	}

	public Events gettEvents() {
		return tEvents;
	}

	public void settEvents(Events tEvents) {
		this.tEvents = tEvents;
	}

	public PlacesToVisit gettPlacesToVisit() {
		return tPlacesToVisit;
	}

	public void settPlacesToVisit(PlacesToVisit tPlacesToVisit) {
		this.tPlacesToVisit = tPlacesToVisit;
	}

	public Movies gettMovies() {
		return tMovies;
	}

	public void settMovies(Movies tMovies) {
		this.tMovies = tMovies;
	}

	public Offers gettOffers() {
		return tOffers;
	}

	public void settOffers(Offers tOffers) {
		this.tOffers = tOffers;
	}

	public Interviews gettInterviews() {
		return tInterviews;
	}

	public void settInterviews(Interviews tInterviews) {
		this.tInterviews = tInterviews;
	}

	public Faq gettFaq() {
		return tFaq;
	}

	public void settFaq(Faq tFaq) {
		this.tFaq = tFaq;
	}

	public Category gettCategory() {
		return tCategory;
	}

	public void settCategory(Category tCategory) {
		this.tCategory = tCategory;
	}

	public Classifieds gettClassifieds() {
		return tClassifieds;
	}

	public void settClassifieds(Classifieds tClassifieds) {
		this.tClassifieds = tClassifieds;
	}

}
