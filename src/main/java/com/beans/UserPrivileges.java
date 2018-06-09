package com.beans;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_privileges")
public class UserPrivileges {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
    private Integer Id;
	
	@Column(name="user_name")
	private String userName;
	
	@Column(name="menu_name")
	private String menuName;
	
	@Column(name="menu_value")
	private String menuValue;
	
	@Column(name="view")
	private boolean view;
	
	@Column(name="edit")
	private boolean edit;
	
	@Column(name="delete")
	private boolean delete;
	
	@Column(name="add")
	private boolean add;
	
	@Column(name="privs")
	private String [] privs;
	
	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuValue() {
		return menuValue;
	}

	public void setMenuValue(String menuValue) {
		this.menuValue = menuValue;
	}

	public boolean isView() {
		return view;
	}

	public void setView(boolean view) {
		this.view = view;
	}

	public boolean isEdit() {
		return edit;
	}

	public void setEdit(boolean edit) {
		this.edit = edit;
	}

	public boolean isDelete() {
		return delete;
	}

	public void setVdelete(boolean delete) {
		this.delete = delete;
	}

	public boolean isAdd() {
		return add;
	}

	public void setAdd(boolean add) {
		this.add = add;
	}

	public String [] getPrivs() {
		return privs;
	}

	public void setPrivs(String [] privs) {
		this.privs = privs;
	}

}
