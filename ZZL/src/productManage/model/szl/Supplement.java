package productManage.model.szl;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.lhj.Supply;
import productManage.model.zky.Production;

/**
 * 补料单
 * @author SZL
 * @date 2016-03-05
 */

@Entity
@Table(name="supplement")
public class Supplement {
	public Supplement(){}
    public Supplement(int supplementID, Production production, User user,
			String supplementCode, String supplementState,
			String supplementType, Date supplementDate,
			String supplementComment,
			Set<SupplementMaterial> supplementMaterials) {
		super();
		this.supplementID = supplementID;
		this.production = production;
		this.user = user;
		this.supplementCode = supplementCode;
		this.supplementState = supplementState;
		this.supplementType = supplementType;
		this.supplementDate = supplementDate;
		this.supplementComment = supplementComment;
		this.supplementMaterials = supplementMaterials;
	}

	@Id
    private int supplementID; //ID 主键
    
    @ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=true)
    @JoinColumn(name = "productionID")
    private Production production; //生产单编号 外键 多对一
    
    @ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
    @JoinColumn(name = "userId")
    private User user; //补料人ID 外键 多对一
    
    private String supplementCode; //补料单编号
    
    private String supplementState; //补料单状态
    
    private String supplementType; //补料类型
    
    private Date supplementDate; //补料日期
    
    private String supplementComment; //备注
    
    @OneToMany(targetEntity=SupplementMaterial.class,mappedBy="supplement",cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,CascadeType.REFRESH })
    private Set<SupplementMaterial> supplementMaterials=new HashSet<SupplementMaterial>();
    
    
  
    public int getSupplementID(){
    	return supplementID;
    }
    
	public void setSupplementID(int supplementID) {
		this.supplementID = supplementID;
	}
    public Production getProduction(){
    	return production;
    }
    
    public void setProduction(Production production){
    	this.production=production;
    }
    
    public User getUser(){
    	return user;
    }
    
    public void setUser(User user){
    	this.user=user;
    }
    
    public String getSupplementCode(){
    	return supplementCode;
    }
    
    public void setSupplementCode(String supplementCode){
    	this.supplementCode=supplementCode;
    }
    
    public String getSupplementState(){
    	return supplementState;
    }
   
    public void setSupplementState(String supplementState){
    	this.supplementState=supplementState;
    }
    
    public String getSupplementType(){
    	return supplementType;
    }
    
    public void setSupplementType(String supplementType){
    	this.supplementType=supplementType;
    }
    
    public Date getSupplementDate(){
    	return supplementDate;
    }
    
    public void setSupplementDate(Date supplementDate){
    	this.supplementDate=supplementDate;
    }
    
    public String getSupplementComment(){
    	return supplementComment;
    }
    
    public void setSupplementComment(String supplementComment){
    	this.supplementComment=supplementComment;
    }

	public Set<SupplementMaterial> getSupplementMaterials() {
		return supplementMaterials;
	}

	public void setSupplementMaterials(Set<SupplementMaterial> supplementMaterials) {
		this.supplementMaterials = supplementMaterials;
	}


    
    
    
}

