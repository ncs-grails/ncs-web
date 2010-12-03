
 $(document).ready(function(){
	$("input:checkbox").change(function() {
		var val = $(this).attr("checked");
		var role = new String($(this).attr("name"));
		var userId = $("#user\\.id").val();
		var action = new String($("form[name='edit']").attr("action"));
		
		role = role.replace("role_", "");
		
		var postData = { "user.id": userId, "role.id": role };
		
		var doWhat = 'remove';
		if (val) doWhat = 'add';
		action = action.replace("addOrRemove", doWhat);
		
		
		//alert("User ID: " + userId + ", role: " + role + ", value: " + val);
		//alert(action);

		jQuery.post(action, postData, function(result) {
			if (!result.success) {
				var errorText = "An Error occurred.  Details: \n";
				for (i in result.errors) {
					errorText += " * " + result.errors[i] + "\n";
				}
				alert(errorText);
			}
		}, "json");
		
		
	});
 });
