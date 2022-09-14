package com.gdj51.MyP.common.component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
@EnableAspectJAutoProxy
public class AOPComponent {
	// Pointcut -> 적용범위
	// @Pointcut(범위설정)
	/*
	 * 범위 execution -> include필터 !execution -> exclude필터 * -> 모든것 *(..) -> 모든 메소드 ..
	 * -> 모든 경로 && -> 필터 추가
	 */
	@Pointcut("execution(* com.gdj51.MyP..HomeController.*(..))")
	public void testAOP() {
	}

	// ProceedingJoinPoint -> 대상 적용 이벤트 필터
	/*
	 * @Before -> 메소드 실행 전
	 * 
	 * @After -> 메소드 실행 후
	 * 
	 * @After-returning -> 메소드 정상실행 후
	 * 
	 * @After-throwing -> 메소드 예외 발생 후
	 * 
	 * @Around -> 모든 동작시점
	 */
	@Around("testAOP()")
	public ModelAndView testAOP(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = new ModelAndView();

		// Request 객체 취득
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();

		mav = (ModelAndView) joinPoint.proceed(); // 기존 이벤트 처리 행위를 이어서 진행

		System.out.println("------- testAOP 실행됨 ------");

		return mav;
	}

	// pointcut은 여러개 사용가능
	// 주의사항 : 범위를 잘 잡아야한다.
	// &&와 ||을 섞어 쓰는 거 비추
	// 차리리 pointcut을 여러개 만들어서 사용해라~
	// Ajax의 경우 String을 반환하기 때문에 ModelAndView로 구현이 안됨으로 따로 처리해야함.
	// 자바클래스와 메소드만 포인트컷 안에 작석할 수 있다. 어노테이션을 넣을 수 없다.
	@Pointcut("execution(* com.gdj51.MyP..controller.ManagerController.*(..))"
			+ "&& !execution(* com.gdj51.MyP..controller.ManagerController.*Ajax(..))") // ATConroller안에 있는 모든 메소드
	public void managerAOP() {
	}

	@Around("managerAOP()")
	public ModelAndView atAOP(ProceedingJoinPoint joinPoint) throws Throwable {// 예외가 발생할 수 있어서 안전장치 걸어두자!
		// Request 객체 취득
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();

		HttpSession session = request.getSession();// 세션가져오기!

		ModelAndView mav = new ModelAndView();

		// 조건 순서 중요
		if (session.getAttribute("sMemAuto") == null || !String.valueOf(session.getAttribute("sMemAuto")).equals("1")) {
			System.out.println("관리자가 아닌 사람이 관리자 url에 접근했다!!!");
			// response.sendRedirect(cPath+"/home");//contextpath를 작성해서 '절대 경로'로 이동
			mav.setViewName("redirect:home");
		} else {
			mav = (ModelAndView) joinPoint.proceed();
		}

		return mav;
	}

	/*
	 * 글작성, 리뷰 aop 작업할 것.
	 * 
	 * 
	 * @Pointcut("execution(* com.gdj51.MyP..controller.컨트롤러.*Insert(..))"
	 * +"|| execution(* com.gdj51.MyP..controller.컨트롤러.*Update(..))")//ATConroller안에
	 * 있는 모든 메소드 public void memberCkAOP() {}
	 * 
	 * @Around("memberCkAOP()") public ModelAndView ckAOP(ProceedingJoinPoint
	 * joinPoint) throws Throwable {//예외가 발생할 수 있어서 안전장치 걸어두자! ModelAndView mav =
	 * new ModelAndView();
	 * 
	 * //Request 객체 취득 HttpServletRequest request =
	 * ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).
	 * getRequest();
	 * 
	 * HttpSession session = request.getSession();//세션가져오기!
	 * 
	 * //등록과, 수정은 로그인 유무가 중요하지?! if(session.getAttribute("sMemNm") != null &&
	 * session.getAttribute("sMemNm")!="") {//로그인 중인 경우 mav =
	 * (ModelAndView)joinPoint.proceed(); }else {//비로그인인 경우
	 * mav.setViewName("redirect:testALogin"); }
	 * 
	 * return mav; }
	 */

}