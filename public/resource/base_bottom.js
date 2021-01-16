// 锟斤拷锟斤拷js
document.write('<script src="./resource/jquery.min.js"></script>');
document.write('<script src="./resource/bootstrap.min.js"></script>');
// 锟斤拷锟斤拷Angularjs
document.write('<script src="./resource/angular.min.js"></script>');
// 锟斤拷锟斤拷sweetalert锟斤拷锟斤拷锟斤拷js
document.write('<script src="./resource/sweetalert.min.js"></script>');
// 锟斤拷锟斤拷通知锟矫伙拷锟斤拷toastr锟斤拷JS
document.write('<script src="./resource/toastr.min.js"></script>');
// 锟斤拷锟斤拷锟皆讹拷锟斤拷锟紸ngular业锟斤拷JS
document.write('<script src="./resource/common.js?v=8"></script>');

// //引入layer JS
document.write('<script src="./resource/layer.min.js"></script>');
//layer 弹框插件
document.write('<script src="./resource/sweetalert.min.js"></script>');
//layer 自定义弹窗跳转js
document.write('<script src="./resource/content.js"></script>');
//默认分页参数
var _pageSizeArray=[10,15,20,30,50];
var _pageNumArray=[-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9];


//获取用户session回话
function getUserSession(){
	var _mapResult =null;
	$.ajax({
		  type :"POST",
		  dataType : "json",
		  url :'/pubWeb/getOrRemoveUserSession',
		  data :{'type':1},
		  success :function(data){
			  if(data.code == 0){
				  _mapResult = data.result;
			  }
		  },
		  async :false,//是否异步请求
		  error:function(XmlHttpRequest,textStatus, errorThrown){
		  	var errorMsg = XmlHttpRequest.status+":"+textStatus;
		  }
	});
	return _mapResult;
}


//服务器常量状态
function getSystemFlag(type){
	var _keyValue = null;
	$.ajax({
        type :"post",
        dataType : "json",
        url : "/pubWeb/getSystemFlag",
        data : {"type":type},
        async : false,  //处理成同步
        success : function(data){
        	if(data.code == 0){
        		_keyValue =  data.result;
        	}
        },
        error:function(XmlHttpRequest,textStatus, errorThrown){
        	_keyValue=false;
		  }
   });
	return _keyValue;
}

//获取请求地址参数值 //只能是英文参数
function GetQueryString(name) {
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}

//获取地址栏参数//可以是中文参数
function getUrlParam(key) {
    // 获取参数
    var url = window.location.search;
    // 正则筛选地址栏
    var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
    // 匹配目标参数
    var result = url.substr(1).match(reg);
    //返回参数值
    return result ? decodeURIComponent(result[2]) : null;
}
