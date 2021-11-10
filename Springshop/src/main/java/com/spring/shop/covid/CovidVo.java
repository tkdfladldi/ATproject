package com.spring.shop.covid;

public class CovidVo {
	
	private int resultCode;	//결과 코드
	private String resultMsg; //결과 메세지
	private double accDefRate; //누적 확진률
	private int accExamCnt; //누적 검사수
	private int accExamCompCnt; //누적 검사 완료수 
	private int careCnt; //치료중 환자 수
	private int clearCnt; //격리해제 수
	private String createDt; //등록 일시분초
	private int deathCnt; //사망자 수
	private int decideCnt; //학진자 수
	private int examCnt; //검사 진행 수
	private int resutlNegCnt; //결과 음성 수
	private  int seq; //게시글번호(감염현황 교유값)
	private  int stateDt; //기준 일
	private String stateTime; //기준시간
	private  String updateDt; //수정 일시 분초
    private int numOfRows; // 한페이지 결과 수
    private int pageNo; //페이지 번호
    private int totalCount; // 전체 결과 수
    
    
    
	public int getResultCode() {
		return resultCode;
	}
	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public double getAccDefRate() {
		return accDefRate;
	}
	public void setAccDefRate(double accDefRate) {
		this.accDefRate = accDefRate;
	}
	public int getAccExamCnt() {
		return accExamCnt;
	}
	public void setAccExamCnt(int accExamCnt) {
		this.accExamCnt = accExamCnt;
	}
	public int getAccExamCompCnt() {
		return accExamCompCnt;
	}
	public void setAccExamCompCnt(int accExamCompCnt) {
		this.accExamCompCnt = accExamCompCnt;
	}
	public int getCareCnt() {
		return careCnt;
	}
	public void setCareCnt(int careCnt) {
		this.careCnt = careCnt;
	}
	public int getClearCnt() {
		return clearCnt;
	}
	public void setClearCnt(int clearCnt) {
		this.clearCnt = clearCnt;
	}
	public String getCreateDt() {
		return createDt;
	}
	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}
	public int getDeathCnt() {
		return deathCnt;
	}
	public void setDeathCnt(int deathCnt) {
		this.deathCnt = deathCnt;
	}
	public int getDecideCnt() {
		return decideCnt;
	}
	public void setDecideCnt(int decideCnt) {
		this.decideCnt = decideCnt;
	}
	public int getExamCnt() {
		return examCnt;
	}
	public void setExamCnt(int examCnt) {
		this.examCnt = examCnt;
	}
	public int getResutlNegCnt() {
		return resutlNegCnt;
	}
	public void setResutlNegCnt(int resutlNegCnt) {
		this.resutlNegCnt = resutlNegCnt;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getStateDt() {
		return stateDt;
	}
	public void setStateDt(int stateDt) {
		this.stateDt = stateDt;
	}
	public String getStateTime() {
		return stateTime;
	}
	public void setStateTime(String stateTime) {
		this.stateTime = stateTime;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "CovidVo [resultCode=" + resultCode + ", resultMsg=" + resultMsg + ", accDefRate=" + accDefRate
				+ ", accExamCnt=" + accExamCnt + ", accExamCompCnt=" + accExamCompCnt + ", careCnt=" + careCnt
				+ ", clearCnt=" + clearCnt + ", createDt=" + createDt + ", deathCnt=" + deathCnt + ", decideCnt="
				+ decideCnt + ", examCnt=" + examCnt + ", resutlNegCnt=" + resutlNegCnt + ", seq=" + seq + ", stateDt="
				+ stateDt + ", stateTime=" + stateTime + ", updateDt=" + updateDt + ", numOfRows=" + numOfRows
				+ ", pageNo=" + pageNo + ", totalCount=" + totalCount + "]";
	}
    
    
}
