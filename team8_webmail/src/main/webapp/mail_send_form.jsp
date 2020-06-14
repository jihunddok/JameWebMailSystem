<%-- 
    Document   : mail_send_form.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType" %>

<!DOCTYPE html>

<div style="margin-bottom: 100px;">
<form enctype="multipart/form-data" method="POST" 
      action="WriteMail.do?menu=<%= CommandType.SEND_MAIL_COMMAND%>" >
    <table  class="table table-striped table-bordered  white-text"  cellspacing="0" style="z-index: 1;background-color:rgb(54,52,52); " >                            
        <tr>
            <td> 수신                         
            </td>
            <td> <input id="who" class="white-text" type="text" name="to" size="80"
                        value="<%=request.getParameter("caller") == null ? "" : request.getParameter("caller")%>"> 
                <input class="btn-table" type="button" value="내게쓰기" onclick="send_to_me()"/> 
            </td>

        </tr>
        <tr>
            <td>참조</td>
            <td> <input  class="white-text" type="text" name="cc" size="80">  </td>
        </tr>
        <tr>
            <td> 메일 제목 </td>
            <td> <input class="white-text" type="text" name="subj" size="80"
                        value="<%=request.getParameter("title") == null ? "" : "re : " + request.getParameter("title")%>"> 

            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">본  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 문</td>
        </tr>
        <tr>  <%-- TextArea    --%>
            <td colspan="2">  <textarea class="white-text" rows="15" name="body" cols="80" style="height: 10%">
                    <%=request.getParameter("body") == null ? "" : "[원문] \n" + request.getParameter("body").replaceAll("<br>", "\n") + "\n---------------------------------"%> 
                </textarea> </td>
        </tr>
        <tr>
            <td>첨부 파일</td>
            <td> <input type="file" name="file1"  size="80" onchange="check_size(this)"> (최대 10MB) </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="메일 보내기">
                <input type="reset" value="다시 입력">
            </td>
            
        <script>
            var id = document.getElementById("username").textContent;
            function send_to_me() {

                document.getElementById("who").value = id;

            }

        </script>
        </tr>
    </table>
</form>
                </div>

