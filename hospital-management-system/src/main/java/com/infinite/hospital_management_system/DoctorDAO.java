package com.infinite.hospital_management_system;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DoctorDAO {	
	@SuppressWarnings("unchecked")
	public List<Doctor> showAllDoctors() {
		return SessionHelper.getConnection().openSession().createQuery("from Doctor").list();
	}
	
	//Add Doctor
	public void addDoctor(Doctor doctor) {
		Session session = SessionHelper.getConnection().openSession();
		doctor.setDoctorStatus("AVAILABLE");
		session.save(doctor);
		session.beginTransaction().commit();
		session.close();
	}
}
