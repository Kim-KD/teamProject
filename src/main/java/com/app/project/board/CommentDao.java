package com.app.project.board;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.app.project.board.trip.Trip_BoardBean;
import com.app.project.board.trip.Trip_ViewBean;

public interface CommentDao {
	@Select("select no, user_id, content from trip_view_info where no=#{no}")
	public List<Trip_ViewBean> findAllByBno(int bno);

}
