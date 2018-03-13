package portlet;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

@Controller
@RequestMapping("VIEW")

public class TestController {

	@RenderMapping
	public String view(RenderRequest request, RenderResponse response) {
		System.out.println("testController");
		return "view";
	}
}
