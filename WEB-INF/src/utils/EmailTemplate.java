package utils;

public class EmailTemplate {
    public static String emailVerificationMail(String name, String email, String activationCode, String baseURL) {
        return "<div style='width: 600px;margin: 50px auto;box-shadow: 0 4px 8px rgba(0,0,0,0.1);font-family: \"Segoe UI\", Roboto, sans-serif;padding:0;border-radius: 8px;overflow: hidden;'>\r\n"
                +
                "    <div style='background: linear-gradient(135deg, #4fc3f7 0%, #00695c 100%);height: 90px;position: relative;padding: 20px;'>\r\n"
                +
                "        <img style='position: absolute;left:25px;top:20px;filter: drop-shadow(0 2px 3px rgba(0,0,0,0.2));' width='55px' src='https://cdn-icons-png.flaticon.com/512/2965/2965567.png'>\r\n"
                +
                "        <h1 style='position: absolute;left:100px;top:8px;color:#ffffff;font-weight:600;margin:0;text-shadow: 1px 1px 2px rgba(0,0,0,0.2);'>EaseHealth HMS</h1>\r\n"
                +
                "        <p style='position: absolute;left:100px;top:45px;color:#e0f7fa;font-size:14px;margin:0;'>Your Health, Our Priority</p>\r\n"
                +
                "    </div>\r\n" +
                "    <div style='padding: 30px 25px;background-color: #ffffff;'>\r\n" +
                "        <h2 style='color:#00838f;margin-top:0;'>Hello " + name + ",</h2>\r\n" +
                "        <p style='color: #37474f;line-height: 1.6;font-size: 15px;'>\r\n" +
                "            Welcome to the <strong>EaseHealth Healthcare Management System</strong>! We're excited to have you join our community of healthcare professionals dedicated to improving patient care.\r\n"
                +
                "        </p>\r\n" +
                "        <div style='background-color: #e8f5e9;border-left: 4px solid #4caf50;padding: 15px;margin: 20px 0;border-radius: 4px;'>\r\n"
                +
                "            <p style='margin:0;color: #1b5e20;font-size: 15px;'>\r\n" +
                "                Please activate your account to access all features of our platform. Your activation process is simple and secure.\r\n"
                +
                "            </p>\r\n" +
                "        </div>\r\n" +
                "        <div style='text-align: center;margin: 30px 0;'>\r\n" +
                "            <a href='" + baseURL + "/verify_email.do?email=" + email + "&activation_code="
                + activationCode
                + "' style='background-color: #00695c;color: white;padding: 12px 25px;text-decoration: none;border-radius: 4px;font-weight: 600;display: inline-block;box-shadow: 0 2px 4px rgba(0,105,92,0.3);transition: all 0.2s ease;'>Activate Your Account</a>\r\n"
                +
                "        </div>\r\n" +
                "        <p style='color: #37474f;line-height: 1.6;font-size: 15px;'>\r\n" +
                "            If you have any questions, our support team is available 24/7 to assist you. We're committed to providing you with the tools you need to deliver exceptional healthcare services.\r\n"
                +
                "        </p>\r\n" +
                "        <hr style='border: 0;height: 1px;background-color: #e0e0e0;margin: 25px 0;'>\r\n" +
                "        <p style='color: #37474f;margin-bottom:5px;'><strong>Regards,</strong></p>\r\n" +
                "        <p style='color: #00838f;font-weight:600;margin-top:0;'>The EaseHealth Team</p>\r\n" +
                "    </div>\r\n" +
                "    <div style='background-color: #e0f7fa;padding: 15px 25px;text-align: center;'>\r\n" +
                "        <p style='margin:0;color: #00695c;font-size: 13px;'><b>&copy; EaseHealth Solutions Pvt. Ltd. | Since 2024</b></p>\r\n"
                +
                "        <p style='margin:5px 0 0;color: #00838f;font-size: 12px;'>Secure · Reliable · Patient-Centered</p>\r\n"
                +
                "    </div>\r\n" +
                "</div>";
    }
}
