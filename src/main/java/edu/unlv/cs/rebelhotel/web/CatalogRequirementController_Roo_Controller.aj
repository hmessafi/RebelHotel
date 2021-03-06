// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package edu.unlv.cs.rebelhotel.web;

import edu.unlv.cs.rebelhotel.domain.CatalogRequirement;
import edu.unlv.cs.rebelhotel.domain.Term;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CatalogRequirementController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CatalogRequirementController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("catalogrequirement", CatalogRequirement.findCatalogRequirement(id));
        model.addAttribute("itemId", id);
        return "catalogrequirements/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CatalogRequirementController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("catalogrequirements", CatalogRequirement.findCatalogRequirementEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CatalogRequirement.countCatalogRequirements() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("catalogrequirements", CatalogRequirement.findAllCatalogRequirements());
        }
        return "catalogrequirements/list";
    }
    
    @ModelAttribute("terms")
    public Collection<Term> CatalogRequirementController.populateTerms() {
        return Term.findAllTerms();
    }
    
    String CatalogRequirementController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
