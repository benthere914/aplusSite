/*
  Warnings:

  - You are about to drop the column `autoAdd` on the `Customer_Contract` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Customer_Contract" DROP COLUMN "autoAdd",
ADD COLUMN     "auto_add" BOOLEAN NOT NULL DEFAULT false;
