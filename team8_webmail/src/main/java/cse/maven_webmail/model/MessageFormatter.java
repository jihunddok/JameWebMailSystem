/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cse.maven_webmail.model;

import cse.maven_webmail.control.CommandType;
import javax.mail.Message;
import javax.servlet.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.http.*;

/**
 *
 * @author jongmin
 */
public class MessageFormatter {

    private String userid;  // 파일 임시 저장 디렉토리 생성에 필요

    public MessageFormatter(String userid) {
        this.userid = userid;
    }

    public String getMessageTable(Message[] messages) {
        StringBuilder buffer = new StringBuilder();
        /*
         */

        // 메시지 제목 보여주기
        buffer.append("<div class=\"tb_wrap\">");
        buffer.append("<div class=\"tb_box\">");
        buffer.append("<table id=\"dtBasicExample\" class=\"tb table table-striped table-bordered table-sm\" cellspacing=\"0\"> style=\"color:white;\"");  // table start
        buffer.append("<thead>"
                + "<tr class=\"fixed_top\"> "
                + " <th class=\"th-sm \" id=\"index_no\" style=\"color:white;\" > No. </td> "
                + " <th class=\"th-sm \" id=\"index_sender\" style=\"color:white;\"> 보낸 사람 </td>"
                + " <th class=\"th-sm \" id=\"index_subject\" style=\"color:white;\"> 제목 </td>     "
                + " <th class=\"th-sm \" id=\"index_date \"style=\"color:white;\"> 보낸 날짜 </td>   "
                + " <th class=\"th-sm \" id=\"index_delete\" style=\"color:white;\"> 삭제 </td>   "
                + " </tr>"
                + "</thead>");
        for (int i = messages.length - 1; i >= 0; i--) {
            MessageParser parser = new MessageParser(messages[i], userid);
            parser.parse(false);  // envelope 정보만 필요
            // 메시지 헤더 포맷
            // 추출한 정보를 출력 포맷 사용하여 스트링으로 만들기
            buffer.append("<tr> "
                    + " <td class = \"white-text\" id=no style=\"\">" + (i + 1) + " </td> "
                    + " <td class = \"white-text\" id=sender style=\"\">" + parser.getFromAddress() + "</td>"
                    + " <td class = \"white-text\" id=subject style=\"\"> "
                    + " <a href=show_message.jsp?msgid=" + (i + 1) + " title=\"메일 보기\" style=\"color:white\"> "
                    + parser.getSubject() + "</a> </td>"
                    + " <td class = \"white-text\" id=date style=\"\">" + parser.getSentDate() + "</td>"
                    + " <td class = \"white-text\" id=delete style=\"\">"
                    + "<a href=ReadMail.do?menu="
                    + CommandType.DELETE_MAIL_COMMAND
                    + "&msgid=" + (i + 1) + " style=\"color:white\" > 삭제 </a>" + "</td>"
                    + " </tr>");
        }
        buffer.append("</table>");
        buffer.append("</div>");
        buffer.append("</div>");

        return buffer.toString();
//        return "MessageFormatter 테이블 결과";
    }

    public String getMessage(Message message) {
        StringBuilder buffer = new StringBuilder();

        MessageParser parser = new MessageParser(message, userid);
        parser.parse(true);

        buffer.append("보낸 사람: " + parser.getFromAddress() + " <br>");
        buffer.append("받은 사람: " + parser.getToAddress() + " <br>");
        buffer.append("Cc &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : " + parser.getCcAddress() + " <br>");
        buffer.append("보낸 날짜: " + parser.getSentDate() + " <br>");
        buffer.append("제 &nbsp;&nbsp;&nbsp;  목: " + parser.getSubject() + " <br> <hr>");

        buffer.append(parser.getBody());

        String attachedFile = parser.getFileName();
        if (attachedFile != null) {
            buffer.append("<br> <hr> 첨부파일: <a href=ReadMail.do?menu="
                    + CommandType.DOWNLOAD_COMMAND
                    + "&userid=" + this.userid
                    + "&filename=" + attachedFile.replaceAll(" ", "%20")
                    + " target=_top> " + attachedFile + "</a> <br>");
        }

        buffer.append("<form action=\"write_mail.jsp\" method=\"POST\">");
        buffer.append("<input type=\"hidden\" name=\"caller\" value=\"").append(parser.getFromAddress())
                .append("\">");
        buffer.append("<input type=\"hidden\" name=\"title\" value=\"").append(parser.getSubject())
                .append("\">");
        buffer.append("<input type=\"hidden\" name=\"body\" value=\"").append(parser.getBody())
                .append("\">");
        buffer.append("<br>");
        buffer.append("<input type=\"button\" value=\"답장하기\">");
                
        buffer.append("</form>");

        return buffer.toString();
    }
}
