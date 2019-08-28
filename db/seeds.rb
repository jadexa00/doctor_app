roles = ['doctor', 'job', 'patient']
10.times do
  doctor = Doctor.create(
    name: Faker::Doctors.doctor_name
  )
 
  10.times do 
    patient = Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )

    Appointment.create(
      role: roles.sample,
      doctor_id: doctor.id,
      patient_id: patient.id
    )
  end
end

puts "Data Seeded."