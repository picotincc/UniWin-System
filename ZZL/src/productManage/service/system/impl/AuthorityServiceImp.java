package productManage.service.system.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.AuthorityDao;
import productManage.dao.wy.RoleAuthorityDao;
import productManage.model.wy.Authority;
import productManage.model.wy.RoleAuthority;
import productManage.service.system.AuthorityService;
@Service
public class AuthorityServiceImp implements AuthorityService {
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private RoleAuthorityDao roleAuthorityDao;
	
	@Override
	public List<Authority> findAll() {
		// TODO Auto-generated method stub
		return authorityDao.findAll();
	}

	@Override
	public void updateAuthority(Authority authority) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Authority getAuthorityById(String authorityID) {
		// TODO Auto-generated method stub
		return authorityDao.findById(authorityID);
	}

	@Override
	public List<String> getAllHighAuthoName() {
		// TODO Auto-generated method stub
		List<Authority> authoList = authorityDao.findAll();
		return high(authoList);
	}

	@Override
	public List<String> getMiddleByHigh(String highAuthoName) {
		// TODO Auto-generated method stub
		List<Authority> authoList = authorityDao.findAll();
		return middle(authoList, highAuthoName);
	}

	@Override
	public List<Authority> getLowByMiddleHigh(String middleAuthoName,
			String highAuthoName) {
		// TODO Auto-generated method stub
		List<Authority> authoList = authorityDao.findAll();
		return low(authoList, middleAuthoName, highAuthoName);
	}
	
	@Override
	public List<String> getRoleHighAuthoName(int roleID) {
		// TODO Auto-generated method stub
		List<Authority> authoList = roleAuthorityDao.findRoleAuthority(roleID);
		return high(authoList);
	}

	@Override
	public List<String> getRoleMiddleByHigh(int roleID, String highAuthoName) {
		// TODO Auto-generated method stub
		List<Authority> authoList = roleAuthorityDao.findRoleAuthority(roleID);
		return middle(authoList, highAuthoName);
	}

	@Override
	public List<Authority> getRoleLowByMiddleHigh(int roleID,
			String middleAuthoName, String highAuthoName) {
		// TODO Auto-generated method stub
		List<Authority> authoList = roleAuthorityDao.findRoleAuthority(roleID);
		return low(authoList, middleAuthoName, highAuthoName);
	}
	
	@Override
	public List<String> high(List<Authority> authoList){
		// TODO Auto-generated method stub
		List<String> highAuthoNameList = new ArrayList<String>();
		
		for(int i = 0;i < authoList.size();i++){
			String highAuthoNameItem = authoList.get(i).getHighAuthName();
			if(!highAuthoNameList.contains(highAuthoNameItem)){
				highAuthoNameList.add(highAuthoNameItem);
			}
		}
		return highAuthoNameList;
	}
	
	@Override
	public List<Authority> highMiddle(List<Authority> authoList) {
		// TODO Auto-generated method stub
		List<Authority> highmiddleList = new ArrayList<Authority>();
		
		for(int i = 0;i < authoList.size();i++){
			Authority autho_i = authoList.get(i);
			boolean IsSingle = true;
			for (int j = i+1; j < authoList.size(); j++) {
				Authority autho_j = authoList.get(j);
				if (autho_i.getHighAuthName().equals(autho_j.getHighAuthName())
						&&autho_i.getMiddleAuthName().equals(autho_j.getMiddleAuthName())) {
					IsSingle = false;
					break;
				}
			}
			if (IsSingle) 
				highmiddleList.add(autho_i);
		}
//		for(Authority a:highmiddleList){
//			System.out.println(a.getHighAuthName()+"/"+a.getMiddleAuthName());
//		}
		return highmiddleList;
	}
	
	private List<String> middle(List<Authority> authoList,String highAuthoName){
		List<String> middleNameList = new ArrayList<String>();
		 
		for(int i = 0;i < authoList.size();i++){
			if(authoList.get(i).getHighAuthName().equals(highAuthoName)){
				String middleAuthoName = authoList.get(i).getMiddleAuthName();
				if(!middleNameList.contains(middleAuthoName)){
					if (authoList.get(i).getMiddleAuthName()==null) {
						String state = authoList.get(i).getAuthorityEnabled()==0?"停止":"启用";
						middleNameList.add(state);
					}else {
						middleNameList.add(middleAuthoName);
					}
				}
			}
		}
		return middleNameList;
	}
	
