package kr.ac.kopo.framework.annotation;

import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(TYPE)
public @interface Controller {

	// Contoller 역할을 수행하는 class에 붙인다.
	// RequestMapping 어노테이션이 붙은 메소드를 가지고 있는 클래스이다.
}
