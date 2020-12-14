package kr.co.kihd.variable;

import java.util.Scanner;

public class ScannerTest {

	public static void main(String[] args) {
	
		//ctrl + shift + o : 자동임포트
		//Scanner 클래스 : 입력을 받기 위한 클래스이고, 입력 스트림임.
		//자원(Resource)은 사용하고 나서 반드시 닫아줘야 됨.
        
		Scanner scan = new Scanner(System.in);
//        System.out.print("정수 한자리 입력 : ");
//        int num = scan.nextInt();
//        System.out.println("사용자로부터 입력받은 숫자 : " + num);
//     
//        System.out.print("실수 한자리 입력 : ");
//        double dnum = scan.nextDouble();
//        System.out.println("사용자로부터 입력받은 숫자 : " + dnum);
//        
		System.out.print("문자열 입력 : ");
		int result = 100;
		String num2 = scan.nextLine();
		//Integer.parseInt() : 문자열로 입력받은 숫자들을 문자열이 아니라
		//숫자로 바꿔주는 역할을 하는 메서드임.
		int temp = Integer.parseInt(num2);
		int total = result + temp;
		System.out.println("연산결과 : " + total);			     
        
        scan.close();
                	
		
		
	}

}
