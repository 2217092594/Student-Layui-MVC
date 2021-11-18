package func;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Timestap {
	public static String timestap(){
	Date d = new Date();
	 SimpleDateFormat sm = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 String format = sm.format(d);
	 return format ;
	}
}
