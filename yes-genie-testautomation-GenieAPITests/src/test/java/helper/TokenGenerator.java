package helper;

import io.restassured.http.ContentType;
import io.restassured.response.Response;

import static net.serenitybdd.rest.SerenityRest.given;

public class TokenGenerator {

    public static Response response;
    public static Response responseAccessToken;
    public static String uri, accessToken;
    public static ResponseValidation responseValidation = new ResponseValidation();
    public static String uriAccessToken,username,password;


//    To do :change the login URL for UAT
        public static String getToken() {
            if (System.getProperty("env").equals("UAT")) {
                uriAccessToken="http://cust360.uat-genie.yesbank.com:30978/auth/realms/YBL/protocol/openid-connect/token";
                username ="ADC0008352";
                password="Test@1234";
            }
            else{
                uriAccessToken="https://sso.yesgenie.com:31390/auth/realms/YBL/protocol/openid-connect/token";
                username ="abhishek";
                password="123";
            }
            responseAccessToken = given().relaxedHTTPSValidation().accept(ContentType.JSON).
                    header("Content-Type", "application/x-www-form-urlencoded").
                    formParam("client_id", "yes-genie-frontend").
                    formParam("grant_type", "password").
                    formParam("username", username).
                    formParam("password", password).
                    formParam("client_secret", "f2b07a8f-ce69-41c6-9d28-f056bc9713fe").
                    post(uriAccessToken);
            responseValidation.validateResponseOk(responseAccessToken);
            accessToken = responseValidation.getResponse(responseAccessToken);
            accessToken = "Bearer ".concat(accessToken);
            return accessToken;
        }
    }
