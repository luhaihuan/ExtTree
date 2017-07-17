Ext.require([
    'Ext.data.*',
    'Ext.grid.*',
    'Ext.tree.*'
]);
Ext.onReady(function() {
	//开启tooltip工具
    Ext.QuickTips.init();
	//定义model
    Ext.define('partModel', {
        extend: 'Ext.data.Model',
        fields: [
            {name: 'partNo',   type: 'string'},
            {name: 'partName', type: 'string'},
            {name: 'partVer',  type: 'string'}
        ]
    });
	//创建一个TreeStore
    var store = Ext.create('Ext.data.TreeStore', {
        model: 'partModel',
        root:treeGridData,
        folderSort: false
    });
    var tree = Ext.create('Ext.tree.Panel', {
        title: 'Ext树型表格使用示例',
        width: 400,
        height: 300,
        renderTo: 'treeGridDiv',
        useArrows: false,
        rootVisible: false,
        store: store,
        multiSelect: true,
		defaults:{
			sortable: true
		},
        columns: [{
            xtype: 'treecolumn', 
            text: '部件编号',
            flex:2,
            dataIndex: 'partNo'
		},{
            text: '部件名称',
            flex:1,
            dataIndex: 'partName'
		},{
            text: '版本',
            width: 70,
            dataIndex: 'partVer'
		}]
    });
});
