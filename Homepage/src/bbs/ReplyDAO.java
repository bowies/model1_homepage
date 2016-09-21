package bbs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sqlmap.MyAppSqlConfig;


public class ReplyDAO {

	private static SqlSessionFactory sqlMapper;
	
	static{
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

	public int rcount(int bbsnum){
		SqlSession mybatis = sqlMapper.openSession(true);
		int cnt = mybatis.selectOne("reply.rcount", bbsnum);
		mybatis.close();
	    return cnt;
	}
	
	public boolean create(ReplyDTO dto) {
		boolean flag = false;
		SqlSession mybatis = sqlMapper.openSession(true);

		int cnt = sqlMapper.openSession(true).insert("reply.create", dto);
		if (cnt > 0)
			flag = true;
		mybatis.close();
		return flag;
	}

	public ReplyDTO read(int rnum) {
		SqlSession mybatis = sqlMapper.openSession();
		
		ReplyDTO dto = sqlMapper.openSession().selectOne("reply.read", rnum);

		mybatis.close();
		
		return dto;
	}

	public boolean update(ReplyDTO dto) {
		boolean flag = false;
		SqlSession mybatis = sqlMapper.openSession(true);
		
		int cnt = sqlMapper.openSession(true).update("reply.update", dto);
		if (cnt > 0)
			flag = true;

		mybatis.close();
		return flag;
	}

	public List<ReplyDTO> list(Map map) {
		SqlSession mybatis = sqlMapper.openSession();
		List<ReplyDTO> list = mybatis.selectList("reply.list", map);
		mybatis.close();
		return list;
	}

	public int total(int bbsnum) {
		SqlSession mybatis = sqlMapper.openSession();
		int total = sqlMapper.openSession().selectOne("reply.total", bbsnum);
		mybatis.close();
		
		return total;
	}

	public boolean delete(int rnum) {
		boolean flag = false;
		SqlSession mybatis = sqlMapper.openSession(true);
		int cnt = mybatis.delete("reply.delete", rnum);
		if (cnt > 0)
			flag = true;
		
		mybatis.close();
		return flag;
	}

	/** 하나의 글의 여러댓글들 삭제 */
	public int bdelete(int bbsnum) throws Exception {
		SqlSession mybatis = sqlMapper.openSession(true);
		int cnt = mybatis.delete("reply.bdelete", bbsnum);
		mybatis.close();
		return cnt;

	}
}