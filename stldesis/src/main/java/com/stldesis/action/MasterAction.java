package com.stldesis.action;

import java.io.File;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.stldesis.bo.AdBo;
import com.stldesis.bo.CategoryBo;
import com.stldesis.bo.ClassifiedsBo;
import com.stldesis.bo.ContactusBo;
import com.stldesis.bo.EventsBo;
import com.stldesis.bo.FaqBo;
import com.stldesis.bo.InterviewsBo;
import com.stldesis.bo.MoviesBo;
import com.stldesis.bo.OffersBo;
import com.stldesis.bo.PlacesToVisitBo;
import com.stldesis.bo.PropertieBo;
import com.stldesis.bo.UserBo;
import com.stldesis.bo.VerificationBo;
import com.stldesis.bo.YellowPagesBo;
import com.stldesis.model.Ad;
import com.stldesis.model.Category;
import com.stldesis.model.Classifieds;
import com.stldesis.model.Faq;
import com.stldesis.model.Interviews;
import com.stldesis.model.Movies;
import com.stldesis.model.Offers;
import com.stldesis.model.PlacesToVisit;
import com.stldesis.model.User;
import com.stldesis.model.YellowPages;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MasterAction extends ActionSupport{
	
	private static final long serialVersionUID = 1277819142321918303L;
	
	public static final int ACTIVE = 1;
	public static final int PENDING = 2;
	public static final int INACTIVE = 0;
	public static final long CLASSIFIEDS = 1;
	public static final long YELLOW_PAGES = 2;
	public static final long EVENTS = 3;
	public static final long OFFERS = 4;
	public static final long PLACES_TO_VISIT = 5;
	public static final long MOVIES = 6;
	public static final long INTERVIEWS = 7;
	public static final long ACCOMODATION = 9;
	public static final long AUTO = 10;
	public static final long CATERING = 11;
	public static final long CHILD_CARE	 = 12;
	public static final long FOR_SALE = 13;
	public static final long JOBS = 14;
	public static final long LADIES_CORNER = 15;
	public static final long TRAVEL_COMPANION = 16;
	public static final long OTHERS = 17;
	public static final long FAQ = 8;
	public static final long HOME_PAGE = 0;
	public static final int HEADER_AD = 1;
	public static final int MULTIPLE_BLOCK_AD = 2;
	public static final int LEFT_AD = 3;
	public static final int RIGHT_AD = 4;
	public static final int RIGHT_FIXED_AD = 5;
	public static final int RIGHT_SLIDER_AD = 6;
	public static final int BOTTOM_AD = 7;
	public static final Integer MAX_SIZE=100;
	public static final String CLASSIFIEDS_DIRECTORY = "classifieds";
	public static final String ADS_DIRECTORY = "ad";
	public static final String PLACES_TO_VISIT_DIRECTORY = "placesToVisit";
	public static final String OFFERS_DIRECTORY = "offers";
	public static final String INTERVIEWS_DIRECTORY = "interviews";
	public static final String MOVIES_DIRECTORY = "movies";
	public static final String CONTACTUS_DIRECTORY = "contactus";
	public static final String IMAGE_DIRECTORY = File.separator+ "var" + File.separator+ "lib" + File.separator + "stldesis" + File.separator  + "uploads";
	
	@SuppressWarnings("rawtypes")
	public Map session;
	protected String errorMsg = "";
	protected String msg = "";
	protected String urlPage = "";
	
	protected Integer startNo;
	protected Integer endNo;
	protected Integer noOfPages;
	protected Integer pageNo=1;
	protected Integer pageSize=5;
	protected Integer totalSize=0;
	
	protected String title;
	protected String description;
	protected BigDecimal price;
	protected String name;
	protected String phone;
	protected String emailId;
	protected String securitycode;
	protected String currentPassword;
	protected String address;
	protected File image;
	protected File image1;
	protected File image2;
	protected File image3;
	protected File image4;
	protected String imageName;
	protected List<String> imagesList;

	protected AdBo adBo;
	protected CategoryBo categoryBo;
	protected ClassifiedsBo classifiedsBo;
	protected ContactusBo contactusBo;
	protected EventsBo eventsBo;
	protected FaqBo faqBo;
	protected InterviewsBo interviewsBo;
	protected MoviesBo moviesBo;
	protected OffersBo offersBo;
	protected PlacesToVisitBo placesToVisitBo;
	protected PropertieBo propertieBo;
	protected UserBo userBo;
	protected VerificationBo verificationBo;
	protected YellowPagesBo yellowPagesBo;
	
	protected List<Ad> adList;
	protected Ad ad;
	protected Category category;
	protected List<Classifieds> classifiedsList;
	protected Classifieds classifieds;
	protected List<com.stldesis.model.Events> eventsList;
	protected com.stldesis.model.Events event;
	protected List<Offers> offersList;
	protected Offers offers;
	protected List<PlacesToVisit> placesToVisitList;
	protected PlacesToVisit placesToVisit;
	protected List<Movies> moviesList;
	protected Movies movies;
	protected List<Interviews> interviewsList;
	protected Interviews interviews;
	protected List<Faq> faqList;
	protected Faq faq;
	protected List<YellowPages> yellowPagesList;
	protected YellowPages yellowPages;
	protected User user;
	
	protected Map<Category, List<Category>> categoryObjMap;
	protected List<Category> categoryList;
	private List<Ad> headerAdList;
	private List<Ad> topAdBlocksList;
	
	protected String imageContentType;
	protected String imageFileName;
	protected String image1ContentType;
	protected String image1FileName;
	protected String image2ContentType;
	protected String image2FileName;
	protected String image3ContentType;
	protected String image3FileName;
	protected String image4ContentType;
	protected String image4FileName;
	protected String fileName;
	protected Long id;
	protected Long categoryId;
	
	public void getGlobalContent(){
		try{
			session = ActionContext.getContext().getSession();
			categoryObjMap = categoryBo.activeCategoryObjMap();
			headerAdList = adBo.getAdByPage(null, null, HEADER_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
			topAdBlocksList = adBo.getAdByPage(null, null, MULTIPLE_BLOCK_AD, null, null, null, null, null, null, null, null, null, ACTIVE, null, null);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@SuppressWarnings("rawtypes")
	public Map getSession() {
		return session;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	@SuppressWarnings("rawtypes")
	public void setSession(Map session) {
		this.session = session;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getUrlPage() {
		return urlPage;
	}

	public void setUrlPage(String urlPage) {
		this.urlPage = urlPage;
	}

	public ContactusBo getContactusBo() {
		return contactusBo;
	}

	public void setContactusBo(ContactusBo contactusBo) {
		this.contactusBo = contactusBo;
	}

	public UserBo getUserBo() {
		return userBo;
	}

	public void setUserBo(UserBo userBo) {
		this.userBo = userBo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(Integer totalSize) {
		this.totalSize = totalSize;
	}

	public Integer getStartNo() {
		return startNo;
	}

	public void setStartNo(Integer startNo) {
		this.startNo = startNo;
	}

	public Integer getEndNo() {
		return endNo;
	}

	public void setEndNo(Integer endNo) {
		this.endNo = endNo;
	}

	public Integer getNoOfPages() {
		return noOfPages;
	}

	public void setNoOfPages(Integer noOfPages) {
		this.noOfPages = noOfPages;
	}

	public PropertieBo getPropertieBo() {
		return propertieBo;
	}

	public void setPropertieBo(PropertieBo propertieBo) {
		this.propertieBo = propertieBo;
	}

	public AdBo getAdBo() {
		return adBo;
	}

	public void setAdBo(AdBo adBo) {
		this.adBo = adBo;
	}

	public CategoryBo getCategoryBo() {
		return categoryBo;
	}

	public void setCategoryBo(CategoryBo categoryBo) {
		this.categoryBo = categoryBo;
	}

	public ClassifiedsBo getClassifiedsBo() {
		return classifiedsBo;
	}

	public void setClassifiedsBo(ClassifiedsBo classifiedsBo) {
		this.classifiedsBo = classifiedsBo;
	}

	public EventsBo getEventsBo() {
		return eventsBo;
	}

	public void setEventsBo(EventsBo eventsBo) {
		this.eventsBo = eventsBo;
	}

	public FaqBo getFaqBo() {
		return faqBo;
	}

	public void setFaqBo(FaqBo faqBo) {
		this.faqBo = faqBo;
	}

	public InterviewsBo getInterviewsBo() {
		return interviewsBo;
	}

	public void setInterviewsBo(InterviewsBo interviewsBo) {
		this.interviewsBo = interviewsBo;
	}

	public MoviesBo getMoviesBo() {
		return moviesBo;
	}

	public void setMoviesBo(MoviesBo moviesBo) {
		this.moviesBo = moviesBo;
	}

	public OffersBo getOffersBo() {
		return offersBo;
	}

	public void setOffersBo(OffersBo offersBo) {
		this.offersBo = offersBo;
	}

	public PlacesToVisitBo getPlacesToVisitBo() {
		return placesToVisitBo;
	}

	public void setPlacesToVisitBo(PlacesToVisitBo placesToVisitBo) {
		this.placesToVisitBo = placesToVisitBo;
	}

	public VerificationBo getVerificationBo() {
		return verificationBo;
	}

	public void setVerificationBo(VerificationBo verificationBo) {
		this.verificationBo = verificationBo;
	}

	public YellowPagesBo getYellowPagesBo() {
		return yellowPagesBo;
	}

	public void setYellowPagesBo(YellowPagesBo yellowPagesBo) {
		this.yellowPagesBo = yellowPagesBo;
	}

	public List<Classifieds> getClassifiedsList() {
		return classifiedsList;
	}

	public void setClassifiedsList(List<Classifieds> classifiedsList) {
		this.classifiedsList = classifiedsList;
	}

	public Classifieds getClassifieds() {
		return classifieds;
	}

	public void setClassifieds(Classifieds classifieds) {
		this.classifieds = classifieds;
	}

	public List<com.stldesis.model.Events> getEventsList() {
		return eventsList;
	}

	public void setEventsList(List<com.stldesis.model.Events> eventsList) {
		this.eventsList = eventsList;
	}

	public com.stldesis.model.Events getEvent() {
		return event;
	}

	public void setEvent(com.stldesis.model.Events event) {
		this.event = event;
	}

	public List<Offers> getOffersList() {
		return offersList;
	}

	public void setOffersList(List<Offers> offersList) {
		this.offersList = offersList;
	}

	public Offers getOffers() {
		return offers;
	}

	public void setOffers(Offers offers) {
		this.offers = offers;
	}

	public List<PlacesToVisit> getPlacesToVisitList() {
		return placesToVisitList;
	}

	public void setPlacesToVisitList(List<PlacesToVisit> placesToVisitList) {
		this.placesToVisitList = placesToVisitList;
	}

	public PlacesToVisit getPlacesToVisit() {
		return placesToVisit;
	}

	public void setPlacesToVisit(PlacesToVisit placesToVisit) {
		this.placesToVisit = placesToVisit;
	}

	public List<Movies> getMoviesList() {
		return moviesList;
	}

	public void setMoviesList(List<Movies> moviesList) {
		this.moviesList = moviesList;
	}

	public Movies getMovies() {
		return movies;
	}

	public void setMovies(Movies movies) {
		this.movies = movies;
	}

	public List<Interviews> getInterviewsList() {
		return interviewsList;
	}

	public void setInterviewsList(List<Interviews> interviewsList) {
		this.interviewsList = interviewsList;
	}

	public Interviews getInterviews() {
		return interviews;
	}

	public void setInterviews(Interviews interviews) {
		this.interviews = interviews;
	}

	public List<Faq> getFaqList() {
		return faqList;
	}

	public void setFaqList(List<Faq> faqList) {
		this.faqList = faqList;
	}

	public Faq getFaq() {
		return faq;
	}

	public void setFaq(Faq faq) {
		this.faq = faq;
	}

	public List<YellowPages> getYellowPagesList() {
		return yellowPagesList;
	}

	public void setYellowPagesList(List<YellowPages> yellowPagesList) {
		this.yellowPagesList = yellowPagesList;
	}

	public YellowPages getYellowPages() {
		return yellowPages;
	}

	public void setYellowPages(YellowPages yellowPages) {
		this.yellowPages = yellowPages;
	}

	public Map<Category, List<Category>> getCategoryObjMap() {
		return categoryObjMap;
	}

	public void setCategoryObjMap(Map<Category, List<Category>> categoryObjMap) {
		this.categoryObjMap = categoryObjMap;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getSecuritycode() {
		return securitycode;
	}

	public void setSecuritycode(String securitycode) {
		this.securitycode = securitycode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<String> getImagesList() {
		return imagesList;
	}

	public void setImagesList(List<String> imagesList) {
		this.imagesList = imagesList;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public List<Ad> getAdList() {
		return adList;
	}

	public void setAdList(List<Ad> adList) {
		this.adList = adList;
	}

	public Ad getAd() {
		return ad;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public File getImage1() {
		return image1;
	}

	public void setImage1(File image1) {
		this.image1 = image1;
	}

	public File getImage2() {
		return image2;
	}

	public void setImage2(File image2) {
		this.image2 = image2;
	}

	public File getImage3() {
		return image3;
	}

	public void setImage3(File image3) {
		this.image3 = image3;
	}

	public File getImage4() {
		return image4;
	}

	public void setImage4(File image4) {
		this.image4 = image4;
	}

	public String getImage1ContentType() {
		return image1ContentType;
	}

	public void setImage1ContentType(String image1ContentType) {
		this.image1ContentType = image1ContentType;
	}

	public String getImage1FileName() {
		return image1FileName;
	}

	public void setImage1FileName(String image1FileName) {
		this.image1FileName = image1FileName;
	}

	public String getImage2ContentType() {
		return image2ContentType;
	}

	public void setImage2ContentType(String image2ContentType) {
		this.image2ContentType = image2ContentType;
	}

	public String getImage2FileName() {
		return image2FileName;
	}

	public void setImage2FileName(String image2FileName) {
		this.image2FileName = image2FileName;
	}

	public String getImage3ContentType() {
		return image3ContentType;
	}

	public void setImage3ContentType(String image3ContentType) {
		this.image3ContentType = image3ContentType;
	}

	public String getImage3FileName() {
		return image3FileName;
	}

	public void setImage3FileName(String image3FileName) {
		this.image3FileName = image3FileName;
	}

	public String getImage4ContentType() {
		return image4ContentType;
	}

	public void setImage4ContentType(String image4ContentType) {
		this.image4ContentType = image4ContentType;
	}

	public String getImage4FileName() {
		return image4FileName;
	}

	public void setImage4FileName(String image4FileName) {
		this.image4FileName = image4FileName;
	}

	public List<Ad> getTopAdBlocksList() {
		return topAdBlocksList;
	}

	public void setTopAdBlocksList(List<Ad> topAdBlocksList) {
		this.topAdBlocksList = topAdBlocksList;
	}

	public List<Ad> getHeaderAdList() {
		return headerAdList;
	}

	public void setHeaderAdList(List<Ad> headerAdList) {
		this.headerAdList = headerAdList;
	}

}
