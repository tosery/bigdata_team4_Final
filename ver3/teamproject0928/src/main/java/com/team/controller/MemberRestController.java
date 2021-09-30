package com.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.domain.MemberVO;
import com.team.domain.TempVO;
import com.team.service.MemberService;

/*
  REST ��Ʈ�ѷ��� HTTP method ���� ��Ģ
  POST   - Create  (SQL Insert��)
  GET    - Read    (SQL Select��)
  PUT    - Update  (SQL Update��)
  DELETE - Delete  (SQL Delete��)
*/
@RestController  // �� ��Ʈ�ѷ��� ��� �޼ҵ��� ���ϰ��� JSON �Ǵ� XML �������� ������
@RequestMapping("/api/*")
public class MemberRestController {
	
	@Autowired
	private MemberService memberService;

	// GET��û  http://localhost:8090/api/members/user1       -> XML ����
	// GET��û  http://localhost:8090/api/members/user1.json  -> JSON ����
	
	@GetMapping(value = "/members/{id}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Map<String, Object>> getOne(@PathVariable("id") String id) {
		
		MemberVO memberVO = memberService.getMemberById(id);
		int count = memberService.getCountById(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", memberVO);
		map.put("count", count);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	} // getOne
	
	@GetMapping(value = "/members", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<MemberVO>> getAll() {
		
		List<MemberVO> memberList = memberService.getMembers();
		
		return new ResponseEntity<List<MemberVO>>(memberList, HttpStatus.OK);
	} // getAll
	
//	@GetMapping(value="/member/appraisalMember", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
//	public ResponseEntity<String> appraisal(){
//		
//		
//		
//		return new ResponseEntity<String> (,HttpStatus.OK);
//	}
	
	@PutMapping(value = "/members/{id}",
			consumes = "application/json",
			produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<TempVO> modify(@RequestBody TempVO tempVO) {
		
		//��ȣ�� �µ� ����
		tempVO.setTemperature(tempVO.getTemperature());
		memberService.tempupdate(tempVO);
		
		// update�� VO ��ü�� OK �����ڵ�� �Բ� �������� ��
		return new ResponseEntity<TempVO>(tempVO, HttpStatus.OK);
	} // modify
	
}





