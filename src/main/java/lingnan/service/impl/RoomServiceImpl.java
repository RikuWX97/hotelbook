package lingnan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lingnan.mapper.RoomMapper;
import lingnan.pojo.Room;
import lingnan.service.RoomService;

@Service("roomService")
public class RoomServiceImpl implements RoomService{
    
	@Autowired
	private RoomMapper roomMapper;
	
	public void save(Room bean) {
		roomMapper.save(bean);
	}

	
	public Room getByRoomId(Integer roomId) {
	
		return roomMapper.getByRoomId(roomId);
	}
	
	public boolean update(Room bean) {
		
		return roomMapper.update(bean);
	}

	public boolean delete(Integer roomId) {
		
		return roomMapper.delete(roomId);
	}

	public List<Room> getList() {
		
		return roomMapper.getList();
	}


	//通过模糊查询类型
	public List<Room> getByType(Room bean) {
	
		return roomMapper.getByType(bean);
	}


	public int countAllRoom() {
		return roomMapper.countAllRoom();
	}


	public List<Room> findByAll(Room room) {
		return roomMapper.findByAll(room);
	}


	public boolean stockOne(int roomId) {
		return roomMapper.stockOne(roomId);
	}
	public boolean stockAddOne(int roomId) {
		return roomMapper.stockAddOne(roomId);
	}

}
