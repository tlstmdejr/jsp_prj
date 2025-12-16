package day1128;

import java.sql.Date;
import java.util.Arrays;

public class ParamDTO {
	private String id,pass,birth,loc,intro,name,email,code,ip,secChUaPlatform,userAgent,profile;
	private String[] lang;
	private Date inputDate;
	public ParamDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getSecChUaPlatform() {
		return secChUaPlatform;
	}
	public void setSecChUaPlatform(String secChUaPlatform) {
		this.secChUaPlatform = secChUaPlatform;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String[] getLang() {
		return lang;
	}
	public void setLang(String[] lang) {
		this.lang = lang;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	@Override
	public String toString() {
		return "ParamDTO [id=" + id + ", pass=" + pass + ", birth=" + birth + ", loc=" + loc + ", intro=" + intro
				+ ", name=" + name + ", email=" + email + ", code=" + code + ", ip=" + ip + ", secChUaPlatform="
				+ secChUaPlatform + ", userAgent=" + userAgent + ", profile=" + profile + ", lang="
				+ Arrays.toString(lang) + ", inputDate=" + inputDate + "]";
	}
	public ParamDTO(String id, String pass, String birth, String loc, String intro, String name, String email,
			String code, String ip, String secChUaPlatform, String userAgent, String profile, String[] lang,
			Date inputDate) {
		super();
		this.id = id;
		this.pass = pass;
		this.birth = birth;
		this.loc = loc;
		this.intro = intro;
		this.name = name;
		this.email = email;
		this.code = code;
		this.ip = ip;
		this.secChUaPlatform = secChUaPlatform;
		this.userAgent = userAgent;
		this.profile = profile;
		this.lang = lang;
		this.inputDate = inputDate;
	}
	
}
