const input_userName = document.querySelector("#user_Name");
const input_userPhone = document.querySelector("#user_phone");
const input_userEmail = document.querySelector("#user_email");
const btn_phone = document.querySelector(".btn_phone");
const btn_email = document.querySelector(".btn_email");
const phone_click = document.querySelector("#phone_click");
const email_click = document.querySelector("#email_click");
const btn_submit = document.querySelector(".btn_submit");
const input_phoneCont = document.querySelector(".phone_container");
const input_emailCont = document.querySelector(".email_container");

function btn_phoneClick(){
	console.log(input_userName.value);
    btn_phone.style.borderColor = "#5f0080";
    btn_email.style.borderColor = "lightgray";
    input_phoneCont.style.display = "block";
    input_emailCont.style.display = "none";
	input_userEmail.value = "";
    phone_click.value = 1;
    email_click.value = 0;
}

function btn_emailClick(){
	console.log(input_userName.value);
    btn_email.style.borderColor = "#5f0080";
    btn_phone.style.borderColor = "lightgray";
    input_emailCont.style.display = "block";
    input_phoneCont.style.display = "none";
	input_userPhone.value = "";
    phone_click.value = 0;
    email_click.value = 1;
}

function submitCheck(){
    if(input_userName.value == ""){
        swal("유효성검사 오류", "이름을 입력해 주세요");
        input_userName.focus();
        return false;
    }
    if(phone_click.value == 1){
        if(input_userPhone.value == ""){
            swal("유효성검사 오류", "휴대폰 번호를 입력해 주세요");
            input_userPhone.focus();
            return false;
        }
    }
    if(email_click.value == 1){
        if(input_userEmail.value == ""){
            swal("유효성검사 오류", "이메일 주소를 입력해 주세요");
            input_userEmail.focus();
            return false;
        }
    }
}

btn_email.addEventListener("click",btn_emailClick);
btn_phone.addEventListener("click",btn_phoneClick);

btn_phone.click();

