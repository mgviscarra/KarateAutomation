package examples.users.step_definitions;

import cucumber.api.java.en.Then;

public class Steps {

	@Then("^hello word$")
	public void hello_word ()
	 {
	  System.out.println("Hello word *********************************************************************************");
	 }

}
