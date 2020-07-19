package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.board.util.ConnectionUtil;
import com.board.util.QueryUtil;
import com.board.vo.Board;

public class BoardDao {
	
	private Board resultsetToBoard (ResultSet rs) throws Exception {
		Board board = new Board();
		board.setNo(rs.getInt("board_no"));
		board.setTitle(rs.getString("board_title"));
		board.setContent(rs.getString("board_content"));
		board.setWriter(rs.getString("board_writer"));
		board.setViewCount(rs.getInt("board_view_count"));
		board.setLikes(rs.getInt("board_likes"));
		board.setVisible(rs.getString("board_visible"));
		board.setRegistDate(rs.getDate("board_registDate"));
		
		return board;
	}
	
	public Board getBoardByNo(int boardNo) throws Exception {
		Board board = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			board = new Board();
			board = resultsetToBoard(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
	
	public Board getBoardByWriter(String boardWriter) throws Exception {
		Board board = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByWriter"));
		pstmt.setString(1, boardWriter);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			board = new Board();
			board = resultsetToBoard(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
	
	public List<Board> getAllBoards() throws Exception {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoard"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			board = resultsetToBoard(rs);
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getAllBoardsWithRange(int beginNum, int endNum) throws Exception {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoardsWithRange"));
		pstmt.setInt(1, beginNum);
		pstmt.setInt(2, endNum);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			board = resultsetToBoard(rs);
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public void insertBoard(Board board) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.insertBoard"));
		
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setString(3, board.getWriter());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard(Board board) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getViewCount());
		pstmt.setInt(4, board.getLikes());
		pstmt.setString(5, board.getVisible());
		pstmt.setInt(6, board.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoardViewCnt(int boardNo, int cnt) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoardViewCnt"));

		pstmt.setInt(1, cnt);
		pstmt.setInt(2, boardNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	public void updateBoardLikes(int boardNo, int likes) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoardLikes"));
		
		pstmt.setInt(1, likes);
		pstmt.setInt(2, boardNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void removeBoardByNo(int boardNo) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.removeBoardByNo"));
		pstmt.setInt(1, boardNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public int getBoardCount() throws Exception {
		int count = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardCount"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			count =rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return count;
	}
}




















