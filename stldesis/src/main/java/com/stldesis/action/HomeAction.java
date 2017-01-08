package com.stldesis.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.stldesis.model.Ad;
import com.stldesis.model.Classifieds;
import com.stldesis.model.Contactus;
import com.stldesis.model.Propertie;
import com.stldesis.model.Verification;
import com.stldesis.util.StldesisMail;

public class HomeAction extends MasterAction{

	private static final long serialVersionUID = -5984457769180421156L;

	private static final Logger log = Logger.getLogger(HomeAction.class);
		
	//conatctus form
	private String adIdLink;
	private String subject;
	private String message;
	
	//Ads
	private Integer adType;
	
	
	//Lists
	private List<Ad> homeScrollAdList;
	private List<Ad> homePageRightAdList;
	private List<Ad> homePageLeftAdList;
	private List<Ad> homeRightFixedAdList;
	private List<Ad> homeBottomAdList;
	
	//Category
	private String subCategory;
	private String url;
	private Propertie propertie;
	private Classifieds tClassifieds;
	
	// Home Page
	public String getHomePage(){
		try{
			getGlobalContent();
			urlPage = "home";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homeRightFixedAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_FIXED_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homeScrollAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_SLIDER_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homeBottomAdList = adBo.getAdByPage(null, HOME_PAGE, BOTTOM_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	// Post Free Ad
	
	public String getPostFreeAdPage(){
		try{
			getGlobalContent();
			urlPage = "postFreeAd";
			categoryList = categoryBo.getCategoryByParentCategoryId(CLASSIFIEDS);
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String sendVerificationEmail(){
		try{
			session = ActionContext.getContext().getSession();
			urlPage = "postFreeAd";
			if(emailId!=null && !emailId.equals("")){

				UUID uuid = UUID.randomUUID();
				String verificationCode = uuid.toString().substring(0, 6);
				Verification verification = verificationBo.getVerificationByMailId(emailId);
				if(verification!=null){
					verification.setVerificationCode(verificationCode);
					verificationBo.updateVerification(verification);
				}else{
					verification = new Verification();
					verification.setEmailId(emailId);
					verification.setVerificationCode(verificationCode);
					verificationBo.addVerification(verification);
				}
				
				propertie = propertieBo.getPropertie();
				if(propertie!=null){
					
					String verificationEmailSubject = propertie.getVerificationEmailSubject().replaceAll("#email#", emailId);
					String verificationEmailBody = propertie.getVerificationEmailBody().replaceAll("#emailId#", emailId).replaceAll("#verificationCode#", verificationCode);
					
					StldesisMail.postMail(emailId, propertie.getAdminId(), verificationEmailSubject, 
							verificationEmailBody, propertie.getSmtpHost(), propertie.getSmtpPort1(), propertie.getSmtpPort2(), 
							propertie.getSmtpSocketFactory(), propertie.getSmtpSocketFactoryport(), propertie.getSmtpAuth(), 
							propertie.getSmtpUserid(), propertie.getSmtpPassword(), propertie.getAdminId());		
				}
			}
			msg = "An Email has sent to the given Mail-Id. Please Enter the Verification code which you recieved!!";
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			errorMsg = "Error Occured in sending the Verification Code. Please Retry After some time !!";
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String uploadPostFreeAd(){
		try{
			getGlobalContent();
			urlPage = "postFreeAd";
			id = classifiedsBo.getNextClassifiedsId();
			imagesList = new ArrayList<String>();
			if(emailId!=null && !emailId.equals("") && securitycode!=null && !securitycode.equals("")){		
				boolean flag = verificationBo.verifyEmail(emailId, securitycode);
				
				if(flag){
					if(categoryId!=0 && title!=null && !title.equals("") && price!=null && price!=new BigDecimal(0) && 
							name!=null && !name.equals("") && phone!=null && !phone.equals("") && description!=null && !description.equals("") && 
							address!=null && !address.equals("") && (image1!=null || image2!=null || image3!=null || image4!=null)){
						if(title.length()>200){
							url = title.substring(0,200).replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
						}else{
							url = title.replaceAll("[^a-zA-Z0-9]", "_").toLowerCase();
						}
						tClassifieds = classifiedsBo.getClassifiedsByUrl(url);
						if(tClassifieds!=null){
							errorMsg = "This Title is already in Use.. Choose another Title.. !!";
							return INPUT;
						}else{
							classifieds = new Classifieds();
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
							classifieds.setApprovedBy(INACTIVE);
							classifieds.setLastUpdatedBy(INACTIVE);
							classifieds.setAdminName("");
							classifieds.setLastUpdatedTime(new Date());
							classifieds.setStatus(PENDING);
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
						    classifiedsBo.addClassifieds(classifieds);
						    verificationBo.deleteVerificationByEmail(emailId);
						    
						    propertie = propertieBo.getPropertie();
							if(propertie!=null){
								
								String adPostedEmailSubject = propertie.getAdPostedEmailSubject().replaceAll("#email#", emailId);
								String adPostedEmailBody = propertie.getAdPostedEmailBody().replaceAll("#name#", name).replaceAll("#title#", title).replaceAll("#adId#", id+"");
								
								StldesisMail.postMail(emailId, propertie.getAdminId(), adPostedEmailSubject, 
										adPostedEmailBody, propertie.getSmtpHost(), propertie.getSmtpPort1(), propertie.getSmtpPort2(), 
										propertie.getSmtpSocketFactory(), propertie.getSmtpSocketFactoryport(), propertie.getSmtpAuth(), 
										propertie.getSmtpUserid(), propertie.getSmtpPassword(), propertie.getAdminId());		
							}
							
						    msg = "Your Ad has been Submitted Successfully. Now it is in pending for Admin Verification !!";
							return SUCCESS;
						}
					}else{
						errorMsg = "Invalid Form Fields !!";
						return INPUT;
					}
				}else{
					errorMsg = "Invalid Verification Code !!";
					return INPUT;
				}
			}else{
				errorMsg = "Email Id / Verification Code cant be Empty!!";
				return INPUT;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
	}

	//Classifieds Page
	
	public String getClassifiedsPage(){
		try{
			getGlobalContent();
			urlPage = "classifieds";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, category.getCategoryId(), LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageLeftAdList==null || homePageLeftAdList.isEmpty()){
				homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			homePageRightAdList = adBo.getAdByPage(null, category.getCategoryId(), RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageRightAdList==null || homePageRightAdList.isEmpty()){
				homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			if(category!=null){
				totalSize = classifiedsBo.getClassifiedsByPageCount(null, category.getCategoryId(), 
						null, null, null, null, null, null, null, null, null, null, null, null, null, ACTIVE);
				if(totalSize!=null && totalSize>0){
					
					if(totalSize>MAX_SIZE){
						totalSize = MAX_SIZE;
					}
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					classifiedsList = classifiedsBo.getClassifiedsByPage(null, category.getCategoryId(), 
						null, null, null, null, null, null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
				}
						
			}else{
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String getClassifiedsDetailsPage(){
		try{
			getGlobalContent();
			urlPage = "classifieds-details";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, category.getCategoryId(), LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageLeftAdList==null || homePageLeftAdList.isEmpty()){
				homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			homePageRightAdList = adBo.getAdByPage(null, category.getCategoryId(), RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageRightAdList==null || homePageRightAdList.isEmpty()){
				homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			if(url!=null && !url.equals("")){
				classifieds = classifiedsBo.getClassifiedsByUrl(url);
				if(classifieds==null){
					return ERROR;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//Yellow Pages
	
	public String getYellowPagesPage(){
		try{
			getGlobalContent();
			urlPage = "yellowPages";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, category.getCategoryId(), LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageLeftAdList==null || homePageLeftAdList.isEmpty()){
				homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			homePageRightAdList = adBo.getAdByPage(null, category.getCategoryId(), RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageRightAdList==null || homePageRightAdList.isEmpty()){
				homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			if(category!=null){
				totalSize = yellowPagesBo.getYellowPagesByPageCount(null, category.getCategoryId(), 
						null, null, null, null, null, null, null, null, null, null, null, null, null, ACTIVE);
				if(totalSize!=null && totalSize>0){
					
					if(totalSize>MAX_SIZE){
						totalSize = MAX_SIZE;
					}
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					yellowPagesList = yellowPagesBo.getYellowPagesByPage(null, category.getCategoryId(), 
							null, null, null, null, null, null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
				}
						
			}else{
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String getYellowPagesDetailsPage(){
		try{
			getGlobalContent();
			urlPage = "yellowPages-details";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, category.getCategoryId(), LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageLeftAdList==null || homePageLeftAdList.isEmpty()){
				homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			homePageRightAdList = adBo.getAdByPage(null, category.getCategoryId(), RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageRightAdList==null || homePageRightAdList.isEmpty()){
				homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			if(url!=null && !url.equals("")){
				yellowPages = yellowPagesBo.getYellowPagesByUrl(url);
				if(yellowPages==null){
					return ERROR;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//Events Page
	
	public String getEventPage(){
		try{
			getGlobalContent();
			urlPage = "event";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			totalSize = eventsBo.getEventsByPageCount(null, EVENTS, null, null, null, null, null, 
					null, null, null, null, null, null, null, null, null, ACTIVE);
			if(totalSize!=null && totalSize>0){
				
				if(totalSize>MAX_SIZE){
					totalSize = MAX_SIZE;
				}
				
				if(pageNo==null || pageNo==0){
					pageNo = 1;
				}
				noOfPages = totalSize/pageSize;
				if((totalSize%pageSize) > 0){
					noOfPages++;
				}
				
				startNo = (pageNo-1)*pageSize;
				eventsList = eventsBo.getEventsByPage(null, EVENTS, null, null, null, null, null, null, 
						null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String getEventDetailsPage(){
		try{
			getGlobalContent();
			urlPage = "event-details";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(url!=null && !url.equals("")){
				event = eventsBo.getEventsByUrl(url);
				if(event==null){
					return ERROR;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//Offers Page
	
	public String getOffersPage(){
		try{
			getGlobalContent();
			urlPage = "offers";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, category.getCategoryId(), LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageLeftAdList==null || homePageLeftAdList.isEmpty()){
				homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			homePageRightAdList = adBo.getAdByPage(null, category.getCategoryId(), RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageRightAdList==null || homePageRightAdList.isEmpty()){
				homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			if(category!=null){
				totalSize = offersBo.getOffersByPageCount(null, category.getCategoryId(), 
						null, null, null, null, null, null, null, null, null, ACTIVE);
				if(totalSize!=null && totalSize>0){
					if(totalSize>MAX_SIZE){
						totalSize = MAX_SIZE;
					}
					
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					offersList = offersBo.getOffersByPage(null, category.getCategoryId(), 
							null, null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String getOffersDetailsPage(){
		try{
			getGlobalContent();
			urlPage = "offers-details";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, category.getCategoryId(), LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageLeftAdList==null || homePageLeftAdList.isEmpty()){
				homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			homePageRightAdList = adBo.getAdByPage(null, category.getCategoryId(), RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageRightAdList==null || homePageRightAdList.isEmpty()){
				homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			if(url!=null && !url.equals("")){
				offers = offersBo.getOffersByUrl(url);
				if(offers==null){
					return ERROR;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//Places To Visit Page

	public String getPlacesToVisitPage(){
		try{
			getGlobalContent();
			urlPage = "placesToVisit";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			totalSize = placesToVisitBo.getPlacesToVisitByPageCount(null, PLACES_TO_VISIT, 
					null, null, null, null, null, null, null, null, ACTIVE);
			if(totalSize!=null && totalSize>0){
				if(totalSize > MAX_SIZE){
					totalSize = MAX_SIZE ;
				}
				
				if(pageNo==null || pageNo==0){
					pageNo = 1;
				}
				noOfPages = totalSize/pageSize;
				if((totalSize%pageSize) > 0){
					noOfPages++;
				}
				
				startNo = (pageNo-1)*pageSize;
				placesToVisitList = placesToVisitBo.getPlacesToVisitByPage(null, PLACES_TO_VISIT,
						null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String getPlacesToVisitDetailPage(){
		try{
			getGlobalContent();
			urlPage = "placesToVisit-details";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(url!=null){
				placesToVisit = placesToVisitBo.getPlacesToVisitByUrl(url);
				if(placesToVisit==null){
					return ERROR;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//Movies Page

	public String getMoviesPage(){
		try{
			getGlobalContent();
			urlPage = "movies";
			category = categoryBo.getCategoryByCategoryUrlName(subCategory);
			homePageLeftAdList = adBo.getAdByPage(null, category.getCategoryId(), LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageLeftAdList==null || homePageLeftAdList.isEmpty()){
				homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			homePageRightAdList = adBo.getAdByPage(null, category.getCategoryId(), RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(homePageRightAdList==null || homePageRightAdList.isEmpty()){
				homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			}
			if(category!=null){
				totalSize = moviesBo.getMoviesByPageCount(null, category.getCategoryId(),
						null, null, null, null, null, null, null, null, ACTIVE);
				if(totalSize!=null && totalSize>0){
					if(totalSize>MAX_SIZE){
						totalSize = MAX_SIZE;
					}
					if(pageNo==null || pageNo==0){
						pageNo = 1;
					}
					noOfPages = totalSize/pageSize;
					if((totalSize%pageSize) > 0){
						noOfPages++;
					}
					
					startNo = (pageNo-1)*pageSize;
					moviesList = moviesBo.getMoviesByPage(null, category.getCategoryId(),
							null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
				}
			} else {
				return ERROR;
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//Interviews Page

	public String getInterviewsPage(){
		try{
			getGlobalContent();
			urlPage = "interviews";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			totalSize = interviewsBo.getInterviewsByPageCount(null, INTERVIEWS,
					null, null, null, null, null, null, null, null, ACTIVE);
			if(totalSize!=null && totalSize>0){
				if(totalSize > MAX_SIZE){
					totalSize = MAX_SIZE ;
				}
				
				if(pageNo==null || pageNo==0){
					pageNo = 1;
				}
				noOfPages = totalSize/pageSize;
				if((totalSize%pageSize) > 0){
					noOfPages++;
				}
				
				startNo = (pageNo-1)*pageSize;
				interviewsList = interviewsBo.getInterviewsByPage(null, INTERVIEWS,
					null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
		
	}
	
	public String getInterviewsDetailPage(){
		try{
			getGlobalContent();
			urlPage = "interviews-detail";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			if(url!=null){
				interviews = interviewsBo.getInterviewsByUrl(url);
				if(interviews==null){
					return ERROR;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	//FAQ Page
	
	public String getFAQPage(){
		try{
			getGlobalContent();
			urlPage = "faq";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			totalSize = faqBo.getFaqByPageCount(null, FAQ, null, null, null, null, null, null, null, null, ACTIVE);
			if(totalSize!=null && totalSize>0){
				if(totalSize > MAX_SIZE){
					totalSize = MAX_SIZE ;
				}
				
				if(pageNo==null || pageNo==0){
					pageNo = 1;
				}
				noOfPages = totalSize/pageSize;
				if((totalSize%pageSize) > 0){
					noOfPages++;
				}
				
				startNo = (pageNo-1)*pageSize;
				faqList = faqBo.getFaqByPage(null, FAQ, null, null, null, null, null, null, null, null, ACTIVE, startNo, pageSize);
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	//About Us Page

	public String getAboutUsPage(){
		try{
			getGlobalContent();
			urlPage = "about-us";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Site-Map Page
	
	public String getSitemapPage(){
		try{
			getGlobalContent();
			urlPage = "privacy-policy";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//Testimonials Page

	public String getTestimonialsPage(){
		try{
			getGlobalContent();
			urlPage = "testimonials";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	// Privacy Policy Page
	
	public String getPrivacyPolicyPage(){
		try{
			getGlobalContent();
			urlPage = "privacy-policy";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
		
	//Disclaimer Page
	
	public String getDisclaimerPage(){
		try{
			getGlobalContent();
			urlPage = "disclaimer";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	//ContactUs Page
	
	public String getContactUsPage(){
		try{
			getGlobalContent();
			urlPage = "contactUs";
			homePageLeftAdList = adBo.getAdByPage(null, HOME_PAGE, LEFT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			homePageRightAdList = adBo.getAdByPage(null, HOME_PAGE, RIGHT_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String saveContactus(){
		try{
			urlPage = "contactUs";
			getGlobalContent();
			id = contactusBo.getNextContactusId();
			Contactus contactus = new Contactus();
			contactus.setName(name);
			contactus.setSubject(subject);
			contactus.setEmailId(emailId);
			contactus.setPhone(phone);
			contactus.setAdIdLink(adIdLink);
			if(image!=null){
				imageName = CONTACTUS_DIRECTORY + File.separator + id + "." + FilenameUtils.getExtension(imageFileName);
				File fileToCreate = new File(IMAGE_DIRECTORY + File.separator + imageName);
		    	FileUtils.copyFile(image, fileToCreate);
		    	contactus.setAttachment(imageName);
			}
			contactus.setMessage(message);
			contactus.setTime(new Date(System.currentTimeMillis()));
			contactus.setStatus(1);
			contactusBo.addContactus(contactus);
			Propertie propertie = propertieBo.getPropertie();
			if(propertie!=null){
				
				String supportContactusSubject = propertie.getSupportContactusSubject().replaceAll("#email#", emailId);
				String supportContactusBody = propertie.getSupportContactusBody().replaceAll("#name#", name).replaceAll("#subject#", subject)
						.replaceAll("#email#", emailId).replaceAll("#message#", message);
				
				StldesisMail.postMail(propertie.getContactusMailId(), propertie.getAdminId(), supportContactusSubject, 
						supportContactusBody, propertie.getSmtpHost(), 
						propertie.getSmtpPort1(), propertie.getSmtpPort2(), propertie.getSmtpSocketFactory(), 
						propertie.getSmtpSocketFactoryport(), propertie.getSmtpAuth(), 
						propertie.getSmtpUserid(), propertie.getSmtpPassword(), propertie.getAdminId());
				
			}
			msg="Your details have been successfully submitted. One of our representatives will contact you shortly.";
		}catch(Exception e){
			e.printStackTrace();
			errorMsg="Contact Us Form Submition Failed!";
			log.error(e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	
	
	
	public String getEncodedUrl(String url){
		try {
			return java.net.URLEncoder.encode(url, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Propertie getPropertie() {
		return propertie;
	}

	public void setPropertie(Propertie propertie) {
		this.propertie = propertie;
	}

	public String getAdIdLink() {
		return adIdLink;
	}

	public void setAdIdLink(String adIdLink) {
		this.adIdLink = adIdLink;
	}

	public Integer getAdType() {
		return adType;
	}

	public void setAdType(Integer adType) {
		this.adType = adType;
	}

	public List<Ad> getHomeScrollAdList() {
		return homeScrollAdList;
	}

	public void setHomeScrollAdList(List<Ad> homeScrollAdList) {
		this.homeScrollAdList = homeScrollAdList;
	}

	public List<Ad> getHomePageRightAdList() {
		return homePageRightAdList;
	}

	public void setHomePageRightAdList(List<Ad> homePageRightAdList) {
		this.homePageRightAdList = homePageRightAdList;
	}

	public List<Ad> getHomePageLeftAdList() {
		return homePageLeftAdList;
	}

	public void setHomePageLeftAdList(List<Ad> homePageLeftAdList) {
		this.homePageLeftAdList = homePageLeftAdList;
	}

	public List<Ad> getHomeRightFixedAdList() {
		return homeRightFixedAdList;
	}

	public void setHomeRightFixedAdList(List<Ad> homeRightFixedAdList) {
		this.homeRightFixedAdList = homeRightFixedAdList;
	}

	public List<Ad> getHomeBottomAdList() {
		return homeBottomAdList;
	}

	public void setHomeBottomAdList(List<Ad> homeBottomAdList) {
		this.homeBottomAdList = homeBottomAdList;
	}

	public Classifieds gettClassifieds() {
		return tClassifieds;
	}

	public void settClassifieds(Classifieds tClassifieds) {
		this.tClassifieds = tClassifieds;
	}

}
