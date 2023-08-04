package egovframework.let.utl.fcc.service;

import java.lang.reflect.Field;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Service;

/**
 * @author csh
 * 20230411
 * 게시판 페이징 모듈화
 */
@Service
public class PageInfoUtil {

    public PaginationInfo makePaginationInfo(Object vo) {
    	
        PaginationInfo paginationInfo = new PaginationInfo();
        
        try {
        	
            Field pageIndexField = getField(vo.getClass(), "pageIndex");
            Field recordCountPerPageField = getField(vo.getClass(), "recordCountPerPage");
            Field pageSizeField = getField(vo.getClass(), "pageSize");

            pageIndexField.setAccessible(true);
            recordCountPerPageField.setAccessible(true);
            pageSizeField.setAccessible(true);

            paginationInfo.setCurrentPageNo(pageIndexField.getInt(vo));
            paginationInfo.setRecordCountPerPage(recordCountPerPageField.getInt(vo));
            paginationInfo.setPageSize(pageSizeField.getInt(vo));

        } catch (NoSuchFieldException e) {
            throw new RuntimeException("Error while creating PaginationInfo", e);
        } catch (Exception e) {
            throw new RuntimeException("Error while creating PaginationInfo", e);
        }
        return paginationInfo;
    }

    public Object makeObjectVO(PaginationInfo paginationInfo, Object vo) {
    	
        try {
        	
            Field firstIndexField = getField(vo.getClass(), "firstIndex");
            Field lastIndexField = getField(vo.getClass(), "lastIndex");
            Field recordCountField = getField(vo.getClass(), "recordCountPerPage");

            firstIndexField.setAccessible(true);
            lastIndexField.setAccessible(true);
            recordCountField.setAccessible(true);

            firstIndexField.set(vo, paginationInfo.getFirstRecordIndex());
            lastIndexField.set(vo, paginationInfo.getLastRecordIndex());
            recordCountField.set(vo, paginationInfo.getRecordCountPerPage());

        } catch (NoSuchFieldException e) {
            throw new RuntimeException("Error while creating object VO", e);
        } catch (Exception e) {
            throw new RuntimeException("Error while creating object VO", e);
        }
        return vo;
    }
    
    //vo파일 상속/ 다중상속시 필드값 return
    private Field getField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        try {
            return clazz.getDeclaredField(fieldName);
        } catch (NoSuchFieldException e) {
            Class<?> superclass = clazz.getSuperclass();
            if (superclass == null) {
                throw e;
            } else {
                return getField(superclass, fieldName);
            }
        }
    }
}