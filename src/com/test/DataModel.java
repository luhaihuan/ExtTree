package com.test;

import java.util.Set;

import net.sf.json.JSONObject;





public class DataModel {
	String task;
    float duration;
    String user;  
    String iconCls; 
    boolean leaf;
    boolean expanded; 
    Set<DataModel> children ;
    
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public float getDuration() {
		return duration;
	}
	public void setDuration(float duration) {
		this.duration = duration;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public boolean isExpanded() {
		return expanded;
	}
	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}
	public Set<DataModel> getChildren() {
		return children;
	}
	public void setChildren(Set<DataModel> children) {
		this.children = children;
	}
    public static void main(String[] args) {
    	DataModel model = new DataModel();
		model.setDuration(10);
		model.setExpanded(true);
		model.setIconCls("Cls");
		model.setTask("Task");
		model.setUser("user");
		System.out.println(JSONObject.fromObject(model).toString());
	
	}
}
