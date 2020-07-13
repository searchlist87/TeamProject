/**
 * admin.js
 */
	// 사이드 title메뉴바 설정
//	$(".nice-select").remove();
//	$("#selectBox").css("display", "block");
	var changeColor="";
	$(".title_menu").click(function(e) {
		e.preventDefault();
		$(".categor-list > dd").hide(500);
		if(changeColor != "") {
			changeColor.css("color","black");
		}
		changeColor = $(this);
		var sub_open = $(this).attr("data-link");
		
		if(sub_open == "sub_open") {
			$(this).css("color","red");
			var that = $(this).parent().parent().children("dd");
			that.show(500);
		}
	});
