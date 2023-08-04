package egovframework.omcst.manage.users.exception;

public class DuplicatedIdException extends RuntimeException {
	public DuplicatedIdException() {
        super("중복된 아이디 입니다");
    }
}