package portlet;

import java.io.File;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.asset.model.AssetCategory;
import com.liferay.portlet.asset.model.AssetVocabulary;
import com.liferay.portlet.asset.service.AssetCategoryLocalServiceUtil;
import com.liferay.portlet.asset.service.AssetVocabularyLocalServiceUtil;

import core.TipoLogin;

/**
 * @author 105ALZAA
 */
@Controller
@RequestMapping("VIEW")
public class EtorkizunaEraikizPortletViewController {

	@ActionMapping(value = "save")
	public void doSave(ActionRequest request, ActionResponse response) {
		// String idCategoria = ParamUtil.get(request, "idCategoria", "");
		// String datoEu = ParamUtil.get(request, "dato-eu", "");
		// String datoEs = ParamUtil.get(request, "dato-es", "");
		//
		// String nombre = ParamUtil.get(request, "nombre", "");
		// String apellidos = ParamUtil.get(request, "apellidos", "");
		// String email = ParamUtil.get(request, "email", "");
		// String avatar = ParamUtil.get(request, "avatar", "");
		// TipoLogin tipoLogin = TipoLogin.valueOf(ParamUtil.get(request, "tipoLogin",
		// ""));

		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		File ideiaFitxategia = uploadPortletRequest.getFile("ideiaFitxategia");
		String idCategory = uploadPortletRequest.getParameter("gaia");
		String ideiaTestuaEu = uploadPortletRequest.getParameter("ideiaTestuaEu");
		String ideiaTestuaEs = uploadPortletRequest.getParameter("ideiaTestuaEs");

		String izena = uploadPortletRequest.getParameter("izena");
		String abizenak = uploadPortletRequest.getParameter("abizenak");
		String email = uploadPortletRequest.getParameter("email");
		String avatar = uploadPortletRequest.getParameter("avatar");
		TipoLogin tipoLogin = TipoLogin.valueOf(uploadPortletRequest.getParameter("loginMota"));
		String idLogin = uploadPortletRequest.getParameter("idLogin");

		//
		// TODO: service-ari deitu
		//

	}

	@RenderMapping
	public ModelAndView view(RenderRequest request, RenderResponse response) throws PortalException {

		List<AssetCategory> categories = doLoadVocabulary(request, response);
		// Obtener categorķas con id de vocabulario.
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("categories", categories);
		modelAndView.setView("view");
		return modelAndView;
	}

	private java.util.List<com.liferay.asset.model.AssetCategory> doLoadVocabulary(RenderRequest renderRequest,
			RenderResponse renderResponse) {

		// PortletPreferences prefs =
		// PortletPreferencesFactoryUtil.getPortletSetup(request);
		// Long idCategoria = prefs != null && prefs.getMap() != null &&
		// prefs.getMap().get("idVocabulary")[0] != null
		// ? Long.valueOf(prefs.getMap().get("idCategoria")[0])
		// : 0l;
		java.util.List<com.liferay.asset.model.AssetCategory> categories = null;

		ThemeDisplay themeDisplay = (ThemeDisplay) renderRequest.getAttribute(WebKeys.THEME_DISPLAY);
		// PortletDisplay portletDisplay = themeDisplay.getPortletDisplay();
		// String portletId = portletDisplay.getId();

		PortletPreferences prefs = renderRequest.getPreferences();
		Long companyId = themeDisplay.getCompanyId();
		if (prefs != null) {

			Long idVocabulary = GetterUtil.getLong(prefs.getValue("idVocabulary", StringPool.BLANK));

			List<AssetVocabulary> vocs = AssetVocabularyLocalServiceUtil.getCompanyVocabularies(companyId);
			Long vocabularyId = vocs.size() > 0 ? vocs.get(0).getVocabularyId() : null;

			// OrderByComparatorFactoryUtil.create(tableName, columns)
			categories = AssetCategoryLocalServiceUtil.getVocabularyCategories(vocabularyId, 0, 100, null);

		}
		return categories;
	}

}
