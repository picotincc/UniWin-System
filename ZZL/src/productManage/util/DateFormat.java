package productManage.util;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateFormat {

	public static Date StringToDate(String str){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟    
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return date;		
	}
}
