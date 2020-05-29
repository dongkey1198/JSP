package kr.co.jsp.score;

public class ScoreBean {
	/**
	 여기에는 kor, eng math toatl 
	 
	 average == double 
	  
	 **/
	
	private int kor;
	private int eng;
	private int math;
	private int total;
	private double average;
	
	public ScoreBean() {}
	
	public ScoreBean(int kor, int eng, int math, int total, double average) {
		super();
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.total = total;
		this.average = average;
		
	}
	



	public int getKor() {
		return kor;
	}



	public void setKor(int kor) {
		this.kor = kor;
	}



	public int getEng() {
		return eng;
	}



	public void setEng(int eng) {
		this.eng = eng;
	}



	public int getMath() {
		return math;
	}



	public void setMath(int math) {
		this.math = math;
	}



	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public double getAverage() {
		return average;
	}



	public void setAverage(double average) {
		this.average = Math.round(average*100)/100.0;
	}
	
	
	
	
}
