package BonFire.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
@Entity
@Table(name="tbl_products")
public class Product extends BaseEntity {
	@Column(name="title", length=100, nullable = false)
	private String name;
	
	@Column(name="price", precision = 13, scale= 2, nullable = false)
	private BigDecimal price;
	
	@Column(name="price_sale", precision = 13, scale= 2, nullable = true)
	private BigDecimal price_sale;
	
	@Column(name="short_description", length=3000, nullable = false)
	private String short_description;
	
	@Column(name="detail_description", nullable=false , columnDefinition="LONGTEXT")
	private String detail_description;
	
	@Column(name="avatar", nullable= true)
	private String avatar;
	
	@Column(name="seo", length=100, nullable = true)
	private String seo;
	
	@Column(name="is_hot", nullable= true)
	private Boolean isHot= Boolean.FALSE;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="category_id")
	private Categories categories;
	
	@OneToMany(cascade = CascadeType.ALL, fetch= FetchType.LAZY, mappedBy="product_images")
	private Set<ProductImages> product_images= new HashSet<ProductImages>();
	
	@OneToMany(cascade = CascadeType.ALL, fetch= FetchType.LAZY, mappedBy="productsale")
	private Set<SaleOrderProducts> productsale = new HashSet<SaleOrderProducts>();
	
	public void addSaleOrderProduct(SaleOrderProducts productsale) {
		this.productsale.add(productsale);
		productsale.setProductsale(this);
	}
	
	public void deleteSaleOrderProduct(SaleOrderProducts productsale) {
		this.productsale.add(productsale);
		productsale.setProductsale(null);
	}



	public void addProductImages(ProductImages product_images) {
		this.product_images.add(product_images);
		product_images.setProduct_images(this);
	}
	
	public void deleteProductImages(ProductImages product_images) {
		this.product_images.remove(product_images);
		product_images.setProduct_images(null);
	}
	

	public Set<SaleOrderProducts> getProductsale() {
		return productsale;
	}

	public void setProductsale(Set<SaleOrderProducts> productsale) {
		this.productsale = productsale;
	}

	public Set<ProductImages> getProduct_images() {
		return product_images;
	}

	public void setProduct_images(Set<ProductImages> product_images) {
		this.product_images = product_images;
	}
	
	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return price;
	}


	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(BigDecimal price_sale) {
		this.price_sale = price_sale;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}


	public String getDetail_description() {
		return detail_description;
	}

	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}




	
	
}
