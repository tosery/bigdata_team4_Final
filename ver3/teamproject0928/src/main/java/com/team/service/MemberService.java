package com.team.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.domain.MemberVO;
import com.team.domain.ProfilePicVO;
import com.team.domain.TempVO;
import com.team.mapper.MemberMapper;

@Service // @Component 怨꾩뿴 �븷�끂�뀒�씠�뀡
//@Transactional
public class MemberService {
	
	private MemberMapper memberMapper;

	// @Autowired �븷�끂�뀒�씠�뀡�씠 �깮�꽦�옄�뿉�꽌�뒗 �깮�왂媛��뒫 
	public MemberService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	// �쉶�썝媛��엯�븯湲�
	public void register(MemberVO memberVO) {
		
//		long beginTime = System.currentTimeMillis();
		
		memberMapper.insert(memberVO);
		
//		long endTime = System.currentTimeMillis();
		
//		long diff = endTime - beginTime;
//		System.out.println("硫붿냼�뱶 �떎�뻾�떆媛� : " + diff + "ms");
	}
	
	public MemberVO getMemberById(String id) {
		MemberVO memberVO = memberMapper.getMemberById(id);
		return memberVO;
	}
	
	public List<MemberVO> getMembers() {
		return memberMapper.getMembers();
	}
	
	public int getCountById(String id) {
		return memberMapper.getCountById(id);
	}
	
	public int deleteMemberById(String id) {
		int rowCount = memberMapper.deleteMemberById(id);
		return rowCount;
	}
	
	//�궡 �젙蹂� �닔�젙�븯湲�
		public void updateMember(MemberVO memberVO) {
			memberMapper.updateMember(memberVO);
		}
		//鍮꾨�踰덊샇 蹂�寃쏀븯湲�
		public void updatePasswd(MemberVO memberVO) {
			memberMapper.updatePasswd(memberVO);
		}
		/* �굹�쓽 �젙蹂� �뾽�뜲�씠�듃 */
		public void updateMyInfo(MemberVO memberVO, ProfilePicVO profilePicVO) {
			memberMapper.updateMember(memberVO);

		}
		
		public void tempupdate(TempVO tempVO) {
			memberMapper.tempupdate(tempVO);
		}

}





