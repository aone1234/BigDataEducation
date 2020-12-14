package kr.co.kihd.variable;

public class VarTest1 {

	public static void main(String[] args) {
		
		int year = 2020;
		int age = 20;

		//sys를 입력하고 Ctrl + space 자동완성
		 //인텔리전스 기능
		
		System.out.println(year);
		System.out.println(year + age);
		
		String str = new String("자바");	
		System.out.println(str);
		System.out.println(str.toString());
		
		//사용자 정의 클래스이거나 toString() 재정의를 하지 않은
		//클래스의 참조변수는 출력을 하게 되면, 클래스 타입@16진수(주소)
		Object obj = new Object();
		System.out.println(obj);
		
		//L은 long을 지정하기 위해서 접미사 L,l을 붙임.
		long result1 = 10L;
		
		//F float를 지정하기 위해서 접미사 F,f를 붙임.
		float result2 = 10.1F;
		double dou = 9.999;
		char ch = 'A';
		System.out.println("ch: " + ch);
		System.out.println("long 타입 출력 : " + result1);
		System.out.println("float 타입 출력 : " + result2); 
		System.out.println("double 타입 출력 : " + dou);	
		
		System.out.println(str + "를 공부합시다!");
		System.out.println(obj + " 자바 ");
		
		
		
		
	}

}
