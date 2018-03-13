package com.test.portlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.web.portlet.ModelAndView;

import com.liferay.portlet.PortletPreferencesFactoryUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
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
import com.liferay.util.bridges.mvc.MVCPortlet;

import core.TipoLogin;

public class IdeiakSortuPortlet extends MVCPortlet {

	@Override
	public void doConfig(RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {

		PortletPreferences prefs;
		try {
			prefs = PortletPreferencesFactoryUtil.getPortletSetup(renderRequest);
		} catch (PortalException e) {
			throw new PortletException(e);
		} catch (SystemException e) {
			throw new PortletException(e);
		}
		String idVocabulary = ParamUtil.get(renderRequest, "idVocabulary", "");
		if (prefs != null && prefs.getMap() != null) {
			prefs.setValue("idVocabulary", idVocabulary);
			prefs.store();
		}
		renderRequest.setAttribute("result", true);
	}

	@Override
	public void processAction(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
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

		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(actionRequest);
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

	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {

		List<AssetCategory> categories = doLoadVocabulary(renderRequest, renderResponse);
		// Obtener categorías con id de vocabulario.

		renderRequest.setAttribute("categories", categories);

	}

	private List doLoadVocabulary(RenderRequest renderRequest, RenderResponse renderResponse) {

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
