

import java.text.SimpleDateFormat;
import java.util.Date;


public class HelloWorld {

    public static void test() {

        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        String string = format.format(date);
        System.out.println(string);

    }

    public static void main(String[] args) {
        HelloWorld.test();
    }
}