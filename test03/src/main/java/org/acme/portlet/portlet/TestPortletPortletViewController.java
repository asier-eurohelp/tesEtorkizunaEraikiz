package org.acme.portlet.portlet;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.omg.CORBA.SystemException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.ModelAndView;

import com.liferay.asset.kernel.model.AssetCategory;
import com.liferay.asset.kernel.model.AssetVocabulary;
import com.liferay.asset.kernel.service.AssetCategoryLocalServiceUtil;
import com.liferay.asset.kernel.service.AssetVocabularyLocalServiceUtil;

/**
 * @author liferay
 */
@Controller
@RequestMapping("VIEW")
public class TestPortletPortletViewController {

	@SuppressWarnings("unchecked")
	public List<AssetCategory> getCategoriesByCompanyId(long companyId) {

		List vocabularies = new ArrayList();
		List<AssetCategory> categories = new ArrayList();

		// DynamicQuery queryVocabularies =
		// DynamicQueryFactoryUtil.forClass(AssetVocabulary.class)
		// .add(PropertyFactoryUtil.forName("name").eq("Musika")); // first search for
		// vocabulary
		try {
			// vocabularies =
			// AssetVocabularyLocalServiceUtil.dynamicQuery(queryVocabularies, 0, 1);
			// System.out.println("Vocabularies:" + vocabularies);
			// if (vocabularies.size() < 1) {
			// return categories;
			// }

			// DynamicQuery queryCategories = DynamicQueryFactoryUtil.forClass(
			// AssetCategory.class).add(
			// PropertyFactoryUtil.forName("vocabularyId").eq(
			// vocabularies.get(0).getVocabularyId())); // then get all categories matching
			// the vocabulary
			//
			// categories = AssetVocabularyLocalServiceUtil.dynamicQuery(
			// queryCategories, 0, 100); // let's get some to show
			//
			Long vocabularyId = 0l;
			List<AssetVocabulary> vocs = AssetVocabularyLocalServiceUtil.getCompanyVocabularies(companyId);
			for (AssetVocabulary voc : vocs) {
				System.out.println("Vocs:" + voc);
				vocabularyId = voc.getVocabularyId();
			}

			// OrderByComparatorFactoryUtil.create(tableName, columns)
			AssetCategoryLocalServiceUtil.getVocabularyCategories(vocabularyId, 0, 100, null);

		} catch (SystemException e) {
			// handle exception...
			throw e;
		}

		return categories;
	}

	@RenderMapping
	public ModelAndView view(RenderRequest request, RenderResponse response) {
		StringBuffer printWriter = new StringBuffer();
		for (AssetCategory cat : getCategoriesByCompanyId(20665l)) {
			printWriter.append(cat.getDescription() + ",");
		}
		
		ModelAndView model = new ModelAndView();
		model.addObject("msg", printWriter.toString());
		model.setViewName("view");
		return model;
	}
}