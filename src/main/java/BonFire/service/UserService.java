package BonFire.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import BonFire.dto.OrderSearchModel;
import BonFire.entities.SaleOrder;
import BonFire.entities.User;



@Service
public class UserService extends BaseService<User> {
	@Autowired
	private RoleService roleService;
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<User> users = this.executeByNativeSQL(sql, 0).getData();
		
		if(users == null || users.size() <= 0) return null;
		return users.get(0);
	}
	public PagerData<User> search(OrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users p WHERE 1=1";

		if (searchModel != null) {
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.username like '%" + searchModel.keyword + "%'" + " or p.email like '%"
						+ searchModel.keyword + "%'" + " or p.name like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	@Transactional
	public User createAccount(User user, String name , String address, String email, String phone_number) {
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
		String encodedPassword = encode.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		
		user.setName(name);
		user.setAddress(address);
		user.setEmail(email);
		user.setPhone_number(phone_number);
		
		user.addRoles(roleService.findAll().get(1));
		
		return super.saveOrUpdate(user);
	}

	
}
