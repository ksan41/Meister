package com.meister.menu.model.service;

import static com.meister.common.JDBCTemplate.*;
import static com.meister.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.menu.model.dao.MenuDao;
import com.meister.menu.model.vo.AddCart;
import com.meister.menu.model.vo.Dough;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;

public class MenuService {
	
	/**현영
	 * 1. 피자 리스트 조회용 서비스
	 * @return	--> 조회된 피자 담은 객체
	 */
	public ArrayList<Pizza> selectPizzaList(){
		
		Connection conn = getConnection();
		
		ArrayList<Pizza> list = new MenuDao().selectPizzaList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**현영
	 * 2. 피자 사이즈, 가격 조회용 서비스
	 * @return	--> 조회돈 사이즈 가격 담은 객체
	 */
	public ArrayList<PizzaSize> selectPizzaSizeList(){
		
		Connection conn = getConnection();
		
		ArrayList<PizzaSize> list = new MenuDao().selectPizzaSizeList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	/**현영
	 * 3. 사이드 리스트 조회용 서비스
	 * @return	--> 조회된 사이드 담은 객체
	 */
	public ArrayList<Side> selectSideList(){
		
		Connection conn = getConnection();
		
		ArrayList<Side> list = new MenuDao().selectSideList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**현영
	 * 4. 기타 리스트 조회용 서비스
	 * @return	--> 조회된 기타 담은 객체
	 */
	public ArrayList<Etc> selectEtcList(){
		
		Connection conn = getConnection();
		
		ArrayList<Etc> list = new MenuDao().selectEtcList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**현영
	 * 5. 도우 리스트 조회용 서비스
	 * @return	--> 조회된 도우 담은 객체
	 */	
	public ArrayList<Dough> selectDoughList(){
		
		Connection conn = getConnection();
		
		ArrayList<Dough> list = new MenuDao().selectDoughList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**현영
	 * 6. 피자 상세조회용 서비스
	 * @param pno	--> 조회하고자하는 피자 번호
	 * @return		--> 피자번호와 일치하는 Pizza 객체
	 */
	public ArrayList<Pizza> selectPizzaDetail(int pno){
		
		Connection conn = getConnection();
		
		ArrayList<Pizza> list = new MenuDao().selectPizzaDetail(conn, pno);
		
		close(conn);
		
		return list;
	}
	
	/**현영
	 * 6_1 피자 상세조회용 서비스
	 * @param pno		--> 조회하고자하는 피자 번호
	 * @return			--> 피자번호와 일치하는 PizzaSize 객체
	 */
	public ArrayList<PizzaSize> selectPizzaSizeDetail(int pno){
		
		Connection conn = getConnection();
		
		ArrayList<PizzaSize> list = new MenuDao().selectPizzaSizeDetail(conn, pno);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 7. 사이드 상세조회용 서비스
	 * @param sno		--> 조회하고자하는 사이드 번호
	 * @return			--> 피자번호와 일치하는 Side 객체
	 */
	public ArrayList<Side> selectSideDetail(int sno){
		
		Connection conn = getConnection();
		
		ArrayList<Side> list = new MenuDao().selectSideDetail(conn, sno);
		
		close(conn);
		
		return list;
		
		
	}
	
	
	public int insertAddCart(AddCart a) {
		
		Connection conn = getConnection();
		
		int result = new MenuDao().insertAddCart(conn, a);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		return result;
		
	}
	
	
	
	/**산
	 * 통합관리자 - 피자 수정용 서비스
	 * @param updateP : 입력받은 피자 정보가 담긴 Pizza객체
	 * @param updateSizeM : 입력받은 피자M사이즈 가격정보 담긴 PizzaSize객체
	 * @param updateSizeL : 입력받은 피자L사이즈 가격정보 담긴 PizzaSize객체
	 * @return : 처리된 행의 개수
	 */
	public int updatePizza(Pizza insertP,PizzaSize updateSizeM,PizzaSize updateSizeL) {
		
		Connection conn = getConnection();
		
		// 피자 update요청
		int resultP = new MenuDao().updatePizza(conn,insertP);
		
		// 피자사이즈 update요청
		int resultPs = new MenuDao().updatePizzaSize(conn, updateSizeM, updateSizeL);
		
		if(resultP>0 && resultPs>0) { //피자,사이즈 모두 성공했을때 커밋
			commit(conn);
		}else {
			rollback(conn); // 둘중 하나라도 실패했을시 롤백
		}
		close(conn);
		
		return resultP*resultPs;
	}
	
	
	
	/**산
	 * 통합관리자- 피자 등록 서비스
	 * @param p : 등록할 피자정보가 담긴 Pizza객체
	 * @param pName : 등록할 피자이름(사이즈 insert시 필요)
	 * @param priceM : 등록할 피자의 M사이즈 가격
	 * @param priceL : 등록할 피자의 L사이즈 가격
	 * @return : 처리된 행의 개수
	 */
	public int insertMenuPizza(Pizza p,String pName,int priceM,int priceL) {
		
		Connection conn = getConnection();
		
		
		
		
	}
}
