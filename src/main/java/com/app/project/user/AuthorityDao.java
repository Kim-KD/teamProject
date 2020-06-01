package com.app.project.user;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface AuthorityDao {

	@Insert("insert into authorities values(#{username}, #{authority})")
	void insert(@Param("username") String username, @Param("authority") String authority);

}
