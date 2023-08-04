package egovframework.omcst.manage.users.exception;

public class DuplicatedEmailException extends RuntimeException {
	public DuplicatedEmailException() {
        super("중복된 이메일 입니다");
    }
}