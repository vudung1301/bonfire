package BonFire.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_saleorder_products")
public class SaleOrderProducts extends BaseEntity {
	@Column(name= "quality", nullable =false)
	private Integer quality;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="saleorder_id")
	private SaleOrder saleorder;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="product_id")
	private Product productsale;

	public Integer getQuality() {
		return quality;
	}

	public void setQuality(Integer quality) {
		this.quality = quality;
	}


	public SaleOrder getSaleorder() {
		return saleorder;
	}

	public void setSaleorder(SaleOrder saleorder) {
		this.saleorder = saleorder;
	}

	public Product getProductsale() {
		return productsale;
	}

	public void setProductsale(Product productsale) {
		this.productsale = productsale;
	}
}
