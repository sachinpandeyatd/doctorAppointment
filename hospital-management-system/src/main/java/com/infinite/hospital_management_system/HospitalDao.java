package com.infinite.hospital_management_system;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


public class HospitalDao {
	SessionFactory sessionFactory;
	
	//AddPatient
	public String addPatient(Patient patient) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(patient);
		transaction.commit();
		session.close();
		return "Patient Added..";
	}

	//ShowPatient
	public List<Patient> showPatient(){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query =  session.createQuery("from Patient");
		List<Patient> patientlist = query.list();
		return patientlist;
	}
	
	//SearchPatient
	public List<Patient> searchPatient(int patientId) {		
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Patient.class);
		criteria.add(Restrictions.eq("patientId", patientId));
		List<Patient> patientlist = criteria.list();
		return patientlist;
	}
	
	//ShowMedHistory
    public List<MedicalHistory> showMedicalHistory(){
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Query query =  session.createQuery("from MedicalHistory");
        List<MedicalHistory> medicalHistorylist = query.list();
        return medicalHistorylist;
    }
    
    //AddMedicalHistory
    public void addMedicalHistory(MedicalHistory medicalHistory) {
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(medicalHistory);
        transaction.commit();
        session.close();
    }

    //searchMedicalHistory 
    @SuppressWarnings("unchecked")
	public List<MedicalHistory> searchMedicalHistory(int medHisId) {
        return SessionHelper.getConnection().openSession().createQuery("from MedicalHistory where med_his_id = " + medHisId).list();
    }
    
  //SearchPayments
  	public List<Payment> searchPayment(int paymentId) {
  		sessionFactory = SessionHelper.getConnection();
  		Session session = sessionFactory.openSession();
  		Criteria criteria = session.createCriteria(Payment.class);
  		criteria.add(Restrictions.eq("paymentId",paymentId));
  		List<Payment> paymentlist = criteria.list();
  		return paymentlist;
  	}
  	
  	
  	//AddPayment
	public void addPayment(Payment payment) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		java.util.Date date = new java.util.Date();
		Date paymentdate = new Date(date.getTime());
		payment.setPaymentDate(paymentdate);
		
		Transaction transaction = session.beginTransaction();
		session.save(payment);
		transaction.commit();
		session.close();
	}
	
	//ShowPayments
	
	public List<Payment> showPayments(){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query =  session.createQuery("from Payment");
		List<Payment> paymentlist = query.list();
		return paymentlist;
		
	}
    
	
	//Admission of patient
	public String admitPatient(Admission admission) {
		Session session = SessionHelper.getConnection().openSession();
		
		session.save(admission);
		session.beginTransaction().commit();
		
		return "Patient Admited.";
	}
	
	
	public Date convertDate(java.util.Date dt) {
        java.sql.Date sqlDate=new java.sql.Date(dt.getTime());
        return sqlDate;
    }
	
	//Available rooms
	@SuppressWarnings("unchecked")
	public List<Integer> showAvailableRooms() {
		return (List<Integer>) SessionHelper.getConnection().openSession().createQuery("SELECT roomId from Room where status = 'AVAILABLE' ").list();
	}
	
	public Room searchRoomById(int roomId) {
		return (Room) SessionHelper.getConnection().openSession().createQuery("from Room where roomId = " + roomId).list().get(0);
	}
	
	public Doctor searchDoctorById(int doctorId) {
		return (Doctor) SessionHelper.getConnection().openSession().createQuery("from Doctor where doctorId =" + doctorId).list().get(0);
	}
    
	@SuppressWarnings("unchecked")
	public List<Doctor> showAllAvailableDoctors() {
		return (List<Doctor>) SessionHelper.getConnection().openSession().createQuery("from Doctor where doctorStatus = 'AVAILABLE'").list();
	}
	
	public List<String> showAllIssues() {
		return (List<String>) SessionHelper.getConnection().openSession().createQuery("SELECT issue from Issues").list();
	}
	
	//AddTreatment  
    public void addTreatment(Treatment treatment) {
    	sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();  
        
        session.save(treatment);
        session.beginTransaction().commit();
        session.close();
        
        if(treatment.getRoomId() > 0){
	        session = sessionFactory.openSession();
	        Room room = searchRoomById(treatment.getRoomId());
	        room.setStatus("UNAVAILABLE");
	        session.update(room);
	        session.beginTransaction().commit();
	        session.close();
        }
        
        Doctor doctor = searchDoctorById(treatment.getDoctorid());
        doctor.setDoctorStatus("UNAVAILABLE");
        
        session = sessionFactory.openSession();
        session.update(doctor);
        session.beginTransaction().commit();
        session.close();  
    }
    
    //ShowTreatment
    @SuppressWarnings("unchecked")
	public List<Treatment> showTreatment(){
        return (List<Treatment>) SessionHelper.getConnection().openSession().createQuery("from Treatment").list();
    }
    
    //SearchTreatment
    public List<Treatment> searchTreatment(int treatmentId) {
	    return (List<Treatment>) SessionHelper.getConnection().openSession().createCriteria(Treatment.class).add(Restrictions.eq("treatmentId", treatmentId)).list();
    }
    
    //Discharge
    public void discharge(int treatmentId) {
    	Session session = SessionHelper.getConnection().openSession();
    	
        Treatment treatment = searchTreatment(treatmentId).get(0);
        treatment.setDischargedate(new java.sql.Date(new java.util.Date().getTime()));
        session.update(treatment);
        session.beginTransaction().commit();
        session.close();
        
        Doctor doctor = searchDoctorById(treatment.getDoctorid());
        doctor.setDoctorStatus("AVAILABLE");
        
        session = SessionHelper.getConnection().openSession();
        session.update(doctor);
        session.beginTransaction().commit();
        session.close();  
	}
}
