$(document).ready(function(){

	$("#memberFilter").keyup(function(){
		var searchString = $(this).val().toLowerCase();

		// hide em all
		
		if (searchString.length == 0 ) {
			$('#mailingListMemberInstanceList > ul > li').show();
		} else {
			// show the ones that match?
			$('#mailingListMemberInstanceList > ul > li').each(function(){
				var text = $(this).html().toLowerCase();

				if (text.indexOf(searchString) > -1) {
					$(this).show();
				} else {
					$(this).hide();
				}
			});
		}
	});
});

function showMemberDetail(address, divId){
	var divId = '#' + divId
	var content = $(divId).html();
	var url = $("form[name='showMember']").attr("action");
	
	url = url + "/" + address;
	
	if (content.length == 0) {
		$(divId).load(url);
	}
	
	$(divId).toggle('blind');
	
	return false;
}