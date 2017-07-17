var partIcon = 'imgs/part.gif';
var carIcon = 'imgs/Car.gif';
var basicNodeIcon = 'imgs/BasicNode.gif';
var structureIcon = 'imgs/StructureNode.gif';
var purgeIcon = 'imgs/purge_create.gif';
var moduleIcon = 'imgs/Module.gif';
var variantIcon = 'imgs/Variant.gif';

treeGridData = {"text":".","children": [
    {
        partNo:'00FN1-00000',
        partName:'KLQ1032-FN1',
        qtip:'车型节点',
        icon:carIcon,
        expanded: true,
		partVer: 'A.1',
        children:[{
            partNo:'LFQ-04',
            partName:'转向',
            qtip:'模块节点',
			expanded: true,
            icon:moduleIcon,
			partVer: 'A.1',
            children:[{
                partNo:'00TEST-16000',
                partName:'离合器系统',
				partVer: 'A.1',
				expanded: true,
                qtip:'结构节点',
				icon:structureIcon,
				partVer: 'A.1',
                children:[{
					partNo:'00TEST-560300',
					partName:'后风窗',
					qtip:'基本节点',
					leaf: true,
					partVer: 'A.1',
					icon:basicNodeIcon
				}]
            },{
                partNo:'00TEST-17000',
                partName:'变速系统',
                qtip:'结构节点',
                icon:structureIcon,
				expanded: true,
				partVer: 'A.1',
                children:[{
					partNo:'OP-LT4-760310-01',
					partName:'软化们',
					qtip:'选项节点',
					leaf: true,
					partVer: 'A.1',
					icon:variantIcon
				}]
            },{
                partNo:'00TEST-28000',
                partName:'车架总成',
                qtip:'结构节点',
				partVer: 'A.1',
                icon:structureIcon,
				expanded: true,
                children:[{
					partNo:'OP-EUJ-810400-01',
					partName:'压缩机安装(WP10)',
					qtip:'选项节点',
					leaf: true,
					partVer: 'A.1',
					icon:variantIcon
				}]
            },{
                partNo: '00TEST-31000',
                partName: '车轮及轮毂',
                qtip: '结构节点',
                icon:structureIcon,
				partVer: 'A.1',
				expanded: true,
                children:[{
					partNo:'31VMC-02030',
					partName:'轮罩防盗螺丝刀',
					qtip:'部件',
					leaf: true,
					partVer: 'A.1',
					icon:partIcon
				}]
            }]
        }, {
            partNo:'LFQ-05',
            partName:'制动',
            qtip:'模块节点',
			partVer: 'A.1',
            icon:moduleIcon,
            expanded: true,
            children:[{
                partNo:'TC1H802540-0120',
                partName:'槽钢',
                qtip:'部件',
                leaf:true,
				partVer: 'A.1',
                icon:partIcon
            }]
		},{
			partNo:'AC1H802540-0120',
            partName:'槽钢',
            qtip:'部件',
            leaf:true,
			partVer: 'A.1',
            icon:partIcon
		}]
    }
]}