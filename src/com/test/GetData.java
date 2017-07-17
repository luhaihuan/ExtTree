package com.test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class GetData
 */

public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String item_id;
	private String item_rev_id;
	
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	

		for(Map.Entry<String, String[]> entry:request.getParameterMap().entrySet()) {
			System.out.println("key:"+entry.getKey());
			if("item_id".equals(entry.getKey())) {
				item_id = entry.getValue()[0];
			}
            if("item_rev_id".equals(entry.getKey())) {
            	item_rev_id = entry.getValue()[0];
			}
			for(String s : entry.getValue()) {
				System.out.println("value:"+s);
			}
		}
		try {
			String tmp_item_id = item_id.replace("*", "%");
			String tmp_item_rev_id = item_rev_id;
			Statement createStatement = OraCon.getInstance().getConn().createStatement();
			String sql = "select it.pitem_id ,itr.pitem_revision_id,oc.pseq_no,oc.rnotes_refu,it2.pitem_id  child_item_id,itr2.pitem_revision_id child_revision_id,"
					   + "(case when oc.pqty_value = -1 then 1 else oc.pqty_value end) pqty_value,oc.rvariant_conditionu,oc.rchild_itemu "
					   + "from pitem it,pitemrevision itr,pbom_view_tags bvt,ppsbomviewrevision bvr,PPSOCCURRENCE oc,pitem it2,pitemrevision itr2 "
					   + "where it.puid = bvt.puid "
					   + "and it.puid = itr.ritems_tagu "
					   + "and bvt.pvalu_0 = bvr.rbom_viewu "
					   + "and bvr.puid = oc.rparent_bvru "
					   + "and oc.rchild_itemu = it2.puid "
					   + "and it2.puid = itr2.ritems_tagu "
					   + "and it.pitem_id like '"+tmp_item_id+"'  "
					   + "and itr.pitem_revision_id like '%"+item_rev_id+"%' "
					   + "order by itr.pitem_revision_id desc,it2.pitem_id asc,itr2.pitem_revision_id asc ";
			ResultSet resultSet = createStatement.executeQuery(sql);
			ItemModel itemModel = new ItemModel();
			Set<ItemModel> models = new HashSet<>();
			while (resultSet.next()) {
				String item_id = resultSet.getString("pitem_id");
				String item_rev_id = resultSet.getString("pitem_revision_id");
				
				String child_item_id = resultSet.getString("child_item_id");
				String child_item_rev_id = resultSet.getString("child_revision_id");
				
				if(itemModel.getItem_rev_id() == null) {
					itemModel.setItem_id(item_id);
					itemModel.setItem_rev_id(item_rev_id);
					itemModel.setCount("3");
					itemModel.setExpanded(false);
					itemModel.setLeaf(false);
				} else if(!item_rev_id.equals(itemModel.getItem_rev_id())) {
					break;
				}
				ItemModel childItem = new ItemModel();
				childItem.setItem_id(child_item_id);
				childItem.setItem_rev_id(child_item_rev_id);
				childItem.setCount("3");
				childItem.setExpanded(false);
				childItem.setLeaf(false);
				models.add(childItem);
				
				
			}
			
			itemModel.setChildren(models);
			Gson gson = new Gson();
			String json = gson.toJson(itemModel);
			System.out.println(json);
			response.getWriter().append(json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
