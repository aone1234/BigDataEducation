package kr.co.kihd.variable;

public class VarTest2 {

	public static void main(String[] args) {
		
		int number;      //4바이트만큼 변수를 메모리(스택)를 할당함. 변수선언.
		number = 200;    //초기화
		System.out.println(number);
		
		
		int number2 = 500;   
		System.out.println(number2);
		
		String str = new String("구미시");
		System.out.println(str);
		
		//null은 '없다'의미
		str = null;
		System.out.println(str);
		
		double dnum = 10.01;
		System.out.println("실수 : " + dnum);
     
		//상수(변하지 않는 값)는 선언과 동시에 초기화를 한후,
		//다시 그 상수값을 변경시키는 코드가 들어가면 안됨.
		final int MAX_NUMBER = 100;
		//MAX_NUMBER = 200;
		System.out.println("상수 : " + MAX_NUMBER);
		
		
		
	}

}
