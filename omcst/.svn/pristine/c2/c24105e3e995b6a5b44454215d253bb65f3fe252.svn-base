package egovframework.omcst.common.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.omcst.common.vo.ResultVO;

@Component
public class DefaultValidation {
	
	@Autowired
	private DefaultBeanValidator beanValidator;

	@Autowired
	private EgovMessageSource egovMessageSource;
	
	public <T> Boolean checkDefaultValidation(T vo, BindingResult bindingResult,ResultVO result) {
		beanValidator.validate(vo, bindingResult);
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			String fieldNm = fieldError.getArguments()[0].toString();
			String errorMsg = egovMessageSource.getMessage(fieldError.getDefaultMessage()).replace("{0}", fieldNm);
			// throw new RuntimeException(errorMsg);
			result.setMessage(errorMsg);
			return false;
		} 
		return true;
	}
}
