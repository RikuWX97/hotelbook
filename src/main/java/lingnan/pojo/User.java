package lingnan.pojo;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.*;

import java.util.Date;

public class User {
    private Integer id;
    @NotNull(message = "用户名不能为空!")
    @Length(message = "用户名长度必须在{min}-{max}位之间!", max = 20, min = 2)
    private String name;
    @NotNull(message = "密码不能为空!")
    @Size(min = 6, message = "密码长度不能小于{min}位!")
    private String password;
    private String sex;
    @Email(message = "邮箱格式不不正确!")
    private String email;
    @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码格式不正确!")
    private String phone;
    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone="GMT+8")//后台时间传到前台无法解析时用
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")//记得去springmvc注册consersionService
    @Past(message = "注册日期不不正确!")
    private Date regDate;
    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone="GMT+8")//后台时间传到前台无法解析时用
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")//记得去springmvc注册consersionService
    @Past(message = "最后一次登录日期不正确!")
    private Date lastLoginDate;
    private Integer access;

    public User() {
    }

    public User(Integer id, String name, String password, String email, String phone, Date regDate, Date lastLoginDate, Integer access) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.regDate = regDate;
        this.lastLoginDate = lastLoginDate;
        this.access = access;
    }

    public User(Integer id, @NotNull(message = "用户名不能为空!") @Length(message = "用户名长度必须在{min}-{max}位之间!", max = 20, min = 2) String name, @NotNull(message = "密码不能为空!") @Size(min = 6, message = "密码长度不能小于{min}位!") String password, String sex, @Email(message = "邮箱格式不不正确!") String email, @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码格式不正确!") String phone, @Past(message = "注册日期不不正确!") Date regDate, @Past(message = "最后一次登录日期不正确!") Date lastLoginDate, Integer access) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.sex = sex;
        this.email = email;
        this.phone = phone;
        this.regDate = regDate;
        this.lastLoginDate = lastLoginDate;
        this.access = access;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public Integer getAccess() {
        return access;
    }

    public void setAccess(Integer access) {
        this.access = access;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", regDate=" + regDate +
                ", lastLoginDate=" + lastLoginDate +
                ", access=" + access +
                '}';
    }
}
