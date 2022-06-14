// 주소관련 함수
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
			const detailAddress = document.getElementById("sample4_detailAddress");
			const jibunAddress = document.getElementById("sample4_jibunAddress");
			

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
			detailAddress.style.display='block';
			jibunAddress.style.display='block';
        }
    }).open();
}

/*키보드 엔터시 제출되는것을 방지하는 함수 */
$('input[type="text"]').keydown(function() {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
});


//입력창 유효성검사
const input_userOldPwd = document.getElementById("user_oldPwd");

const group_userPwd1 = document.getElementById("group_userPwd1");
const input_userPwd1 = group_userPwd1.querySelector("input");
let txts_userPwd1 = group_userPwd1.getElementsByClassName("txt");

const group_userPwd2 = document.getElementById("group_userPwd2");
const input_userPwd2 = group_userPwd2.querySelector("input");
let txts_userPwd2 = group_userPwd2.getElementsByClassName("txt");


/*input창 클릭시 하단 텍스트 표시 함수*/
function screenTxtPwd1(){
    txts_userPwd1[0].style.display = 'block';
    txts_userPwd1[1].style.display = 'block';
}

function screenTxtPwd2(){
    txts_userPwd2[0].style.display = 'block';
}

function userPwdCheck1(){
    if(input_userPwd1.value.length >= 10){
        txts_userPwd1[0].style.color = 'green';
    }else if(input_userPwd1.value.length < 10){
        txts_userPwd1[0].style.color = 'red';
    }

    if(input_userPwd1.value != input_userOldPwd.value){
        txts_userPwd1[1].style.color = "green"
    }else if(input_userPwd1.value == input_userOldPwd.value){
        txts_userPwd1[1].style.color = "red"
    }
}

function userPwdCheck2(){
    if(input_userPwd1.value == input_userPwd2.value){
        txts_userPwd2[0].style.color = "green";
    }else{
        txts_userPwd2[0].style.color = "red";
    }
}

/*Password input창 클릭시 하단 텍스트 표시 이벤트*/
input_userPwd1.addEventListener("click",screenTxtPwd1);
input_userPwd2.addEventListener("click",screenTxtPwd2);
input_userPwd1.addEventListener("keyup",userPwdCheck1);
input_userPwd2.addEventListener("keyup",userPwdCheck2);


// 이메일 중복검사
const btn_userEmail  = document.getElementById("btn_userEmail");
btn_userEmail.addEventListener("click",function(){
	const input_userEmail = document.getElementById("user_email");
	const userEmail = input_userEmail.value;
	const user_id = document.getElementById("user_id").value;
	$.ajax({
			type: "post",
			url: "user/user_emailCheck.jsp",
			data:{paramEmail : userEmail,paramUserId : user_id},
			datatype: "jsp",
			success: function(data){
				if(data == 1){
					swal("중복된 이메일입니다.", "다시한번 확인해 주세요.");
					$("#user_email").val('').focus();
					$("#user_email_check").val(0);
				}else if(data == 2){
					swal("기존 이메일로 사용 가능한 이메일입니다.", "", "success");
					$("#user_email_check").val(1);
				}else{
					swal("사용 가능한 이메일입니다.", "", "success");
					$("#user_email_check").val(1);
				}
		},
		error: function(data){
			swal("통신오류입니다.", "다시한번 확인해 주세요.");
		}
	});
	
});

// 성별선택 라디오버튼
const pre_gender = document.getElementById("pre_gender");
const user_gender1 = document.getElementById("user_gender1");
const user_gender2 = document.getElementById("user_gender2");
const user_gender3 = document.getElementById("user_gender3");
if(pre_gender.value == '남'){
	user_gender1.checked= true;
}else if(pre_gender.value == '여'){
	user_gender2.checked= true;
}
else if(pre_gender.value == '무'){
	user_gender3.checked= true;
}




function submitCheck(){
	const userId = document.getElementById("user_id");
	const user_oldPwd = document.getElementById("user_oldPwd");
	const hidden_oldPwd = document.getElementById("hidden_oldPwd");
	const userPwd1 = document.getElementById("user_pwd1");
	const userPwd2 = document.getElementById("user_pwd2");
	const userName = document.getElementById("user_name");
	const userEmail = document.getElementById("user_email");
	const user_email_check = document.getElementById("user_email_check");
	const userPhone = document.getElementById("user_phone");
	const btn_address = document.getElementById("btn_address");
	const userJibunAddress = document.getElementById("sample4_jibunAddress"); //지번주소
	const userDetailAddress = document.getElementById("sample4_detailAddress");// 상세주소
	
	if(user_oldPwd.value == ""){
		swal("비밀번호 유효성검사.", "현재 비밀번호를 입력해 주세요!");
		user_oldPwd.focus();
		return false;
	}else if(user_oldPwd.value != hidden_oldPwd.value){
		swal("비밀번호 유효성검사.", "현재 비밀번호가 일치하지 않습니다!!");
		user_oldPwd.value = "";
		user_oldPwd.focus();
		return false;
	}
	
	if(userPwd1.value == ""){
		swal("비밀번호 유효성검사.", "새 비밀번호를 입력해 주세요!");
		userPwd1.focus();
		return false;
	}else if(userPwd1.value.length < 10){
		swal("비밀번호 유효성검사.", "10자리 이상의 비밀번호를 입력해 주세요");
		userPwd1.value = "";
		userPwd1.focus();
		return false;
	}
	
	if(userPwd2.value == ""){
		swal("비밀번호 유효성검사.", "새 비밀번호확인 미입력");
		userPwd2.focus();
		return false;
	}else if(userPwd2.value != userPwd1.value){
		swal("비밀번호 유효성검사.", "새 비밀번호가 일치하지 않습니다.");
		userPwd2.value = "";
		userPwd2.focus();
		return false;
	}
	
	if(userEmail.value == ""){
		swal("이메일 유효성검사", "이메일을 입력해 주세요");
		userEmail.focus();
		return false;
	}else if(user_email_check.value == "0"){
		swal("이메일 유효성검사", "이메일 중복검사를 진행해 주세요");
		userEmail.focus();
		return false;
	}
	
	if(userPhone.value == ""){
		swal("연락처 유효성검사", "연락처를 입력해 주세요");
		userPhone.focus();
		return false;
	}
	if(userDetailAddress.value == ""){
		swal("주소 유효성검사", "상세주소를 입력해 주세요");
		btn_address.focus();
		return false;
	}

}






