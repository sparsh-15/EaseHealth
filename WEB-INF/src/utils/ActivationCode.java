package utils;

import java.util.Date;
import java.util.Random;

public class ActivationCode {
    public static String getActivationCode() {
        return Math.abs(new Random().nextLong()) + "_" + new Date().getTime(); 
    }
}
