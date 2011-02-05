// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package edu.unlv.cs.rebelhotel.web;

import edu.unlv.cs.rebelhotel.domain.Student;
import edu.unlv.cs.rebelhotel.domain.Term;
import edu.unlv.cs.rebelhotel.domain.WorkEffort;
import edu.unlv.cs.rebelhotel.domain.WorkRequirement;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect StudentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String StudentController.create(@Valid Student student, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("student", student);
            return "students/create";
        }
        student.persist();
        return "redirect:/students/" + encodeUrlPathSegment(student.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String StudentController.createForm(Model model) {
        model.addAttribute("student", new Student());
        return "students/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String StudentController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("student", Student.findStudent(id));
        model.addAttribute("itemId", id);
        return "students/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String StudentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("students", Student.findStudentEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Student.countStudents() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("students", Student.findAllStudents());
        }
        return "students/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String StudentController.update(@Valid Student student, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("student", student);
            return "students/update";
        }
        student.merge();
        return "redirect:/students/" + encodeUrlPathSegment(student.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String StudentController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("student", Student.findStudent(id));
        return "students/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String StudentController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Student.findStudent(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/students?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @RequestMapping(params = { "find=ByNSHEEquals", "form" }, method = RequestMethod.GET)
    public String StudentController.findStudentsByNSHEEqualsForm(Model model) {
        return "students/findStudentsByNSHEEquals";
    }
    
    @RequestMapping(params = "find=ByNSHEEquals", method = RequestMethod.GET)
    public String StudentController.findStudentsByNSHEEquals(@RequestParam("NSHE") Long NSHE, Model model) {
        model.addAttribute("students", Student.findStudentsByNSHEEquals(NSHE).getResultList());
        return "students/list";
    }
    
    @ModelAttribute("terms")
    public Collection<Term> StudentController.populateTerms() {
        return Term.findAllTerms();
    }
    
    @ModelAttribute("workefforts")
    public Collection<WorkEffort> StudentController.populateWorkEfforts() {
        return WorkEffort.findAllWorkEfforts();
    }
    
    @ModelAttribute("workrequirements")
    public Collection<WorkRequirement> StudentController.populateWorkRequirements() {
        return WorkRequirement.findAllWorkRequirements();
    }
    
    String StudentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
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
