package com.kzw.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        String source = "9:00";//上班规定时间
        double h = 0;
        Date date = null;
        Date date1 = null;
      
            date = sdf.parse(source);
            System.out.println(date);
            date1 = sdf.parse(sdf.format(new Date()));
            System.out.println(date1);
            h = (date1.getTime() - date.getTime()) / 1000 / 3600.0;

		System.out.println(h);
	}

}
