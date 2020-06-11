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
        <div style="display: flex;">
            <form action="SignUp.do" method="POST">
              
                <p>아이디</p>
                <p>영문자와 숫자를 조합한 8~12자</p>
                    
                <input type="text" placeholder="new id"
                       name="id" id="newID" required
                       pattern="[A-Za-z0-9+]{8,12}"/>
                <input type="button" onclick="checkId()" value="중복확인" required/>


                <p>암호</p>
                <p>영문자와 숫자를 조합한 6~14자</p>
                <input type="password" placeholder="new passwd"
                       id="passwd" name="passwd"
                       pattern="[A-Za-z0-9+]{6,14}$"/>
                <p>암호 확인</p>
                <input type="password" placeholder="repeat passwd" id="passwdRepeat"
                       oninput="isPasswdMatched()"/>
                <input type="submit" value="가입신청" id="btnSignUp" disabled/>

            </form>
            
                      
                   
                  
                        
                    
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
            const xhr = new XMLHttpRequest();
            const id = document.getElementById("newID").value;
            if (id == "") {
                alert("please input id");
            }

            xhr.open('POST', '/maven_webmail/IdCheck.do', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (xhr.responseText === 'True') {//???
                        //중복
                        alert("duplicated id.");
                        isIdChecked = false;
                    } else if (xhr.responseText === 'False') {///???
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
        const passwdReInput = document.getElementById('passwdRepeat')
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
