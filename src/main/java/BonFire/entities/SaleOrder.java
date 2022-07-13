package BonFire.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="tbl_saleorder")
public class SaleOrder extends BaseEntity {
	@Column(name="code", length=45, nullable = false)
	private String code;
	
	@Column(name="total", precision = 13, scale= 2, nullable = true)
	private BigDecimal total;
	
	@Column(name="customer_name", length=100, nullable = true)
	private String customer_name;

	@Column(name="customer_address", length=100, nullable = true)
	private String customer_address;
	
	@Column(name="customer_phone", length=100, nullable = true)
	private String customer_phone;
	
	@Column(name="customer_email", length=100, nullable = true)
	private String customer_email;
	
	
	@OneToMany(cascade = CascadeType.ALL, fetch= FetchType.LAZY, mappedBy="saleorder")
	private Set<SaleOrderProducts> saleorder = new HashSet<SaleOrderProducts>();
	
	public void addSaleOrderProduct(SaleOrderProducts productsale) {
		this.saleorder.add(productsale);
		productsale.setSaleorder(this);
	}
	public void deleteSaleOrderProducy(SaleOrderProducts productsale) {
		this.saleorder.remove(productsale);
		productsale.setSaleorder(null);
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<SaleOrderProducts> getSaleorder() {
		return saleorder;
	}

	public void setSaleorder(Set<SaleOrderProducts> saleorder) {
		this.saleorder = saleorder;
	}

	

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}


	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public String getCustomer_phone() {
		return customer_phone;
	}

	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	
}
