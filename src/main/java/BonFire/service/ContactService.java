package BonFire.service;

import org.springframework.stereotype.Service;

import BonFire.entities.Contact;

@Service
public class ContactService extends BaseService <Contact> {
	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}
}
