package memberShip;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {

	public MemberDAO(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}
	
	
	// 로그인한 아이디와 패스워드로 회원 정보 DTO반환하는 메소드 
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String sql = " select * from member where id=? and pass=? " ;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, upass);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
