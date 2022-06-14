function deleteCategory(num){
		let res = confirm("카테고리를 삭제하시면 해당 카테고리 안의 상품이 삭제됩니다.\n정말로 삭제하시겠습니까?");
		if(res){
			location.href="admin_category_delete.do?num="+num;
		}
}

function updateCategory(num){
		location.href="admin_category_update.do?num="+num;
}

function choosingTail(head){
	var a_var = ['001[농작물]', '002[수산물]', '003[축산물]', '004[간식]'];
	var b_var = ['001[생수·음료수]', '002[커피·차]', '003[주류]'];
	var c_var = ['001[화장품]', '002[세면도구]'];
	var d_var = ['001[생활용품]', '002[주방용품]', '003[가전제품]'];
	var z_var = ['001[기타]']
	
	var target = document.getElementById("tail");

	if(head.value=="A") { var tail = a_var; }
	else if(head.value == "B") { var tail = b_var; }
	else if(head.value == "C") { var tail = c_var; }
	else if(head.value == "D") { var tail = d_var; }
	else { var tail = z_var; }
	
	target.options.length = 0;
	
	for (i in tail){
		var opt = document.createElement("option");
		opt.value = tail[i];
		opt.innerHTML = tail[i];
		target.appendChild(opt);
	}
}