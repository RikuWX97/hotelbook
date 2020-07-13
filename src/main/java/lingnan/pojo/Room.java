package lingnan.pojo;

import org.springframework.web.multipart.MultipartFile;

public class Room {
    private Integer roomId;
	private String roomType;
	private Integer roomPrice;
	private Integer roomStock;
	private String image;
	private String formu;
	private MultipartFile file;

	public Room() {

	}

	

	public Room(Integer roomId, String roomType, Integer roomPrice,
			Integer roomStock, String image, String formu, MultipartFile file) {
		this.roomId = roomId;
		this.roomType = roomType;
		this.roomPrice = roomPrice;
		this.roomStock = roomStock;
		this.image = image;
		this.formu = formu;
		this.file = file;
	}



	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public Integer getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(Integer roomPrice) {
		this.roomPrice = roomPrice;
	}

	public Integer getRoomStock() {
		return roomStock;
	}

	public void setRoomStock(Integer roomStock) {
		this.roomStock = roomStock;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	public String getFormu() {
		return formu;
	}

	public void setFormu(String formu) {
		this.formu = formu;
	}



	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomType=" + roomType
				+ ", roomPrice=" + roomPrice + ", roomStock=" + roomStock
				+ ", image=" + image + ", formu=" + formu + ", file="
				+ file + "]";
	}
    

	
}
