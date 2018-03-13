package etorkizunaEraikiz.portlet.portlet;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ValidatorException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.portlet.PortletPreferencesFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;

/**
 * @author 105ALZAA
 */
@Controller
@RequestMapping("EDIT")
public class EtorkizunaEraikizPortletConfigController {

	@ActionMapping(value = "save")
	public void doSave(ActionRequest request, ActionResponse response)
			throws PortalException, ReadOnlyException, ValidatorException, IOException {
		PortletPreferences prefs = PortletPreferencesFactoryUtil.getPortletSetup(request);
		String idVocabulary = ParamUtil.get(request, "idVocabulary", "");
		if (prefs != null && prefs.getMap() != null) {
			prefs.setValue("idVocabulary", idVocabulary);
			prefs.store();
		}
		response.setRenderParameter("result", "OK");
	}

	@RenderMapping
	public ModelAndView view(RenderRequest request, RenderResponse response) {
		String result = ParamUtil.get(request, "result", "NOK");
		ModelAndView mv = new ModelAndView();
		if (result != null)
			mv.addObject("result", result);
		mv.setView("config");
		return mv;
	}
}
