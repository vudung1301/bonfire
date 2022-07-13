package BonFire.service;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import BonFire.dto.OrderSearchModel;
import BonFire.entities.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	public PagerData<SaleOrder> search(OrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";

		if (searchModel != null) {
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.customer_name like '%" + searchModel.keyword + "%'" + " or p.customer_address like '%"
						+ searchModel.keyword + "%'" + " or p.customer_phone like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}

}
