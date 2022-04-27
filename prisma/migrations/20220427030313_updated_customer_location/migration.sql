/*
  Warnings:

  - Added the required column `customer_id` to the `Customer_Location` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Customer_Location" ADD COLUMN     "customer_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Customer_Location" ADD CONSTRAINT "Customer_Location_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
