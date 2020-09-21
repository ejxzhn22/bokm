package com.bokm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bokm.service.MemberService;
import com.bokm.vo.Member;

@Controller
public class MemberController {
	@Inject
	private MemberService memberService;
	@Inject
	private JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.

//회원가입창(join)
	@RequestMapping(value = "join/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	@RequestMapping(value = "join/join", method = RequestMethod.POST)
	public String join(Member member, HttpServletRequest req) {

		String mb_email = req.getParameter("mb_email");
		String mb_address = req.getParameter("mb_address1") + ",";
		mb_address += req.getParameter("mb_address2") + ",";
		mb_address += req.getParameter("mb_address3") + ",";
		mb_address += req.getParameter("mb_address4") + ",";
		mb_address += req.getParameter("mb_address5");
		String email = mb_email;
		System.out.println(email);

		
		member.setMb_email(email);
		member.setMb_address(mb_address);

		memberService.join(member);
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "join/idCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String AjaxView(@RequestBody String result) {

		if (memberService.idCheck(result) == null) {
			return "사용가능합니다";
		} else {
			return "중복된 이메일입니다";
		}
	}

	@ResponseBody
	@RequestMapping(value = "membersearch/idCheck2", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String AjaxView2(@RequestBody String mb_email, Member member) {
		System.out.println(mb_email);
		member = memberService.idCheck(mb_email);
		if (member != null) {
			System.out.println(member);
			return "인증가능!";
		} else {
			System.out.println("member" + member);
			System.out.println("result" + mb_email);
			return "가입된 아이디가 아닙니다";
		}
	}

	// 로그인창 접속
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {
		String referer = request.getHeader("referer");
		model.addAttribute("referer",referer);
		return "login";
	}

	// 로그인 시
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam("mb_email") String email, @RequestParam("mb_pw") String pw, HttpSession session,
			Model model,@RequestParam("referer") String referer) {

		try {

			if (memberService.idCheck(email).getMb_email().equals(email)) {
				if (memberService.idCheck(email).getMb_pw().equals(pw)) {
					session.setAttribute("user", memberService.idCheck(email));

					String root = "root";
					Member member = (Member) session.getAttribute("user");
					if (root.equals(member.getMb_auth())) {
						return "redirect:admin/adminHome";
					}
					return "redirect:"+referer;
				}
				model.addAttribute("msg", "비밀번호가 다릅니다");
				return "alert3";
			}
			model.addAttribute("msg", "아이디가 다릅니다");
			return "alert3";
		} catch (Exception e) {
			model.addAttribute("msg", "아이디가 다릅니다");
			return "alert3";
		}

	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃됨");
		return "redirect:/";
	}

	// mailSending 코드
	@RequestMapping(value = "join/auth.do", method = RequestMethod.POST) // /member/auth.do
	public ModelAndView mailSending(HttpServletRequest request, String mb_email, HttpServletResponse response_email)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "jjy9009@gmail.com"; // 보낸 사람 이메일
		String tomail = request.getParameter("mb_email"); // 받는 사람 이메일
		System.out.println(mb_email);
		System.out.println(request.getParameter("mb_email"));
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 이메일
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일 제목
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("email_injeung"); // 뷰의이름
		mv.addObject("dice", dice);
		mv.addObject("mb_email", mb_email);

		System.out.println("mv : " + mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

	@RequestMapping(value = "membersearch/auth.do2", method = RequestMethod.POST) // /member/auth.do
	public ModelAndView mailSending2(HttpServletRequest request, String mb_email, HttpServletResponse response_email)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "jjy9009@gmail.com"; // 보낸 사람 이메일
		String tomail = request.getParameter("mb_email"); // 받는 사람 이메일
		System.out.println(mb_email);
		System.out.println(request.getParameter("mb_email"));
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 이메일
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일 제목
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("email_injeung2"); // 뷰의이름
		mv.addObject("dice", dice);
		Member member = memberService.idCheck(mb_email);
		String mb_pw = member.getMb_pw();
		mv.addObject("mb_pw", mb_pw);

		System.out.println("mv : " + mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

//이메일 인증 페이지
	@RequestMapping("join/email") // email.do
	public String email() {
		return "email";
	}

//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
//틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "join/join_injeung.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeung(String email_injeung, @PathVariable String dice,
			HttpServletResponse response_equals, @RequestParam("mb_email") String mb_email) throws IOException {

		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("join");

			mv.addObject("mb_email", mb_email);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("email_injeung");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;

		}

		return mv;
	}

	@RequestMapping(value = "membersearch/join_injeung.do2{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeung2(String email_injeung, @PathVariable String dice,
			HttpServletResponse response_equals, @RequestParam("mb_pw") String mb_pw) throws IOException {

		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			
			String mb_pw2 = mb_pw;
			char[] c = mb_pw2.toCharArray();
			String str="";
			
			for(int i=0; i<c.length-2; i++) {
				str += c[i];
			}
			str += "**";

			mv.setViewName("resultpw");
			mv.addObject("mb_pw", str);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("email_injeung2");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;

		}

		return mv;
	}

	@RequestMapping(value = "membersearch/resultpw", method = RequestMethod.POST)
	public String resultpw(@RequestParam("mb_pw") String mb_pw,Model model) {
		
		
		model.addAttribute("mb_pw", mb_pw);
		
		
		
		return "resultpw";
	}
//	도서관정보 
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String info() {
		return "info";
	}

	@RequestMapping(value = "membersearch/searchpw", method = RequestMethod.GET)
	public String searchpw() {
		return "searchpw";
	}

	@RequestMapping(value = "membersearch/searchid", method = RequestMethod.GET)
	public String searchid() {
		return "searchid";
	}

	@RequestMapping(value = "membersearch/searchid.do", method = RequestMethod.POST)
	public ModelAndView searchid2(HttpServletRequest req, Member member) {
		ModelAndView mv = new ModelAndView();
		System.out.println("member="+member);
		List<Member> memberlist = memberService.resultid2(member);
		if (memberlist.size() != 0) {
			System.out.println("memberlist="+memberlist);
			//String mb_email = member.getMb_email();
//			System.out.println(mb_email);

			mv.addObject("Memberlist", memberlist);
			mv.setViewName("resultid");

			return mv;
		} else {
			mv.addObject("msg","회원가입을 해주세요");
			mv.setViewName("alert3");
			
			return mv;
		}
	}
}
