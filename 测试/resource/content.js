// var $parentNode = window.parent.document;

// function $childNode(name) {
//     return window.frames[name]
// }

// // tooltips
// $('.tooltip-demo').tooltip({
//     selector: "[data-toggle=tooltip]",
//     container: "body"
// });

// // 使用animation.css修改Bootstrap Modal
// $('.modal').appendTo("body");

// $("[data-toggle=popover]").popover();

// //折叠ibox
// $('.collapse-link').click(function () {
//     var ibox = $(this).closest('div.ibox');
//     var button = $(this).find('i');
//     var content = ibox.find('div.ibox-content');
//     content.slideToggle(200);
//     button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
//     ibox.toggleClass('').toggleClass('border-bottom');
//     setTimeout(function () {
//         ibox.resize();
//         ibox.find('[id^=map-]').resize();
//     }, 50);
// });

// //关闭ibox
// $('.close-link').click(function () {
//     var content = $(this).closest('div.ibox');
//     content.remove();
// });

// //判断当前页面是否在iframe中
// if (top == this) {
//     var gohome = '<div class="gohome"><a class="animated bounceInUp" href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
//     $('body').append(gohome);
// }

//animation.css
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //动画完成之前移除class
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

function openLayerWindow(title,url){
	layer.open({
	  type: 2,
	  title:title,
	  area: ['700px', '530px'],
	  fixed: false, //不固定
	  maxmin: true,
	  content: url
	});
}

function openLayerWindow(title,url,width,height){
	layer.open({
	  type: 2,
	  title:title,
	  area: [width+'px', height+'px'],
	  fixed: false, //不固定
	  maxmin: true,
	  content: url
	});
}

/**
 * 判断是否选择自定义宽高弹窗 否则100%铺满
 * //可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
 * @param title
 * @param url
 * @param width
 * @param height
 * @param isTrue
 * @returns
 */
function openLayerWindow(title,url,width,height,isTrue){
	if(isTrue == true){
		layer.open({
			type: 2,
			title:title,
			area: ['90%', '90%'],
			fixed: true, //固定
			maxmin: true,
			content: url
		});
	}else{
		layer.open({
			type: 2,
			title:title,
			area: [width+'px', height+'px'],
			fixed: false, //不固定
			maxmin: true,
			content: url
		});
	}
}


function openLayerConfirm(title,url){
	layer.confirm(title, {
        skin: 'layer-ext-moon'
    }, function (index, layero) {
        layero.find('.layui-layer-btn0').attr({
            href: url,
            target: '_self'
        });
        layer.close(index);
    });
}


// //拖动面板
// function WinMove() {
//     var element = "[class*=col]";
//     var handle = ".ibox-title";
//     var connect = "[class*=col]";
//     $(element).sortable({
//             handle: handle,
//             connectWith: connect,
//             tolerance: 'pointer',
//             forcePlaceholderSize: true,
//             opacity: 0.8,
//         })
//         .disableSelection();
// };
