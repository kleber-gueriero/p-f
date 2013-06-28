var loadMain = function(pageUrl){
	var $main = $("#main");
	var $newPageContainer = $("<div></div>");
	var $loadingMain = loading($main[0]);
	$($newPageContainer).load(pageUrl,function(){
		$main.find(">*[id|='page']").remove();
		var $newPage = $newPageContainer.find("#main > *");
		$newPage.hide();
		$main.append($newPage);
		$loadingMain.remove();
		var toggleEffect = "fade";
		switch(Math.round(Math.random()*10)){
			case 1: case 2:
				toggleEffect = "drop";
				break;
			case 3: case 4:
				toggleEffect = "fade";
				break;
			case 5: case 6:
				toggleEffect = "fold";
				break;
			case 7: case 8:
				toggleEffect = "size";
				break;
			case 9: case 10:
				toggleEffect = "slide";
				break;
			default:
				toggleEffect = "fade";
				break;
		}
		$newPage.show({effect: toggleEffect, complete: readyFunction});
	});
}

var readyFunction = function(){
	$(window).unbind('.framework');
	$("*").unbind('.framework');
	if (history.state == null) {
		var currentUrl = "http://" + document.location.host + "/";
		history.replaceState({pageUrl: currentUrl},document.title, currentUrl);
	};
	$("a").bind('click.framework',
		function(event){
			event.preventDefault();
			
			var pageUrl = this.href;
			loadMain(pageUrl);
			history.pushState({pageUrl: pageUrl},document.title, pageUrl);
		}
	);
	$(window).bind('popstate.framework', function(event) {
		var state = event.originalEvent.state;
		if (state) {
			loadMain(state.pageUrl);
		};
	});

	$(document).foundation();
	$("*[data-field-type='date']").datepicker({
	    dateFormat: 'dd/mm/yy',
	    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
	    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
	    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
	    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
	    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
	    nextText: 'Próximo',
	    prevText: 'Anterior'
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
