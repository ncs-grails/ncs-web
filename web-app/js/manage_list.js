$(document).ready(function(){

	$("#memberFilter").change(function(){
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

function toggleListMembers(listName){
	var divId = '#' + listName + '-members'
	var content = $(divId).html();
	var url = $("form[name='memberList']").attr("action");
	
	url = url + "/" + listName;
	
	if (content.length == 0) {
		$(divId).load(url);
	}
	
	$(divId).toggle('blind');
	
	return false;
}

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

function showMemberEdit(element) {
	
	$(element).parent().parent().children('.readOnly').hide();
	$(element).parent().children('.readOnly').hide();
	$(element).parent().parent().children('.editable').show();
	$(element).parent().children('.editable').show();
	
	return false;
}

function cancelMemberEdit(element) {
	
	$(element).parent().parent().children('.editable').hide();
	$(element).parent().children('.editable').hide();
	$(element).parent().parent().children('.readOnly').show();
	$(element).parent().children('.readOnly').show();
	
	return false;
}

function removeMemberConfirm(element) {
	
	var fullName = $(element).parent().parent().children('.fullName').html();
	
	alert("Are you sure you wish to remove\n " + fullName + "\n from this list?");
	
	return false;
}
