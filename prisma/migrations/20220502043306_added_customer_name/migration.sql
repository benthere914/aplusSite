/*
  Warnings:

  - Added the required column `customer_name` to the `Customer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Customer" ADD COLUMN     "customer_name" TEXT NOT NULL;
