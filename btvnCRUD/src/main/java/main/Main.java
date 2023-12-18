package main;

import Service.IStudentService;
import serviceImpl.StudentService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class Main {
    final static String DRIVER = "com.mysql.cj.jdbc.Driver";
    final static String URL = "jdbc:mysql://localhost:3306";
    final static String USERNAME = "root";
    final static String PASSWORD = "quychau123";
    public static Connection connection = getConnection();
    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;

    }

    public static void main(String[] args) {
        IStudentService istudentService = new StudentService();
        while (true){
            System.out.println();
            System.out.println("--Menu--");
            System.out.println("1.Create");
            System.out.println("2.Read");
            System.out.println("3.Update");
            System.out.println("4.Delete");
            System.out.println("0.Exit");
            System.out.print("Nhap Lua Chon : ");
            byte choice = new Scanner(System.in).nextByte();
            switch (choice){
                case 1:
                   istudentService.creat();
                    break;
                case 2:
                    istudentService.read();
                    break;
                case 3:
                    istudentService.update();
                    break;
                case 4:
                    istudentService.delete();
                    break;
                case 0:
                    System.exit(0);
                default:
                    System.err.println("Nhap sai hay nhap lai !");
            }
        }
    }
    }
