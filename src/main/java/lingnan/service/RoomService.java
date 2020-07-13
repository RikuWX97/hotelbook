package lingnan.service;

import java.util.List;

import lingnan.pojo.Room;

public interface RoomService {
	  //根据id查询
	   Room getByRoomId(Integer roomId);
	   //查询全部
	   List<Room> getList();
	   //String insert(Room bean);
	   //修改
	   boolean update(Room bean);   
	   //库存减一
	   boolean stockOne(int roomId);   
	   //库存加1
	   boolean stockAddOne(int roomId);   
	   //删除
       boolean delete(Integer roomId);  
       //通过房间类型进行模糊查询
       List<Room> getByType(Room room);
       //增加
       void save(Room bean);
       //json计算所有数据条数
       int countAllRoom();
       //json动态条件查询
       List<Room> findByAll(Room room);
}
