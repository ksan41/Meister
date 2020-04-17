<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common_manager/ImMenubar.jsp"%>
	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">지점 공지사항</h1>
			<div align="right">
				<button class="button" onclick="">등록</button>
				<button class="button" onclick="">수정</button>
				<button class="button" onclick="">삭제</button>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 지점 공지사항
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>No</th>
									<th>제목</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>35</td>
									<td>New York</td>
									<td>2011/12/12</td>
									<td>21</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>34</td>
									<td>Sidney</td>
									<td>2010/09/20</td>
									<td>23</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>33</td>
									<td>London</td>
									<td>2009/10/09</td>
									<td>47</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>32</td>
									<td>Edinburgh</td>
									<td>2010/12/22</td>
									<td>42</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>31</td>
									<td>Singapore</td>
									<td>2010/11/14</td>
									<td>28</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>30</td>
									<td>San Francisco</td>
									<td>2011/06/07</td>
									<td>28</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>29</td>
									<td>San Francisco</td>
									<td>2010/03/11</td>
									<td>48</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>28</td>
									<td>Tokyo</td>
									<td>2011/08/14</td>
									<td>20</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>27</td>
									<td>Sidney</td>
									<td>2011/06/02</td>
									<td>37</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>26</td>
									<td>London</td>
									<td>2009/10/22</td>
									<td>53</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>25</td>
									<td>London</td>
									<td>2011/05/07</td>
									<td>27</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>24</td>
									<td>San Francisco</td>
									<td>2008/10/26</td>
									<td>22</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>23</td>
									<td>Edinburgh</td>
									<td>2011/03/09</td>
									<td>46</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>22</td>
									<td>San Francisco</td>
									<td>2009/12/09</td>
									<td>47</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>21</td>
									<td>San Francisco</td>
									<td>2008/12/16</td>
									<td>51</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>20</td>
									<td>San Francisco</td>
									<td>2010/02/12</td>
									<td>41</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>19</td>
									<td>San Francisco</td>
									<td>2009/02/14</td>
									<td>62</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>18</td>
									<td>London</td>
									<td>2008/12/11</td>
									<td>37</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>17</td>
									<td>New York</td>
									<td>2008/09/26</td>
									<td>65</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>16</td>
									<td>Singapore</td>
									<td>2011/02/03</td>
									<td>64</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>15</td>
									<td>London</td>
									<td>2011/05/03</td>
									<td>38</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>14</td>
									<td>Tokyo</td>
									<td>2009/08/19</td>
									<td>37</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>13</td>
									<td>New York</td>
									<td>2013/08/11</td>
									<td>61</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>12</td>
									<td>San Francisco</td>
									<td>2009/07/07</td>
									<td>47</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>11</td>
									<td>Singapore</td>
									<td>2012/04/09</td>
									<td>64</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>10</td>
									<td>New York</td>
									<td>2010/01/04</td>
									<td>63</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>9</td>
									<td>San Francisco</td>
									<td>2012/06/01</td>
									<td>56</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>8</td>
									<td>Edinburgh</td>
									<td>2013/02/01</td>
									<td>43</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>7</td>
									<td>New York</td>
									<td>2011/12/06</td>
									<td>46</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>6</td>
									<td>London</td>
									<td>2011/03/21</td>
									<td>47</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>5</td>
									<td>London</td>
									<td>2009/02/27</td>
									<td>21</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>4</td>
									<td>San Francisco</td>
									<td>2010/07/14</td>
									<td>30</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>3</td>
									<td>Edinburgh</td>
									<td>2008/11/13</td>
									<td>51</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>2</td>
									<td>Singapore</td>
									<td>2011/06/27</td>
									<td>29</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td>New York</td>
									<td>2011/01/25</td>
									<td>27</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</main>

	</div>
</body>
</html>