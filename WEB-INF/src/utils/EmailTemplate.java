package utils;

public class EmailTemplate {
    public static String emailVerificationMail(String name, String email, String activationCode, String baseURL) {
        return "<div style='width: 500px;margin: 50px auto;box-shadow: 10px 10px 10px #ccc;font-family:verdana;padding:10px;'>\r\n" + //
                        "        <div style='background-color: beige;height: 80px;position: relative;padding-left: 20px;'>\r\n" + //
                        "            <img style='position: absolute;left:10px;top:10px;' width='64px' src='https://img.freepik.com/premium-vector/free-vector-beautiful-flying-hummingbird-design-element-banners-posters-leaflets-brochur_1009653-1.jpg?semt=ais_hybrid'>\r\n" + //
                        "            <h2 style='position: absolute;left:100px;top:10px;'>ISRDC Jabalpur</h2>\r\n" + //
                        "        </div>\r\n" + //
                        "        <div style='padding-left: 20px;'>\r\n" + //
                        "            <h3>Hello " + name + ",</h3>\r\n" + //
                        "            <p>\r\n" + //
                        "                Welcome to ISRDC Jabalpur. We congratulate you for your new account on our platform.\r\n" + //
                        "                <br><br>\r\n" + //
                        "                Please click over the account activation link to acivate your account: <a href='" + baseURL + "/verify_email.do?email=" + email + "&activation_code=" + activationCode + "'>Activation Link</a> \r\n" + //
                        "                <br><br>\r\n" + //
                        "                <h3>Regards,</h3>\r\n" + //
                        "                <p>ISRDC Jabalpur</p>\r\n" + //
                        "            </p>\r\n" + //
                        "        </div>\r\n" + //
                        "        <div style='background-color: beige;height: 20px;padding-left: 20px;'>\r\n" + //
                        "            <small><b>&copy;ISRDC Jabalpur Pvt. Ltd. Since 2000AD</b></small>\r\n" + //
                        "        </div>\r\n" + //
                        "    </div>";
    }
}
