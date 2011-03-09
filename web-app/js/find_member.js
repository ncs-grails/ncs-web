$(document).ready(function(){

	$("#memberFilter").keyup(function(){
		var searchString = $(this).val()
		// hide em all
		
		if (searchString.length == 0 ) {
			$('#mailingListMemberInstanceList > ul > li').show();
		} else {
			
			$('#mailingListMemberInstanceList > ul > li').hide();

			// show the ones that match?
			$('#mailingListMemberInstanceList > ul > li:contains(' + searchString + ')').each(function(index){
				$(this).show();
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