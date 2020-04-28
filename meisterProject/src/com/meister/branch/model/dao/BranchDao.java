package com.meister.branch.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.branch.model.vo.Branch;
import static com.meister.common.JDBCTemplate.*;

public class BranchDao {
	
	private Properties prop = new Properties();
	
	public BranchDao() {
		String filePath = BranchDao.class.getResource("/sql/searchBranch/searchBranchQuery.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Branch> selectBranchList(Connection conn) {
		
		ArrayList<Branch> branchList = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBranchList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				branchList.add(new Branch(rset.getInt("branch_no"),
										  rset.getString("branch_name"),
										  rset.getString("open_time"),
										  rset.getString("close_time"),
										  rset.getDate("opening_date"),
										  rset.getString("branch_address"),
										  rset.getString("branch_phone"),
										  rset.getString("branch_image"),
										  rset.getDate("branch_register_date"),
										  rset.getDate("branch_modify_date"),
										  rset.getInt("manager_no"),
										  rset.getString("latitude"),
										  rset.getString("longitude"),
										  rset.getString("branch_status")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return branchList;
	}

}
