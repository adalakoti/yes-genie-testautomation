package locators;

import info.seleniumcucumber.userStepDefintions.UserStepDefinitions;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;


public class LoginLocators extends UserStepDefinitions {

    public LoginLocators() {
        PageFactory.initElements(driver, this);
    }

    @FindBy(how = How.CLASS_NAME, using = "buttonRipple")
    public static WebElement login_button;

    @FindBy(how = How.ID, using = "username")
    public static WebElement textbox_username;

    @FindBy(how = How.ID, using = "password")
    public static WebElement textbox_password;

    @FindBy(how = How.XPATH, using = "//div[@class='_3BIeaRQGSZXeruo1s-1Pa6']")
    public static WebElement display_lastlogin;

    @FindBy(how = How.XPATH, using = "//span[contains(text(),'UI Automation DND')]")
    public static WebElement display_name;

    @FindBy(how = How.XPATH, using = "//span[contains(text(),'Superuser')]")
    public static WebElement display_role;

    @FindBy(how = How.XPATH, using = "//span[contains(text(),'NA')]")
    public static WebElement display_designation;

    @FindBy(how = How.XPATH, using = "//div[@class='_1HWu9-VMmg-bQcnoV5fSo-']")
    public static WebElement search_static_parameters;

    @FindBy(how = How.XPATH, using = "//img[@class='_3fWXu3xqpHxPGTycDx3vir']")
    public static WebElement dropdown;

    @FindBy(how = How.XPATH, using = "//span[contains(text(),'Logout')]")
    public static WebElement logout_button;

}