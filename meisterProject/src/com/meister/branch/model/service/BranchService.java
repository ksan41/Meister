package com.meister.branch.model.service;

import static com.meister.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.branch.model.dao.BranchDao;
import com.meister.branch.model.vo.Branch;

public class BranchService {
	
	
	public ArrayList<Branch> selectBranchList() {
		
		Connection conn = getConnection();
		
		ArrayList<Branch> branchList = new BranchDao().selectBranchList(conn);
		
		close(conn);
		
		return branchList;
	}

}
