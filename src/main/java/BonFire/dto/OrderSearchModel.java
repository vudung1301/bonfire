package BonFire.dto;

public class OrderSearchModel extends BaseSearchModel {
	public String keyword;

	// tìm theo category
	public Integer categoryId;

	public String seo;

	public Boolean isHot;

	public String getKeyword() {
		return keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public String getSeo() {
		return seo;
	}
}
