<%-- 
    Document   : sign_up
    Created on : 2020. 5. 29., 오전 12:40:46
    Author     : jihun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-image:url('img/mail.PNG');">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>회원가입</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
    </head>
    <body style="height:100vh;">
        <%@include file="header.jspf"%>
        <br>
        <div class="row left-align" style="margin-left:40%;margin-right: 10%;margin-top:5%">
            <div class="col s12 m6">
                <div class="card " style="background-color:rgb(54,52,52)">

                    <div class="card-content white-text">
                        <div class="container " id="sign_up_form">
                            <span class="card-title blue-grey-text text-lighten-2 ">SIGN UP</span>
                            <div class="input-field white-text">
                                <form action="SignUp.do" method="POST">

                                    <p>ID</p>
                                    <input class="white-text" type="text" placeholder="new id"
                                           name="id" id="newID" required
                                           pattern="[A-Za-z0-9+]{8,12}" />
                                    <input class="btn-small grey" type="button" onclick="checkId()" value="Duplicated?" required style="margin-bottom: 20%"/>


                                    <p>PW</p>
                                    <input class="white-text" type="password" placeholder="new passwd"
                                           id="passwd" name="passwd"
                                           pattern="[A-Za-z0-9+]{6,14}$" style="margin-bottom: 20%"/>
                                    
                                    <p>Confrim your password</p>
                                    <input class="white-text" type="password" placeholder="repeat passwd" id="passwdRepeat"
                                           oninput="isPasswdMatched()" style="margin-bottom: 20%"/>
                                    <input class="btn-small grey" type="submit" value="Submit" id="btnSignUp" disabled style="margin-bottom: 20%"/>
                                    <input class="btn-small grey" type="submit" value="Cancel" id="btnCancel" onclick="location.href = 'index.jsp'"  style="margin-bottom: 20%"/>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        <%@include file="footer.jspf"%>
    </body>
    <script>
        let isIdChecked = false;
        let isPasswdChecked = false;
        const btnSignUp = document.getElementById('btnSignUp');

        //id 중복확인과 암호, 암호 확인이 올바르게 되어야만 가입 버튼 활성화
        function checkSignUpBtn() {
            if (isIdChecked && isPasswdChecked) {
                btnSignUp.disabled = false;
            } else {
                btnSignUp.disabled = true;
            }
        }
        //id 중복확인
        function checkId() {
            console.log("connecting..");
            const xhr = new XMLHttpRequest();
            const id = document.getElementById("newID").value;
            if (id == "") {
                alert("please input id");
            }

            xhr.open('POST', '/maven_webmail/IdCheck.do', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (xhr.responseText === 'duplicated') {//???
                        //중복
                        console.log("duplicated");
                        alert("duplicated id.");
                        isIdChecked = false;
                    } else if (xhr.responseText === 'ok') {///???
                        //사용가능
                        alert("you can use this id.");
                        isIdChecked = true;
                    } else {
                        isIdChecked = false;
                        alert("Error accured! pleas check your input.");
                    }
                }
            }
            xhr.send(id);
        }
        //비밀번호 확인 입력 인풋
        const passwdReInput = document.getElementById('passwdRepeat');
        //비밀번호와 비밀번호 확인란이 같은지 체크
        function isPasswdMatched() {
            const passwd = document.getElementById('passwd').value;
            const passwdRepeat = document.getElementById('passwdRepeat').value;

            if (passwd != passwdRepeat) {
                isPasswdChecked = false;
                passwdReInput.style.backgroundColor = 'rgba(255, 0, 0, 0.5)';
            } else {
                isPasswdChecked = true;
                passwdReInput.style.backgroundColor = 'rgba(0, 255, 0, 0.5)';
            }
            checkSignUpBtn();
        }
    </script>
</html>
