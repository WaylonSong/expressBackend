package com.cpu.util;

/**
 * Created by song on 2017/7/13.
 */

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class SequenceFactory{

    private static long order_counter = 0;
    private static long inStorage_counter = 0;
    private static long outStorage_counter = 0;

    public static String getNumber(long counter) {
        String date = "";
        String seq = "";
        try {
            date = new SimpleDateFormat("yyyyMMdd").format(new Date()) + "";
            seq = new DecimalFormat("00000000").format(counter ++);
        }catch (Exception e){
            e.printStackTrace();
        }

        return date + seq;
    }

    public static String getOrderNumber() {

        return new SimpleDateFormat("yyyyMMdd").format(new Date())+"-"+getShortUuid();
    }

    public static String getInStorageNumber() {
        return new SimpleDateFormat("yyyyMMdd").format(new Date())+"-"+getShortUuid();
    }
    public static String getOutStorageNumber() {
        return new SimpleDateFormat("yyyyMMdd").format(new Date())+"-"+getShortUuid();
    }


    public Class<String> getObjectType() {
        return String.class;
    }

    public boolean isSingleton() {
        return false;
    }

    public static void reset() {
        order_counter = 0;
        inStorage_counter = 0;
        outStorage_counter = 0;
    }
    public static String[] chars = new String[]
            {
                    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V","W", "X", "Y", "Z"
            };


    public static String getShortUuid()
    {
        StringBuffer stringBuffer = new StringBuffer();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        for (int i = 0; i < 8; i++)
        {
            String str      = uuid.substring(i * 4, i * 4 + 4);
            int strInteger  = Integer.parseInt(str, 16);
            stringBuffer.append(chars[strInteger % 0x3E]);
        }

        return stringBuffer.toString();
    }

    public static void main(String args[]){
        System.out.println(getShortUuid());
    }

}
