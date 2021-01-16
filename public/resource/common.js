var common=angular.module('common',[]);

//Toastr通知
toastr.options = {
	"closeButton": true,
	"debug": false,
	"progressBar": true,
	"positionClass": "toast-top-right",
	"onclick": null,
	"showDuration": "200",
	"hideDuration": "500",
	"timeOut": "1300",
	"extendedTimeOut": "500",
	"showEasing": "swing",
	"hideEasing": "linear",
	"showMethod": "fadeIn",
	"hideMethod": "fadeOut"
};
//ajax转请求方式
var _postCfg={
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    transformRequest: function (data) {
        return $.param(data);
    }
};
//定义公用业务JS
common.service('commonService',function(){
	/** 将参数传递的方式改成form,Angular参数的默认是以json格式进行传递,所以Struts2普通的form参数获取值无法传递 **/
	var postCfg = {
	    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
	    transformRequest: function (data) {
	        return $.param(data);
	    }
	};
	/**
	  * 公用的获取参数传递的方法
	  * 
	  */
	this.paramConfig=function(){
		return postCfg;
	};
	/**
	  * 公用的页面初始化查询方法
	  * 参数说明:_scope AngularJS的作用域范围
	  * 	   _http AngularJS的简化Ajax请求的工具类
	  * 	   _url 查询的请求地址
	  * 	   _queryParam 查询的参数(一般为keyword(关键字)、pageCtrl.currentPage(当前页)、pageCtrl.pageSize(页容量))
	  * 结果绑定:dataResult 视图中的Model(data.result)
	  * 	   pageModel 视图中的分页数据(data.page)
	  * 
	  * */
	this.freshPage = function(_scope,_http,_url,_queryParam){
		//初始化按钮为禁用
		_scope.disable=true;
		_http.post(_url,_queryParam,postCfg).success(function(data){
			if(typeof data == "string"){
				data = JSON.parse(data);
			}
			if(data.code != null && data.code != 0 && data.code != 304) {
				if(data.code == 320){
					window.parent.location.href='/PcWeb/';
					return;
				}
				swal("获取数据失败", "失败详情：" + data.errorMessage, "error");
				return;
			}
			
			//绑定视图中的data模型
			_scope.dataResult = data.result;
			//绑定视图中的分页模型
			_scope.pageModel = data.pageAction;
			//启用按钮
			_scope.disable=false;
		} ,"json");
	};
	
	/*
	 * 自定义 请求方法 返回结果集
	 * */
	this.requestPostMethod = function(_http,_url,_queryParam,callback){
		var dataResult = null;
		_http.post(_url,_queryParam,postCfg).success(function(data){
			if(typeof data == "string"){
				data = JSON.parse(data);
			}
			
			if(data.code != null && data.code != 0 && data.code != 304) {
				if(data.code == 320){
					window.parent.location.href='/PcWeb/';
					return;
				}
				swal("获取数据失败", "失败详情：" + data.errorMessage, "error");
				return;
			}
			//赋值结果集
			dataResult = data.result;
			//返回结果集
			callback(dataResult);
		} ,"json");
	};
	
	/*
	 * 自定义 请求方法 返回整个结果集 不做返回状态处理 
	 * */
	this.ajaxPostMethod = function(_http,_url,_queryParam,_checkLogin,callback){
		var dataResult = null;
		_http.post(_url,_queryParam,postCfg).success(function(data){
			if(typeof data == "string"){
				data = JSON.parse(data);
			}
			
			//判断是否验证登录处理 true 为需要验证 false 不需要验证
			if(_checkLogin){
				if(data.code == 320){
					window.parent.location.href='/PcWeb/';
					return;
				}
			}
			//赋值结果集
			dataResult = data;
			//返回结果集
			callback(dataResult);
		} ,"json");
	};
	
	
	
	/**
	  * 分页的页码切换方法(currentPage)
	  * 参数说明:_scope AngularJS的作用域范围
	  * 	   _pageNo 要跳转到第几页页码值
	  * 注意:在切换之后请在调用方法中手动调用自定义的页面初始化方法刷新数据
	  * 
	  */
	this.toPage=function(_scope,_pageNo){
		if(_scope.pageModel!=null){
			_scope.pageModel.currentPage=_pageNo;
		}
	};
	/**
	  * 模糊查询的执行方法
	  * 参数说明:_scope AngularJS的作用域范围
	  * 注意:在切换之后请在调用方法中手动调用自定义的页面初始化方法刷新数据
	  */
	this.searchPage=function(_scope){
		if(_scope.pageModel!=null){
			_scope.pageModel.currentPage = 1;
		}
	};
	/**
	  * 更改页容量的方法(pageSize)
	  * 参数说明:_scope AngularJS的作用域范围
	  * 注意:在切换之后请在调用方法中手动调用自定义的页面初始化方法刷新数据
	  */
	this.changefreshPage=function(_scope){
		//需要计算页容量的大小
		//用户所选择的页容量大小
		var pageSize=_scope.pageSizeTag;
		//当前页码
		var pageNo=_scope.pageModel==null?"0":_scope.pageModel.currentPage;
		//总共当前
		var totalCount=_scope.pageModel==null?"0":_scope.pageModel.totalCount;
		
		//如果当前的页码容量乘以当前页大于了总共的项，更改当前的页码
		if(pageSize*pageNo>totalCount){
			_scope.pageModel.currentPage=Math.ceil(totalCount/(pageNo*pageSize));
		}
	};
	/**
	  * 公用的前往修改页面方法
	  * 参数说明:_scope AngularJS的作用域范围
	  * 	   _http AngularJS的简化Ajax请求的工具类
	  * 	   _url 前往修改的地址
	  * 	   _param 附带的参数
	  * 	   _objModal 模态框的对象
	  * 结果绑定:model 视图中的data(data.result,一般是单个实体,所以一般是data.result[0])
	  */
	this.baseToMod=function(_scope,_http,_url,_param,_objModal){
		//_scope.disable=true;
		_http.post(_url,_param,postCfg).success(function(data) {
			if(typeof data == "string"){
				data = JSON.parse(data);
			}
			if(data.code != 0) {
				if(data.code == 320){
					window.parent.location.href='/PcWeb/';
					return;
				}
				swal("错误", "错误详情" + data.errorMessage, "warning");
				return;
			}
			//TODO:如果需要参数可以根据需求自行拓展
			if(data.result[0]){
				_scope.edits = data.result[0];
			}else{
				_scope.edits = data.result;
			}
			_objModal.modal();
		} ,"json");
	};
	/**
	  * 公用的修改方法
	  * 参数说明:_scope AngularJS的作用域范围
	  * 	   _url 修改的地址
	  * 	   _param 附带的参数
	  * 	   _objModal 模态框的对象
	  */
	this.baseMod=function(_scope,_url,_param,_objModal){
		//_scope.disable=true;
		$.post(_url,_param,function(data){
			if(typeof data == "string"){
				data = JSON.parse(data);
			}
			if(data.code==null || data.code != 0) {
				if(data.code == 320){
					window.parent.location.href='/PcWeb/';
					return;
				}
				_objModal.modal('hide');
				swal("修改失败", "失败详情：" + data.errorMessage, "error");
				return;
			}
			toastr.success("修改成功", "修改成功");
			_objModal.modal('hide');
			_scope.freshPage();
		} ,"json");
	};
	/**
	  * 公用的前往添加页面方法
	  * 参数说明:_scope AngularJS的作用域范围
	  * 	   _http AngularJS的简化Ajax请求的工具类
	  * 	   _url 前往添加的地址
	  * 	   _param 附带的参数
	  * 	   _objModal 模态框的对象
	  */
	this.baseToAdd=function(_scope,_http,_url,_param,_objModal){
		//_scope.disable=true;
		_http.post(_url,_param,postCfg).success(function(data){
			if(typeof data == "string"){
				data = JSON.parse(data);
			}
			if(data.code==null || data.code != 0) {
				if(data.code == 320){
					window.parent.location.href='/PcWeb/';
					return;
				}
				swal("错误", "错误详情" + data.errorMessage, "warning");
				return;
			}
			//TODO:如果需要参数可以根据需求自行拓展
			_objModal.modal();
		} ,"json");
	};
	/**
	  * 公用的添加方法
	  * 参数说明:_scope AngularJS的作用域范围
	  * 	   _http AngularJS的简化Ajax请求的工具类
	  * 	   _url 前往添加的地址
	  * 	   _param 附带的参数
	  * 	   _objModal 模态框的对象
	  */
	this.baseAdd=function(_scope,_url,_param,_objModal){
		//_scope.disable=true;
		$.post(_url,_param,function(data){
			if(typeof data == "string"){
				data = JSON.parse(data);
			}
			if(data.code==null || data.code != 0) {
				if(data.code == 320){
					window.parent.location.href='/PcWeb/';
					return;
				}
				_objModal.modal('hide');
				swal("添加失败", "失败详情：" + data.errorMessage, "error");
				return;
			}
			toastr.success("添加成功", "添加成功");
			_objModal.modal('hide');
			_scope.freshPage();
		} ,"json");
	};
	/**
	  * 公用的删除方法
	  * 参数说明:_scope AngularJS的作用域范围
	  * 	   _http AngularJS的简化Ajax请求的工具类
	  * 	   _name 要删除的名称
	  * 	   _url 前往添加的地址
	  * 	   _param 附带的参数
	  */
	this.baseDelete=function(_scope,_name,_url,_param){
		//_scope.disable=true;
		parent.layer.confirm("您确定要删除 " + _name, {
			  btn: ['确认','取消'] //按钮
			}, function(index){
			parent.layer.close(index);
			$.post(_url,_param,function(data){
				if(typeof data == "string"){
					data = JSON.parse(data);
				}
				if(data.code==null || data.code != 0) {
					if(data.code == 320){
						window.parent.location.href='/PcWeb/';
						return;
					}
					toastr.error("删除 " + _name + " 失败", data.errorMessage);
					return;
				}
				toastr.success("删除 " + _name + " 成功", "删除成功");
				_scope.freshPage();
			} ,"json");
		});
		
	};
});