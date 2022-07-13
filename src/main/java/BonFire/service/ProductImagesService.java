package BonFire.service;

import org.springframework.stereotype.Service;

import BonFire.entities.ProductImages;


@Service
public class ProductImagesService extends BaseService<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}

}

