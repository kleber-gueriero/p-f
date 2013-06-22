var readyFunction = function(){
	 $("a").click(
		function(event){
			event.preventDefault();
			
			var $main = $("#main");
			var $newPageContainer = $("<div></div>");
			var $loadingMain = loading($main[0]);
			$($newPageContainer).load(this.href,function(){
				$main.find(">*[id|='page']").remove();
				var $newPage = $newPageContainer.find("#main > *");
				$newPage.hide();
				$("body").append($newPage);
				$newPage.show();
				$loadingMain.remove();
			});
		}
	);
	$(document).foundation();	

	$(".date-field").datepicker({
		altFormat : "dd/MM/yy"
	});
};
$(document).ready(readyFunction);

function loading(container){
	 var $container = $(container);
	 var $overlay = $(
	 	"<div class='loading-overlay'></div>"
	);
	var $animation = $(
		"<div class='spinner'>"+
        	"<div class='mask'>"+
            	"<div class='maskedCircle'></div>"+
        	"</div>"+
    	"</div>"
	); 
	$overlay.width($container.width());
	$overlay.height($container.height());
	$(container).append($overlay);
	var loadingObj = $overlay;
	return loadingObj;
}
