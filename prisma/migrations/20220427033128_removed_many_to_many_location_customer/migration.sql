/*
  Warnings:

  - You are about to drop the `Location_On_Customer` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Location_On_Customer" DROP CONSTRAINT "Location_On_Customer_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "Location_On_Customer" DROP CONSTRAINT "Location_On_Customer_location_id_fkey";

-- DropTable
DROP TABLE "Location_On_Customer";
