/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.util;

/**
 *
 * @author Altair
 */

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MailTester {
     public static void main(String[] args) {
        MailJava mj = new MailJava();
        //configuracoes de envio
        mj.setSmtpHostMail("smtp.gmail.com");
        mj.setSmtpPortMail("587");
        mj.setSmtpAuth("true");
        mj.setSmtpStarttls("true");
        mj.setUserMail("altairsantaclara@gmail.com");
        mj.setFromNameMail("Altair Santa Clara de Oliveira Neto");
        mj.setPassMail("titanic16452155");
        mj.setCharsetMail("ISO-8859-1");
        mj.setSubjectMail("JavaMail");
        mj.setBodyMail(htmlMessage());
        mj.setTypeTextMail(MailJava.TYPE_TEXT_HTML);

        //sete quantos destinatarios desejar
        Map<String, String> map = new HashMap<String, String>();
        map.put("altairsantaclara@gmail.com", "email gmail");
        map.put("gabichicalski@gmail.com", "email gmail");
        

        mj.setToMailsUsers(map);

        //seta quatos anexos desejar
        List<String> files = new ArrayList<String>();
        files.add("C:\\currículos\\curriculo.pdf");
        

        mj.setFileMails(files);

        try {
            new MailJavaSender().senderMail(mj);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private static String textMessage() {
        return  "teste";
    }

    private static String htmlMessage() {
        return  "<html> " +
                "<head>" +
                "<title>Teste de Envio de Email - ACOME</title> " +
                "</head> " +
                "<body> " +
                "<div style='background-color:orange; width:28%; height:100px;'>" +
                "<ul>  " +
                "<li>TESTE</li> " +
                "<li></li>" +
                " <li></li> " +
                "<li></li>" +
                "</ul> " +
               
                "</a> " +
                "</div>" +
                "</body> " +
                "</html>";
    }
}
