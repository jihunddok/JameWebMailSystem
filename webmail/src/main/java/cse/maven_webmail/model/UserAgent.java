/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cse.maven_webmail.model;

import java.util.LinkedList;
import java.util.List;
import cse.maven_webmail.model.UserAdminAgent;

/**
 *
 * @author jdl
 * UserAdminAgent 클래스에서 getUserList() 메소드의 오류로 인해 새로운 클래스 생성
 */
public class UserAgent {
    private String server;
    private int port;
    private String cwd;

    private UserAdminAgent agent;
    List<String> userList = new LinkedList<String>();
    private String[] productList = {"test1","test2","test3","test4","test5"};
    private int num1 =30;
    private int num2=50;
    
    public UserAgent(){
        
    }
    
    public String[] getProductList() {
        return productList;
    }
    
    public List<String> getUserList() throws Exception{
        agent = new UserAdminAgent("localhost", 4555, cwd);
        return agent.getUserList();
    }
    
    public int getNum1() {
        return num1;
    }
    
    public int getNum2() {
        return num2;
    }
    
    public String getCwd() {
        return cwd;
    }

    public void setCwd(String cwd) {
        this.cwd = cwd;
    }
    
    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }
}
