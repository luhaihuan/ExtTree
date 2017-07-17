<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

String path =request.getContextPath();

String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/ext-theme-neptune/build/resources/ext-theme-neptune-all.css">

<script type="text/javascript" src="<%=basePath%>ext/ext-all.js"></script>
<script type="text/javascript" src="<%=basePath%>ext/ext-all-debug.js"></script>
<script type="text/javascript" src="<%=basePath%>ext/ext-bootstrap.js"></script>

<script type="text/javascript" src="<%=basePath%>ext/ext-theme-neptune/build/ext-theme-neptune.js"></script>
<script type="text/javascript" src="<%=basePath%>ext/ext-locale-zh_CN.js"></script>

<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.1.js"></script>



<script type="text/javascript">
    /*    $(function() {
    	   alert($('strong').html(function(index,value){
    		   return value + 'lhh';
    	   })); 
       }); */

       Ext.onReady(function(){  
    	   //Ext.Msg.alert('info','hello');
    	    Ext.QuickTips.init();  
    	  
    	    //we want to setup a model and store instead of using dataUrl  
    	    Ext.define('Item', {  
    	        extend: 'Ext.data.Model',  
    	        fields: [  
    	            {name: 'item_id',     type: 'string'},  
    	            {name: 'item_rev_id',     type: 'string'},  
    	            {name: 'count', type: 'string'}  
    	        ]  
    	    });  
    	    var store = Ext.create('Ext.data.TreeStore', {  
    	        model: 'Item', 
    	        root : {//定义根节点，此配置是必须的
    	        	  task: 'root',
    	              text : '组织架构',
    	              expanded : false
    	          	},
    	        autoLoad : false,
    	         proxy: {  
    	            type: 'ajax',  
    	            //the store will get the content from the .json file  
    	            url: 'GetData', 			
		            extraParams : {  
		            	item_id : '',
		            	item_rev_id : ''
		                } 
    	        },   
    	        listeners : {  
                    'nodebeforeexpand' : function(node,eOpts){  
                //点击父亲节点的菜单会将节点的id通过ajax请求，将到后台  
                        
                        this.proxy.extraParams.item_id = node.data.item_id;  
                        this.proxy.extraParams.item_rev_id = node.data.item_rev_id; 
                        //alert(node.data.text);  
                      //node.childNodes.sort(function (a, b) { return a.data.text.localeCompare(b.data.text); });
                    },  
              	  
                } ,
    	        folderSort: true  
    	    });  
    	      
    	  //Ext.ux.tree.TreeGrid在UX扩展中也有，但不常用，您可以简单地使用一个tree.TreePanel  
    	    var treePanel = Ext.create('Ext.tree.Panel', {  
    	        title: 'BOM TEST',  
    	        width: 500,  
    	        height: 500,  
    	       // renderTo: 'treegrid',  
    	        collapsible: true,  
    	      //  useArrows: true,  
    	        rootVisible: true,  
    	        store: store,  
    	        multiSelect: true,  
    	        singleExpand: false, 
    	      
    	       
    	          
    	      //the 'columns' property is now 'headers'  
    	        columns: [{  
    	            xtype: 'treecolumn', //this is so we know which column will show the tree  
    	            text: 'Item_id',  
    	            flex: 2,  
    	            sortable: true,  
    	            dataIndex: 'item_id'  
    	        },/* {  
    	            //we must use the templateheader component so we can use a custom tpl  
    	            xtype: 'templatecolumn',  
    	            text: 'item_rev_id',  
    	            flex: 1,  
    	            sortable: true,  
    	            dataIndex: 'item_rev_id',  
    	            align: 'center',  
    	            //add in the custom tpl for the rows  
    	            tpl: Ext.create('Ext.XTemplate', '{duration:this.formatHours}', {  
    	                formatHours: function(v) {  
    	                    if (v < 1) {  
    	                        return Math.round(v * 60) + ' mins';  
    	                    } else if (Math.floor(v) !== v) {  
    	                        var min = v - Math.floor(v);  
    	                        return Math.floor(v) + 'h ' + Math.round(min * 60) + 'm';  
    	                    } else {  
    	                        return v + ' hour' + (v === 1 ? '' : 's');  
    	                    }  
    	                }  
    	            })  
    	        }, */ {  
    	            text: 'Item_rev_id',  
    	            flex: 2,  
    	            dataIndex: 'item_rev_id',  
    	            width: 150,
    	            sortable: true  
    	        }, {  
    	            text: 'Count',  
    	            flex: 1,  
    	            dataIndex: 'count',  
    	            width: 150,
    	            sortable: true  
    	        },  {  
    	            xtype: 'checkcolumn',  
    	            header: 'Done',  
    	            dataIndex: 'done',  
    	            width: 60,  
    	            stopSelection: false  
    	        }, {  
    	            text: 'Edit',  
    	            width: 60,  
    	            menuDisabled: true,  
    	            xtype: 'actioncolumn',  
    	            tooltip: 'Edit task',  
    	            align: 'center',  
    	            icon: '<%=basePath%>/ext/edit.png',  
    	            handler: function(grid, rowIndex, colIndex, actionItem, event, record, row) {  
    	                Ext.Msg.alert('Editing' + (record.get('done') ? ' completed task' : '') , record.get('task'));  
    	            }  
    	        }]  
    	    });  
    	  
    	    var form = Ext.create('Ext.form.Panel', {					                     		    		    
     		    height: 120,
     		    width: 100,
     		    bodyPadding: 10,
     		    defaultType: 'textfield',
     		    items: [
     		        {
     		        	id:'item_id',
     		            fieldLabel: 'item_id(*)',
     		            name: 'item_id' ,
     		            labelAlign: 'right',
     	                labelWidth: 70,
     	                allowBlank: false,	                
     	                blankText: '请输入itemid'
     	                
     		        },{
     		        	id:'item_rev_id',
     		            fieldLabel: 'item_rev_id',
     		            name: 'item_rev_id' ,
     		            labelAlign: 'right',
     	                labelWidth: 70,
     	                allowBlank: true,	                
     	                blankText: '请输入item_rev_id'
     	                
     		        }
     		    ],
     		   buttonAlign:'right', 
     		   buttons: [{
			    	xtype: 'button',
			    	name:'search_bom',
			    	type : 'submit', 
			    	text:'搜索',
			    	handler: function() {
			    		if(form.getForm().isValid()) {
			    			form.getForm().doAction('submit',{  
			    				 url: 'GetData',               		
        	              		 method:'get',         	              		
        	               	success:function(form,action){ 
        	               	
        	               		Ext.Msg.alert("success",action.result.responText);
        	               		
        	               	
        	               		
        	               	},  
        	               	failure:function(form,action){  
        	                   //	Ext.Msg.alert("failure",action.result); 
        	                   	var treeRoot = store.getRoot();
        	                   	treeRoot.data.item_id = action.result.item_id;
        	                   	treeRoot.data.item_rev_id = action.result.item_rev_id;
        	                	treeRoot.data.count = action.result.count;
        	                	treeRoot.data.iconCls = action.result.iconCls;
        	                	treeRoot.data.leaf = action.result.leaf;
        	                	treeRoot.data.expanded = action.result.expanded;
        	                	store.reload();
        	               	}  
        	           		});
			    		}
			    	}
			    },{
			    	xtype: 'button',
			    	name:'search_cancel',
			    	text:'取消',
			    	handler: function() {
			    		
			    	}
			    }] 
			
     		});
    	     var mainviewport = Ext.create('Ext.container.Viewport', {
    			layout : 'border',			
    			items : [ {
					defaultType:'container',
					layout:'fit',
					region : 'west',
					collapsible : false,
					split : true,
					title : 'item',
					width : 300,
					
					
					// could use a TreePanel or AccordionLayout for navigational
					items : form
			        },{
    						defaultType:'container',
    						layout:'fit',
    						region : 'center',
    						collapsible : false,
    						split : true,
    						title : '树示例',
    						
    						
    						
    						// could use a TreePanel or AccordionLayout for navigational
    						items : treePanel
    				}	]
    		}); 
    	});  
       </script>
</head>
<body>


</body>
</html>