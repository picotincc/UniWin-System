package productManage.dao.tms;

import java.util.List;

import productManage.model.yk.Inquiry;

public interface InquiryDAO {
	public List<Inquiry> findAll();//返回所有记录
	public Inquiry findByCode(String code);//根据询价单编码找到对应记录
	public List<Inquiry> findByIs_priced(String is_priced);//根据未报价环节找到记录
	public void is_OK(Inquiry inquiry);//确认OK
	public Inquiry getInquiryByID(int inquiryID);
	/*
	public void Shell_is_OK(String code);//面料OK
	public void Acc_is_OK(String code);//辅料OK
	public void Flower_is_OK(String code);//花型OK
	public void Model_is_OK(String code);//版型OK
	public void Process_is_OK(String code);//加工OK
	*/
}
