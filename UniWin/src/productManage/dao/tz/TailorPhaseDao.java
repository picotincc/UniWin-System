package productManage.dao.tz;

public interface TailorPhaseDao {
	public boolean tailorAppoint(int outsourceID,int userID,String role);
	public boolean beginTailorAppoint(int outsourceID);
	public boolean endTailorAppoint(int outsourceID);
}
