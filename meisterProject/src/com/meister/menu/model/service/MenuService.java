package com.meister.menu.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.menu.model.dao.MenuDao;
import com.meister.menu.model.vo.Pizza;

public class MenuService {
	
	public ArrayList<Pizza> selectPizzaList(){
		
		Connection conn = getConnection();
		
		ArrayList<Pizza> list = new MenuDao().selectPizzaList(conn);
		
		close(conn);
		
		return list;
		
	}

}
