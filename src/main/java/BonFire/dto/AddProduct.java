package BonFire.dto;

public class AddProduct {
	private String name;
	private String image;
	private String price;
	private String price_sell;
	private String brand;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPrice_sell() {
		return price_sell;
	}
	public void setPrice_sell(String price_sell) {
		this.price_sell = price_sell;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
}
