//package productManage.model;
//
//import java.util.HashSet;
//import java.util.Set;
//
//import javax.persistence.CascadeType;
//import javax.persistence.FetchType;
//import javax.persistence.OneToMany;
//
//import productManage.model.zky.Tailor;
//
///**
// * @author wangye
// * @date 创建时间2016-02-29
// */
//
//public class UserDetail {
//	private int userId;
//	
//	private String userAccount;
//	
//	private String userName;
//	
//	private String userPassword;
//	
//	private String userAddress;
//	
//	private String userPhoneNumber;
//	
//	private String userEmail;
//	
//	private String userWeChatNumber;//微信号
//	
//	private String userCorporationName;
//	
//	private String userRemark;//备注
//	
//	private int userDepartmentId;
//	/**
//	 * 负责制版的裁剪单集合
//	 */
//	@OneToMany(mappedBy="tailormodelmaker",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
//	private Set<Tailor> modelMadeTailors=new HashSet<Tailor>();
//	/**
//	 * 负责裁剪的裁剪单集合
//	 */
//	@OneToMany(mappedBy="tailor",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
//	private Set<Tailor> tailedTailors=new HashSet<Tailor>();
//
//	public UserDetail(int userId,String userAccount,String userName,
//			String userPassword,String userAddress,String userPhoneNumber,
//			String userEmail,String userWeChatNumber,String userCorporationName,
//			String userRemark,int userDepartmentId){
//		this.userId = userId;
//		this.userAccount = userAccount;
//		this.userName = userName;
//		this.userPassword = userPassword;
//		this.userAddress = userAddress;
//		this.userPhoneNumber = userPhoneNumber;
//		this.userEmail = userEmail;
//		this.userWeChatNumber = userWeChatNumber;
//		this.userCorporationName = userCorporationName;
//		this.userRemark = userRemark;
//		this.userDepartmentId = userDepartmentId;
//	}
//	
//	public int getUserId() {
//		return userId;
//	}
//
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
//
//	public String getUserAccount() {
//		return userAccount;
//	}
//
//	public void setUserAccount(String userAccount) {
//		this.userAccount = userAccount;
//	}
//
//	public String getUserName() {
//		return userName;
//	}
//
//	public void setUserName(String userName) {
//		this.userName = userName;
//	}
//
//	public String getUserPassword() {
//		return userPassword;
//	}
//
//	public void setUserPassword(String userPassword) {
//		this.userPassword = userPassword;
//	}
//
//	public String getUserAddress() {
//		return userAddress;
//	}
//
//	public void setUserAddress(String userAddress) {
//		this.userAddress = userAddress;
//	}
//
//	public String getUserPhoneNumber() {
//		return userPhoneNumber;
//	}
//
//	public void setUserPhoneNumber(String userPhoneNumber) {
//		this.userPhoneNumber = userPhoneNumber;
//	}
//
//	public String getUserEmail() {
//		return userEmail;
//	}
//
//	public void setUserEmail(String userEmail) {
//		this.userEmail = userEmail;
//	}
//
//	public String getUserWeChatNumber() {
//		return userWeChatNumber;
//	}
//
//	public void setUserWeChatNumber(String userWeChatNumber) {
//		this.userWeChatNumber = userWeChatNumber;
//	}
//
//	public String getUserCorporationName() {
//		return userCorporationName;
//	}
//
//	public void setUserCorporationName(String userCorporationName) {
//		this.userCorporationName = userCorporationName;
//	}
//
//	public String getUserRemark() {
//		return userRemark;
//	}
//
//	public void setUserRemark(String userRemark) {
//		this.userRemark = userRemark;
//	}
//
//	public int getUserDepartmentId() {
//		return userDepartmentId;
//	}
//
//	public void setUserDepartmentId(int userDepartmentId) {
//		this.userDepartmentId = userDepartmentId;
//	}
//	/**
//	 * 
//	 * @return 负责制版的裁剪单集合
//	 */
//	public Set<Tailor> getModelMadeTailors() {
//		return modelMadeTailors;
//	}
//
//	public void setModelMadeTailors(Set<Tailor> modelMadeTailors) {
//		this.modelMadeTailors = modelMadeTailors;
//	}
//	/**
//	 * 
//	 * @return 负责裁剪的裁剪单集合
//	 */
//	public Set<Tailor> getTailedTailors() {
//		return tailedTailors;
//	}
//
//	public void setTailedTailors(Set<Tailor> tailedTailors) {
//		this.tailedTailors = tailedTailors;
//	}
//	
//}
