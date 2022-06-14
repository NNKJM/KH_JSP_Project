<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/join.css">
<script src="https://kit.fontawesome.com/3de1cbcb05.js" crossorigin="anonymous"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
                
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                const roadAddr = data.roadAddress; // 도로명 주소 변수
                const extraRoadAddr = ''; // 참고 항목 변수
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
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	//입력창 유효성검사
	$(function(){
		
		const input_userId = $("#user_id");
		const txtuserId1 = $("#group_userId .txt_case1");
		const txtuserId2 = $("#group_userId .txt_case2");
		const btn_userId = $("#btn_userId");
		
		const input_userEmail = $("#user_email");
		const btn_userEmail = $("#btn_userEmail");


		const input_userPwd1 = $("#user_pwd1");
		const txtuserPwd1 = $("#group_userPwd1 .txt_case1");

		const input_userPwd2 = $("#user_pwd2");
		const txtuserPwd2 = $("#group_userPwd2 .txt_case1");

		input_userId.keyup(userIdCheck1);
		btn_userId.click(userIdCheck2);
		input_userPwd1.keyup(userPwdCheck1);
		input_userPwd2.keyup(userPwdCheck2);
		
		btn_userEmail.click(userEmailCheck);


		function userIdCheck1(){
			const userId = input_userId.val();
			if(userId.length >= 6){
				txtuserId1.css("color","green");
			}else{
				txtuserId1.css("color","red");
			}
		}

		function userIdCheck2(){
			const userId = input_userId.val();
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/user/user_idCheck.jsp",
				data:{paramId : userId},
				datatype: "jsp",
				success: function(data){
					if(data==1){
						txtuserId2.css("color","red");
						swal("중복된 아이디입니다.", "다시한번 확인해 주세요.");
						$("#user_id_check").val(0);
						$("#user_id").val('').focus();;
					
					}else{
						txtuserId2.css("color","green");
						swal("사용 가능한 아이디입니다.", "", "success");
						$("#user_id_check").val(1);
					}
			},
			error: function(data){
				swal("통신오류입니다.", "다시한번 확인해 주세요.");
			}
		});
		}

		function userPwdCheck1(){
			const userPwd1 = input_userPwd1.val();
			if(userPwd1.length >= 10){
				txtuserPwd1.css("color","green");
			}else{
				txtuserPwd1.css("color","red");
			}
		}

		function userPwdCheck2(){
			const userPwd1 = input_userPwd1.val();
			const userPwd2 = input_userPwd2.val();
			if(userPwd1 === userPwd2){
				txtuserPwd2.css("color","green");
			}else{
				txtuserPwd2.css("color","red");
			}
		}
		
		function userEmailCheck(){
			const userEmail = input_userEmail.val();
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/user/user_emailCheck.jsp",
				data:{paramEmail : userEmail,paramUserId : ""},
				datatype: "jsp",
				success: function(data){
					if(data==1){
						swal("중복된 이메일입니다.", "다시한번 확인해 주세요.");
						$("#user_email").val('').focus();
						$("#user_email_check").val(0)
					
					}else{
						swal("사용 가능한 이메일입니다.", "", "success");
						$("#user_email_check").val(1)
					}
			},
			error: function(data){
				swal("통신오류입니다.", "다시한번 확인해 주세요.");
			}
		});
		}
		
		
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			});
		
		

	});
	//submit 유효성검사
	function submitCheck(){
		const userId = document.getElementById("user_id").value;
		const userPwd1 = document.getElementById("user_pwd1").value;
		const userPwd2 = document.getElementById("user_pwd2").value;
		const userName = document.getElementById("user_name").value;
		const userEmail = document.getElementById("user_email").value;
		const userPhone = document.getElementById("user_phone").value;
		const userJibunAddress = document.getElementById("sample4_jibunAddress").value; //지번주소
		const userDetailAddress = document.getElementById("sample4_detailAddress").value;// 상세주소
		const userGender = $('input:radio[name=user_gender]:checked').val();
		const user_birth_year = document.getElementById("user_birth_year").value;
		const user_birth_month = document.getElementById("user_birth_month").value;
		const user_birth_day = document.getElementById("user_birth_day").value;
		
		const user_id_check = $("#user_id_check").val();
		const user_email_check = $("#user_email_check").val();
		
		
		if(user_id_check==0){
			swal("아이디 중복체크확인.", "중복체크를 진행해 주세요.");
			$("#user_id").focus();
			return false;
		}
		if(userId.length<6){
			swal("아이디 유효성검사.", "6자 이상의 영문 혹은 영문과 숫자를 조합해 주세요.");
			$("#user_id").focus();
			return false;
		}
		if(userPwd1<10){
			swal("비밀번호 유효성검사.", "10자 이상 입력");
			$("#user_pwd1").focus();
			return false;
		}
		if(userPwd1!=userPwd2){
			swal("비밀번호 유효성검사.", "같은 비밀번호를 입력하여 주세요");
			$("#user_pwd2").focus();
			return false;
		}
		
		if(userName==''){
			swal("유저이름 유효성검사.", "이름을 입력하여 주세요");
			$("#user_name").focus();
			return false;
		}
		
		if(userEmail==''){
			swal("이메일 유효성검사.", "이메일을 입력해 주세요.");
			$("#user_email").focus();
			return false;
		}
		
		if(user_email_check==0){
			swal("이메일 중복체크확인.", "중복체크를 진행해 주세요.");
			$("#user_phone").focus();
			return false;
		}
		
		if(userPhone==''){
			swal("연락처 유효성검사.", "연락처를 입력해 주세요.");
			$("#sample4_detailAddress").focus();
			return false;
		}
		
		if(userDetailAddress==''){
			swal("주소 유효성검사.", "상세주소를 입력해 주세요.");
			$("#btn_address").focus();
			return false;
		}
		
		
	}
	

