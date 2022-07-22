package kr.ac.kopo.board.service;

import java.util.List;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {

	private BoardDAO boardDao;

	public BoardService(BoardDAO boardDAO) {
		this.boardDao = boardDAO;
	}

	/**
	 * 전체게시글조회
	 */
	public List<BoardVO> selectAllBoard() {

		List<BoardVO> boardList = boardDao.selectAll();
		return boardList;
	}

	/**
	 * 게시글 등록
	 * @param board
	 */
	public void addBoard(BoardVO board) {
		int no = boardDao.selectBoardNo();
		board.setNo(no);
		boardDao.insertBoard(board);
	}
	
	/**
	 * 게시글 상세 정보
	 * @param no
	 * @return
	 */
	public BoardVO getBoard(int no) {
		return boardDao.selectByNo(no);
	}
}
