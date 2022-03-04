package com.hanwha.myapp.vo;

public class MemberVO {
	private int num;
	private String userid;
	private String userpwd;
	private String username;
	
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private int size1;
	private int size2;
	private int size3;
	private int size4;
	private int size5;
	
	private String writedate;
	
	private int icon;
	
	/*출력*/
	public void memberOutPut() {
		System.out.printf("아이디:%s, 비밀번호:%s, 이름:%s, 연락처:%s, 사이즈1:%d\n. 사이즈2:%d\n, 사이즈3:%d\\n, 사이즈4:%d\\n, 사이즈5:%d\n", userid, userpwd, username, getTel(), size1, size2, size3, size4, size5);
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		tel = tel1+"-"+tel2+"-"+tel3;
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		String telSplit[] = tel.split("-");
		tel1 = telSplit[0];
		tel2 = telSplit[1];
		tel3 = telSplit[2];
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	
	
	public int getSize1() {
		return size1;
	}

	public void setSize1(int size1) {
		this.size1 = size1;
	}

	public int getSize2() {
		return size2;
	}

	public void setSize2(int size2) {
		this.size2 = size2;
	}

	public int getSize3() {
		return size3;
	}

	public void setSize3(int size3) {
		this.size3 = size3;
	}

	public int getSize4() {
		return size4;
	}

	public void setSize4(int size4) {
		this.size4 = size4;
	}

	public int getSize5() {
		return size5;
	}

	public void setSize5(int size5) {
		this.size5 = size5;
	}

	
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getIcon() {
		return icon;
	}

	public void setIcon(int icon) {
		this.icon = icon;
	}
	
}