	private List<Authority> low(List<Authority> authoList,String middleAuthoName,String highAuthoName) {
		// TODO Auto-generated method stub
		List<Authority> lowAuthoNameList = new ArrayList<Authority>();
		
		for(int i = 0;i < authoList.size();i++){
			Authority itemAutho = authoList.get(i);
			String itemHighAuthoName = itemAutho.getHighAuthName();
			String itemMiddleAuthoName = itemAutho.getMiddleAuthName();
			
			if(itemHighAuthoName.equals(highAuthoName) && itemMiddleAuthoName.equals(middleAuthoName)){
				lowAuthoNameList.add(itemAutho);
			}
		}
		return lowAuthoNameList;
	}

	@Override
	public void saveRoleAuthority(int roleID,String[]ras) {
		// TODO Auto-generated method stub
		List<RoleAuthority> ra = roleAuthorityDao.findAll();
		List<RoleAuthority> raList = new ArrayList<RoleAuthority>();
		for (int j = 0; j < ra.size(); j++) {
			if (roleID==ra.get(j).getRoleID()) {
				raList.add(ra.get(j));
			}
		}
		roleAuthorityDao.delete(raList);
		
//		List<RoleAuthority>newra = new ArrayList<RoleAuthority>();
		if (ras.length>0) {
			if (!ras[0].isEmpty()) {
				String sql = "insert into roleauthority (roleID,authorityID) values ";
				for (int i = 0; i < ras.length; i++) {
					String[]name = ras[i].split("_");
					String highAuthoName = name[0];
					String middleAuthoName = (name.length>1)?name[1]:"";
					String lowAuthoName = (name.length>2)?name[2]:"";
					int authorityID = authorityDao.getIDByAuthority(highAuthoName, middleAuthoName, lowAuthoName);
					if (authorityID>0) {
						sql += "("+roleID+","+authorityID+")";
//				RoleAuthority roleAuthority = new RoleAuthority();
//				roleAuthority.setRoleID(roleID);
//				roleAuthority.setAuthorityID(authorityID);
//				newra.add(roleAuthority);
					}
					if (i!=(ras.length-1)) {
						sql += ",";
					}
				}
				sql += ";";
				roleAuthorityDao.save(sql);
			}
		}
//		roleAuthorityDao.save(newra);
	}

	@Override
	public void updateAuthorityState(String nodeID) {
		// TODO Auto-generated method stub
		String[]name = nodeID.split("_");
		String highAuthoName = name[0];
		String middleAuthoName = (name.length>1)?name[1]:"";
		String lowAuthoName = (name.length>2)?name[2]:"";
		List<Authority>authorities = authorityDao.findAll();
		for (int i = 0; i < authorities.size(); i++) {
			Authority authority = authorities.get(i);
			if (!highAuthoName.isEmpty()&&authority.getHighAuthName().replace(" ", "").equals(highAuthoName)) {
				if (middleAuthoName.isEmpty()) {
					if (authority.getAuthorityEnabled()==0) {
						authority.setAuthorityEnabled(1);
					}else{
						authority.setAuthorityEnabled(0);
					}
					//System.out.println(authority.getAuthorityID()+" "+authority.getAuthorityEnabled());
					authorityDao.update(authority);
				}else {
					if(authority.getMiddleAuthName().replace(" ", "").equals(middleAuthoName)){
						if (lowAuthoName.isEmpty()) {
							if (authority.getAuthorityEnabled()==0) {
								authority.setAuthorityEnabled(1);
							}else{
								authority.setAuthorityEnabled(0);
							}
							//System.out.println(authority.getAuthorityID()+" "+authority.getAuthorityEnabled());
							authorityDao.update(authority);
						}else{
							if (authority.getLowAuthName().replace(" ", "").equals(lowAuthoName)) {
								if (authority.getAuthorityEnabled()==0) {
									authority.setAuthorityEnabled(1);
								}else{
									authority.setAuthorityEnabled(0);
								}
								//System.out.println(authority.getAuthorityID()+" "+authority.getAuthorityEnabled());
								authorityDao.update(authority);
							}
						}
					}
				}
			}
		}
	}

}
