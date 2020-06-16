package com.app.project.board;

import java.util.*;

import org.apache.ibatis.annotations.*;

public interface UploadInfoDao {
	@Insert("insert into upload_info values(#{u.no}, #{u.user_id}, #{u.board_status}, #{u.file_name}, #{u.save_name}, #{u.file_size})")
	public void insert(@Param("u") UploadInfoBean u);

	@Select("select pno, no, file_name, save_name, board_status, user_id, file_size from upload_info where no=#{no}")
	public List<UploadInfoBean> findAllByBno(int bno);

}
