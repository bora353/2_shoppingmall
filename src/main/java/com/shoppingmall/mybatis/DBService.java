package com.shoppingmall.mybatis;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;

// MyBatis 사용해서 작업할 sqlSession을 만들어줄 
// SqlSessionFactory 객체 생성을 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	// static 초기화구문
	static {
		try {
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("mybatis2/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
