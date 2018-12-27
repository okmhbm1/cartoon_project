package com.bob.please.board.review.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bob.please.board.review.dto.BoardReviewCommentDto;
import com.bob.please.board.review.dto.BoardReviewDto;
import com.bob.please.board.review.service.BoardReviewService;



@Controller
public class BoardReviewController {
	@Autowired
	private BoardReviewService service;
	
	@RequestMapping("/board_review/list")
	public ModelAndView getList(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("board_review/list");
	}
	@RequestMapping("/board_review/insertform")
	public ModelAndView Insertform(HttpServletRequest request) {
		//view 페이지로 forward 이동해서 새글 작성 폼 출력하기 
		return new ModelAndView("board_review/insertform");
	}
	@RequestMapping("/board_review/insert")
	public ModelAndView Insert(@ModelAttribute BoardReviewDto dto,HttpServletRequest request) {
		
		String userid=(String)request.getSession().getAttribute("userid");
		dto.setWriter(userid);
		//새글을 저장한다. 
		service.saveContent(dto);
		//글 목록 보기로 리다일렉트 이동
		return new ModelAndView("redirect:/board_review/list.do");
	}
	@RequestMapping("/board_review/detail")
	public ModelAndView detail(HttpServletRequest request) {
		service.getDetail(request);
		return new ModelAndView("board_review/detail");
	}
	@RequestMapping("/board_review/delete")
	public ModelAndView Delete(@RequestParam int num, HttpServletRequest request) {
		service.deleteContent(num);
		return new ModelAndView("redirect:/board_review/list.do");
	}
	@RequestMapping("/board_review/updateform")
	public ModelAndView UpdateForm(ModelAndView mView, @RequestParam int num, 
			HttpServletRequest request) {
		service.getUpdateData(mView, num);
		mView.setViewName("board_review/updateform");
		return mView;
	}
	@RequestMapping("/board_review/update")
	public ModelAndView Update(@ModelAttribute BoardReviewDto dto,HttpServletRequest request) {
		//서비스를 이용해서 글을 수정반영하고
		service.updateContent(dto);
		//dto 에 담긴 글 번호를 이용해서 글자세히 보기로 리다일렉트 이동시킨다.
		return new ModelAndView("redirect:/board_review/detail.do?num="+dto.getNum());
	}
	//댓글 추가 요청처리
	@RequestMapping("/board_review/comment_insert")
	public ModelAndView CommentInsert(@RequestParam int ref_group, HttpServletRequest request) {
		//서비스를 이용해서 새 댓글을 저장하고 
		service.saveComment(request);
		//ref_group 은 원글의 글번호 이다. (댓글의 그룹번호)
		return new ModelAndView("redirect:/board_review/detail.do?num="+ref_group);
	}
	@RequestMapping("/board_review/comment_update")
	@ResponseBody
	public Map<String, Object> CommentUpdate(@ModelAttribute BoardReviewCommentDto dto,
			HttpServletRequest request){
		//서비스를 통해서 댓글을 업데이트 하는 작업을 하고
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	@RequestMapping("/board_review/comment_delete")
	@ResponseBody
	public Map<String, Object> CommentDelete(@RequestParam int num, HttpServletRequest request) {
		// num 은 삭제할 댓글의 글번호 이다.
		service.deleteComment(num);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
		
}

