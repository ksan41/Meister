package com.meister.menu.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.menu.model.dao.MenuDao;
import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;

public class MenuService {
	
	public ArrayList<Pizza> selectPizzaList(){
		
		Connection conn = getConnection();
		
		ArrayList<Pizza> list = new MenuDao().selectPizzaList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<PizzaSize> selectPizzaSizeList(){
		
		Connection conn = getConnection();
		
		ArrayList<PizzaSize> list = new MenuDao().selectPizzaSizeList(conn);
		
		close(conn);
		
		return list;
		
	}

}
