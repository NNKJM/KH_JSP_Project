const group_userId = document.getElementById("group_userId");
const input_userId = group_userId.querySelector("input");
let txt_userId = group_userId.getElementsByClassName("txt");

const group_userPwd = document.getElementById("group_userPwd1");
const input_userPwd = group_userPwd.querySelector("input");
let txt_userPwd = group_userPwd.getElementsByClassName("txt");

const group_userPwd2 = document.getElementById("group_userPwd2");
const input_userPwd2 = group_userPwd2.querySelector("input");
let txt_userPwd2 = group_userPwd2.getElementsByClassName("txt");

const radio_recommendId = document.getElementById("recommendId");
const radio_eventName = document.getElementById("eventName");
const input_recommend = document.getElementById("input_recommend");
const input_event = document.getElementById("input_event");
const group_add = document.getElementById("group_add");
const txt_add = group_add.getElementsByClassName("txt_case1");

const check_input1 = document.getElementById("exampleRadios1");
const check_input2 = document.getElementById("exampleRadios2");
const check_input3 = document.getElementById("exampleRadios3");
const check_input4 = document.getElementById("exampleRadios4");
const check_input5 = document.getElementById("exampleRadios5");
const check_input6 = document.getElementById("exampleRadios6");


/* */




function screenTxtId(){
    txt_userId[0].style.display = 'block';
    txt_userId[1].style.display = 'block';
    
}

function screenTxtPwd(){
    txt_userPwd[0].style.display = 'block';
}

function screenTxtPwd2(){
    txt_userPwd2[0].style.display = 'block';
}

function screenTxtRecommand(){
    input_recommend.style.display = 'block';
    input_event.style.display = 'none';
    for(let i =0;i<txt_add.length;i++){
        txt_add[i].style.display = 'block';
    }
}

function screenTxtEventName(){
    input_event.style.display = 'block';
    input_recommend.style.display = 'none';
    txt_add[0].style.display = 'block';
    for(let i =0;i<txt_add.length;i++){
        txt_add[i].style.display = 'block';
    }
}

function check_input(){
    if(check_input1.checked==true){
        check_input2.checked=true; 
        check_input3.checked=true;
        check_input4.checked=true;
        check_input5.checked=true;
        check_input6.checked=true;
    }else{
        check_input2.checked=false; 
        check_input3.checked=false;
        check_input4.checked=false;
        check_input5.checked=false;
        check_input6.checked=false;
    }
    
}



/*input창 클릭시 하단 텍스트 표시*/
input_userId.addEventListener("click",screenTxtId);
input_userPwd.addEventListener("click",screenTxtPwd);
input_userPwd2.addEventListener("click",screenTxtPwd2);

/*추가입력사항 라디오버튼 클릭시 인풋창 및 텍스트 표시*/
radio_recommendId.addEventListener("click",screenTxtRecommand);
radio_eventName.addEventListener("click",screenTxtEventName);

/*이용약관 전체선택 전체해제*/
check_input1.addEventListener("click",check_input);

