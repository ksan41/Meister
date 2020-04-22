package com.meister.menu.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.menu.model.dao.MenuDao;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Etc;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;

public class MenuService {
	
	/**
	 * 1. 피자 리스트 조회용 서비스
	 * @return	--> 조회된 피자 담은 객체
	 */
	public ArrayList<Pizza> selectPizzaList(){
		
		Connection conn = getConnection();
		
		ArrayList<Pizza> list = new MenuDao().selectPizzaList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 2. 피자 사이즈, 가격 조회용 서비스
	 * @return	--> 조회돈 사이즈 가격 담은 객체
	 */
	public ArrayList<PizzaSize> selectPizzaSizeList(){
		
		Connection conn = getConnection();
		
		ArrayList<PizzaSize> list = new MenuDao().selectPizzaSizeList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	public ArrayList<Side> selectSideList(){
		
		Connection conn = getConnection();
		
		ArrayList<Side> list = new MenuDao().selectSideList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Etc> selectEtcList(){
		
		Connection conn = getConnection();
		
		ArrayList<Etc> list = new MenuDao().selectEtcList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
