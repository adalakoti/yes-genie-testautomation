package stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import helper.UriHelper;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import helper.ResponseValidation;

import static net.serenitybdd.rest.SerenityRest.given;

/**
 * Created by vibhu on 1/7/2019.
 */
public class UnauthrizedAPI extends ResponseValidation {

    public static Response response;
    public static String uri,accessToken;
    ResponseValidation responseValidation = new ResponseValidation();

    @When("^a user search with value \"([^\"]*)\" and setting value for threshold \"([^\"]*)\" to test unauthorized functionality$")
    public void get_the_response_of_the_Api_by_passing_parameters_directly(String query, String thresholdValue) {
        accessToken="1";
        response = given().relaxedHTTPSValidation().accept(ContentType.JSON).header("Authorization", accessToken).
                param("query", query).
                param("threshold", thresholdValue).
                get(uri);
    }

    @Given("^api to test is \"([^\"]*)\" to test unauthorized functionality$")
    public void api_value(String value) {
        uri = UriHelper.uricheck();
        uri =uri.concat(value);
    }

    @Then("^a user get the status code 401 as a response from the api$")
    public void validate_API_is_oK() {
        responseValidation.validateResponseForUnauthorized(response);
    }

}
