-- Create the patients table
CREATE TABLE patients (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE
);

-- Create the medical_histories table
CREATE TABLE medical_histories (
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT,
    status VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- Create the treatments table
CREATE TABLE treatments (
    id INT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

-- Create the invoices table
CREATE TABLE invoices (
    id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2) NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

-- Create the invoice_items table
CREATE TABLE invoice_items (
    id INT PRIMARY KEY,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
-- Example join table for many-to-many relationship between medical_histories and treatments
CREATE TABLE medical_history_treatments (
    medical_history_id INT,
    treatment_id INT,
    PRIMARY KEY (medical_history_id, treatment_id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
CREATE INDEX idx_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id);
