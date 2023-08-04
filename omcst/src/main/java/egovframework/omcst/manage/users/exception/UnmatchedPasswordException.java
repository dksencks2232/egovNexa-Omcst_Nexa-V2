package egovframework.omcst.manage.users.exception;

public class UnmatchedPasswordException extends RuntimeException {
	public UnmatchedPasswordException() {
        super("비밀번호가 서로 일치하지 않습니다.");
    }
}