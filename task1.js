// Task 1: Patient Appointment Search
// The hospital reception team wants to identify patients who are from Hyderabad and are older than 30.
// Write your MongoDB query below:

db.patients.find(
  {
    // Filter conditions
  },
  {
    // Projection
  }
).sort({
  // Sort order
}).limit(10);
