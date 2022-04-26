-- CreateTable
CREATE TABLE "Appliance_On_Job" (
    "id" SERIAL NOT NULL,
    "appliance_id" INTEGER NOT NULL,
    "job_id" INTEGER NOT NULL,

    CONSTRAINT "Appliance_On_Job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Symptom_On_Job" (
    "id" SERIAL NOT NULL,
    "symptom_id" INTEGER NOT NULL,
    "job_id" INTEGER NOT NULL,

    CONSTRAINT "Symptom_On_Job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Part_On_Job" (
    "id" SERIAL NOT NULL,
    "part_id" INTEGER NOT NULL,
    "job_id" INTEGER NOT NULL,

    CONSTRAINT "Part_On_Job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Location_On_Customer" (
    "id" SERIAL NOT NULL,
    "location_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,

    CONSTRAINT "Location_On_Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technician_On_Visit" (
    "id" SERIAL NOT NULL,
    "technician_id" INTEGER NOT NULL,
    "visit_id" INTEGER NOT NULL,

    CONSTRAINT "Technician_On_Visit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_Log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appliance_Log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Appliance_Log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appliance_Type" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Appliance_Type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appliance_Manufacturer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Appliance_Manufacturer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appliance_Style" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Appliance_Style_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appliance" (
    "id" SERIAL NOT NULL,
    "type_id" INTEGER NOT NULL,
    "manufacturer_id" INTEGER NOT NULL,
    "style_id" INTEGER NOT NULL,
    "model_number" TEXT NOT NULL,

    CONSTRAINT "Appliance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sale_Log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Sale_Log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Discount" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "is_percentage" BOOLEAN NOT NULL DEFAULT false,
    "id_flat_rate" BOOLEAN NOT NULL DEFAULT false,
    "percentage" DECIMAL(65,30) NOT NULL DEFAULT 0.10,
    "flat_rate" DECIMAL(65,30) NOT NULL DEFAULT 50,

    CONSTRAINT "Discount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tax" (
    "id" SERIAL NOT NULL,
    "value" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "Tax_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "id" SERIAL NOT NULL,
    "sale_id" INTEGER NOT NULL,
    "payment_type" TEXT NOT NULL,
    "payment_terms" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sale" (
    "id" SERIAL NOT NULL,
    "job_id" INTEGER NOT NULL,
    "tax_id" INTEGER NOT NULL,
    "payment_status" TEXT NOT NULL,
    "total_cost_after_tax" DECIMAL(65,30) NOT NULL,
    "total_cost_before_tax" DECIMAL(65,30) NOT NULL,
    "total_paid_before_tax" DECIMAL(65,30) NOT NULL,
    "total_paid_after_tax" DECIMAL(65,30) NOT NULL,
    "total_due" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "Sale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer_Log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Customer_Log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer_Contact" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "phone_number" JSONB NOT NULL,
    "email" JSONB NOT NULL,

    CONSTRAINT "Customer_Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer_Location" (
    "id" SERIAL NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL DEFAULT E'TX',
    "postal_code" TEXT NOT NULL,
    "street_name" TEXT NOT NULL,
    "street_number" TEXT NOT NULL,
    "suite_number" TEXT,
    "building_type" TEXT NOT NULL DEFAULT E'House',
    "special_instructions" TEXT NOT NULL,
    "is_gated" BOOLEAN NOT NULL,
    "gate_code" TEXT,

    CONSTRAINT "Customer_Location_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer_Contract" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "started" TIMESTAMP(3) NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Customer_Contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" SERIAL NOT NULL,
    "parent_customer_id" INTEGER,
    "discount_id" INTEGER NOT NULL,
    "contract_id" INTEGER NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job_Log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Job_Log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Picture" (
    "id" SERIAL NOT NULL,
    "job_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "file_location" TEXT NOT NULL,
    "is_private" BOOLEAN NOT NULL,
    "comment" TEXT NOT NULL,

    CONSTRAINT "Picture_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Document" (
    "id" SERIAL NOT NULL,
    "job_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "file_location" TEXT NOT NULL,
    "is_private" BOOLEAN NOT NULL,
    "comment" TEXT NOT NULL,

    CONSTRAINT "Document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Symptom" (
    "id" SERIAL NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "Symptom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Part" (
    "id" SERIAL NOT NULL,
    "model_number" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "last_cost" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "Part_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job_Category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Job_Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job_Source" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Job_Source_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job_phase" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Job_phase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job" (
    "id" SERIAL NOT NULL,
    "category_id" INTEGER NOT NULL,
    "source_id" INTEGER NOT NULL,
    "phase_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,

    CONSTRAINT "Job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Visit_Log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Visit_Log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "On_Site_Contact" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT,
    "last_name" TEXT,
    "email" TEXT,
    "phone_number" TEXT,

    CONSTRAINT "On_Site_Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Time_Slot" (
    "id" SERIAL NOT NULL,
    "visit_id" INTEGER NOT NULL,
    "duration" DECIMAL(65,30) NOT NULL,
    "arival_start" TEXT NOT NULL,
    "arival_end" TEXT NOT NULL,
    "leave_start" TEXT NOT NULL,
    "leave_end" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Time_Slot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Visit" (
    "id" SERIAL NOT NULL,
    "job_id" INTEGER NOT NULL,
    "location_id" INTEGER NOT NULL,
    "time_slot_id" INTEGER NOT NULL,
    "on_site_contact_id" INTEGER NOT NULL,
    "number" INTEGER NOT NULL,
    "tech_notes" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "completion_notes" TEXT NOT NULL,
    "note_to_customer" TEXT NOT NULL,

    CONSTRAINT "Visit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technician_Log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Technician_Log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technician_Visit_Status" (
    "id" SERIAL NOT NULL,
    "visit_id" INTEGER NOT NULL,
    "value" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Technician_Visit_Status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technician_Address" (
    "id" SERIAL NOT NULL,
    "technician_id" INTEGER NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL DEFAULT E'TX',
    "postal_code" TEXT NOT NULL,
    "street_name" TEXT NOT NULL,
    "street_number" TEXT NOT NULL,
    "suite_number" TEXT NOT NULL,
    "building_type" TEXT NOT NULL,
    "special_instructions" TEXT NOT NULL,
    "is_gated" BOOLEAN NOT NULL,

    CONSTRAINT "Technician_Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technician_Contact" (
    "id" SERIAL NOT NULL,
    "technician_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "phone_number" JSONB NOT NULL,
    "email" JSONB NOT NULL,

    CONSTRAINT "Technician_Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technician" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "Technician_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Time_Slot_visit_id_key" ON "Time_Slot"("visit_id");

-- AddForeignKey
ALTER TABLE "Appliance_On_Job" ADD CONSTRAINT "Appliance_On_Job_appliance_id_fkey" FOREIGN KEY ("appliance_id") REFERENCES "Appliance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appliance_On_Job" ADD CONSTRAINT "Appliance_On_Job_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Symptom_On_Job" ADD CONSTRAINT "Symptom_On_Job_symptom_id_fkey" FOREIGN KEY ("symptom_id") REFERENCES "Symptom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Symptom_On_Job" ADD CONSTRAINT "Symptom_On_Job_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Part_On_Job" ADD CONSTRAINT "Part_On_Job_part_id_fkey" FOREIGN KEY ("part_id") REFERENCES "Part"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Part_On_Job" ADD CONSTRAINT "Part_On_Job_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location_On_Customer" ADD CONSTRAINT "Location_On_Customer_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Customer_Location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location_On_Customer" ADD CONSTRAINT "Location_On_Customer_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Technician_On_Visit" ADD CONSTRAINT "Technician_On_Visit_visit_id_fkey" FOREIGN KEY ("visit_id") REFERENCES "Visit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Technician_On_Visit" ADD CONSTRAINT "Technician_On_Visit_technician_id_fkey" FOREIGN KEY ("technician_id") REFERENCES "Technician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Log" ADD CONSTRAINT "User_Log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appliance_Log" ADD CONSTRAINT "Appliance_Log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appliance" ADD CONSTRAINT "Appliance_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "Appliance_Type"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appliance" ADD CONSTRAINT "Appliance_manufacturer_id_fkey" FOREIGN KEY ("manufacturer_id") REFERENCES "Appliance_Manufacturer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appliance" ADD CONSTRAINT "Appliance_style_id_fkey" FOREIGN KEY ("style_id") REFERENCES "Appliance_Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sale_Log" ADD CONSTRAINT "Sale_Log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "Sale"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sale" ADD CONSTRAINT "Sale_tax_id_fkey" FOREIGN KEY ("tax_id") REFERENCES "Tax"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sale" ADD CONSTRAINT "Sale_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer_Log" ADD CONSTRAINT "Customer_Log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer_Contact" ADD CONSTRAINT "Customer_Contact_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "Discount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_contract_id_fkey" FOREIGN KEY ("contract_id") REFERENCES "Customer_Contract"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_parent_customer_id_fkey" FOREIGN KEY ("parent_customer_id") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job_Log" ADD CONSTRAINT "Job_Log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Picture" ADD CONSTRAINT "Picture_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job" ADD CONSTRAINT "Job_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job" ADD CONSTRAINT "Job_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Job_Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job" ADD CONSTRAINT "Job_source_id_fkey" FOREIGN KEY ("source_id") REFERENCES "Job_Source"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job" ADD CONSTRAINT "Job_phase_id_fkey" FOREIGN KEY ("phase_id") REFERENCES "Job_phase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Visit_Log" ADD CONSTRAINT "Visit_Log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Time_Slot" ADD CONSTRAINT "Time_Slot_visit_id_fkey" FOREIGN KEY ("visit_id") REFERENCES "Visit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Customer_Location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_on_site_contact_id_fkey" FOREIGN KEY ("on_site_contact_id") REFERENCES "On_Site_Contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Technician_Log" ADD CONSTRAINT "Technician_Log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Technician_Visit_Status" ADD CONSTRAINT "Technician_Visit_Status_visit_id_fkey" FOREIGN KEY ("visit_id") REFERENCES "Visit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Technician_Address" ADD CONSTRAINT "Technician_Address_technician_id_fkey" FOREIGN KEY ("technician_id") REFERENCES "Technician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Technician_Contact" ADD CONSTRAINT "Technician_Contact_technician_id_fkey" FOREIGN KEY ("technician_id") REFERENCES "Technician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
