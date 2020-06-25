package com.app.project.board;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.app.project.board.trip.Trip_board_bean;
import com.app.project.board.trip.Trip_view_bean;

public interface CommentDao {
	@Select("select no, user_id, content from trip_view_info where no=#{no}")
	public List<Trip_view_bean> findAllByBno(int bno);

}
