package com.test;

import java.util.Set;

public class ItemModel {
	
	String item_id;
	String item_rev_id;
	String count;
	
	String iconCls; 
    boolean leaf;
    boolean expanded; 
    Set<ItemModel> children ;
    
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getItem_rev_id() {
		return item_rev_id;
	}
	public void setItem_rev_id(String item_rev_id) {
		this.item_rev_id = item_rev_id;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public boolean isExpanded() {
		return expanded;
	}
	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}
	public Set<ItemModel> getChildren() {
		return children;
	}
	public void setChildren(Set<ItemModel> children) {
		this.children = children;
	}
    
    

}