</script>
</head>

<body>

<jsp:include page="/include/main_top.jsp"></jsp:include>
<div class="container">
	<h2>회원가입</h2>
	<p class="page_sub" style="margin-left:550px"><span class="ico">*</span>필수입력사항</p>
	<form method="post" action="<%=request.getContextPath()%>/user_join_ok.do" onsubmit="return submitCheck();">
		<table border="0" cellspacing="0" >
			<tr>
				<th>아이디<span class="ico">*</span></th>
				<td>
					<div id="group_userId">
					<input type="text" id="user_id" name="user_id" cmaxlength="16" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
					<button type="button" id="btn_userId"class="btn btn-outline-secondary">중복확인</button>
					<input type="hidden" id="user_id_check" value=0>
					<p class="txt_guide square" style="display: block;"></p>
					<span class="txt txt_case1">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
    				<span class="txt txt_case2">아이디 중복확인</span>
					</div>
				</td>
			</tr>

			<tr>
				<th>비밀번호<span class="ico">*</span></th>
				<td>
					<div id="group_userPwd1">
					<input type="password" id="user_pwd1" name="user_pwd1" maxlength="16" placeholder="비밀번호를 입력해주세요">
					<p class="txt_guide square">
						<span class="txt txt_case1">10자 이상 입력</span>
					</div>
				</td>
			</tr>

			<tr>
				<th>비밀번호확인<span class="ico">*</span></th>
				<td>
					<div id="group_userPwd2">
					<input type="password" id="user_pwd2" name="user_pwd2" maxlength="16" placeholder="비밀번호를 한번더 입력해주세요">
					<p class="txt_guide square">
						<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
					</div>
				</td>
			</tr>

			<tr>
				<th>이름<span class="ico">*</span></th>
				<td>
					<input type="text" id="user_name" name="user_name" placeholder="이름을 입력해 주세요">
				</td>
			</tr>

			<tr>
				<th>이메일<span class="ico">*</span></th>
				<td>
					<input type="text" id="user_email" name="user_email" placeholder="예: marketkurly@kurly.com">
					<button type="button" id="btn_userEmail" class="btn btn-outline-secondary">중복확인</button>
					<input type="hidden" id="user_email_check" value="0">
				</td>
			</tr>

			<tr>
				<th>휴대폰<span class="ico">*</span></th>
				<td>
					<input type="text" id="user_phone" name="user_phone" placeholder="'-'제외하고 숫자만 입력해주세요">
				</td>
			</tr>

			<tr>
				<th>주소<span class="ico">*<span></th>
					<td >
						<button type="button" id = "btn_address" class="btn btn-outline-secondary btn_address" onclick="sample4_execDaumPostcode()"><i class="fa-solid fa-magnifying-glass"></i>주소검색</button>
						<div >
						<input type="text" class="address" id="sample4_postcode" class="address" placeholder="우편번호">
						<input type="text" class="address" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" class="address" id="sample4_jibunAddress" name="user_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="address" id="sample4_detailAddress" name="user_detailAddress" placeholder="상세주소" >
						<input type="text" class="address" id="sample4_extraAddress" placeholder="참고항목">
						</div>
						<span class="txt txt_case1">샛별배송</span>
						<span class="txt txt_case2">배송지에 따라 상품정보가 달라질 수 있습니다.</span>
					</td>
			</tr>

				

			<tr>
				<th>성별</th>
				<td>
				<div class="group_radio">
				
				<input type="radio" id="user_gender1" name="user_gender" value="남">
				<span class="txt_gender">남자</span>
				
				
				<input type="radio" id="user_gender2" name="user_gender" value="여">
				<span class="txt_gender">여자</span>
				
				<input type="radio" id="user_gender3" name="user_gender" value="무" checked="checked">
				<span class="txt_gender">선택안함</span>
				</div>
				
				</td>
			</tr>

			<tr>
				<th>생년월일</th>
				<td>
				<div class="birth_day">
				<input type="text" name="user_birth_year" id="user_birth_year" size="4" maxlength="4" placeholder="YYYY">
				<span class="bar"></span>
				<input type="text" name="user_birth_month" id="user_birth_month" size="2" maxlength="2" placeholder="MM">
				<span class="bar"></span>
				<input type="text" name="user_birth_day" id="user_birth_day" size="2" maxlength="2" placeholder="DD">
				</div>
				<p class="txt_guide">
				</td>
			</tr>

			<tr>
				<th>추가입력 사항</th>
				<td>
					<div class="group_radio">
						
						<input type="radio" name="recommend" id="recommendId" label="추천인아이디">
						<span class="txt_addInput">추천인 아이디</span>
						
						<input type="radio" name="recommend" id="eventName" label="참여이벤트명">
						<span class="txt_addInput">참여 이벤트명</span>
						
					</div>
					<div id="group_add">
					<input type="text" id="input_recommend" name="user_recommend" placeholder="추천인 아이디를 입력해 주세요">

					<input type="text" id="input_event" name="user_event" placeholder="참여 이벤트명을 입력해 주세요">

					<span class="txt txt_case1">추천인 아이디와 참여 이벤트명 중 하나만 선택 가능합니다.</span>
					<span class="txt txt_case1">가입 이후, 수정이 불가합니다.</span>
					<span class="txt txt_case1">대소문자 및 띄어쓰기에 유의해 주세요.</span>
					</div>
				</td>
			</tr>

			<tr>
			<td colspan="2">
				<hr>
			</td>
			</tr>

			<tr>
				<th>이용약관 동의<span class="ico">*</span></th>
				<td>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
						<label class="form-check-label1" for="exampleRadios1">
						  전체 동의합니다.
						</label>
						<span class="txt">선택항목에 동의하지 않는 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</span>
					  </div>
					  <div class="form-check">
						<input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios2" value="option2" required>
						<label class="form-check-label" for="exampleRadios2">
						  이용약관동의(필수)
						</label>
					  </div>

					  <div class="form-check">
						<input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios3" value="option2" required>
						<label class="form-check-label" for="exampleRadios3">
							개인정보 수집&middot;이용동의(필수)
						</label>
					  </div>

					  <div class="form-check">
						<input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios4" value="option2">
						<label class="form-check-label" for="exampleRadios4">
							개인정보 수집&middot;이용동의(선택)
						</label>
					  </div>

					  <div class="form-check">
						<input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios5" value="option2">
						<label class="form-check-label" for="exampleRadios5">
							무료배송, 할인쿠폰등 혜택/정보 수신 정의(선택)
						</label>
					  </div>

					  <div class="form-check">
						<input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios6" value="option2" required>
						<label class="form-check-label"
						for="exampleRadios6" >
							본인은 만14세 이상입니다.(필수)
						</label>
					  </div>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				
					<input type="submit" id="btn_join" value="가입하기">
				</td>
			</tr>


		</table>
		


	</form>


</div>
<jsp:include page="/include/main_bottom.jsp"></jsp:include>


<script src="<%=request.getContextPath()%>/js/join.js" defer></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>