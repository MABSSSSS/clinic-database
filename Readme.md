# Clinic Database Schema

This project implements a database schema for a clinic based on the provided diagram.

## Database Schema

The schema consists of the following tables:
- `patients`: Stores patient information.
- `medical_histories`: Stores patient medical history records.
- `treatments`: Stores treatment details.
- `invoices`: Stores invoice information.
- `invoice_items`: Stores items associated with an invoice.

## Running the SQL Script

To create the database schema, run the `schema_based_on_diagram.sql` script in your SQL environment:
```sql
\i schema_based_on_diagram.sql
