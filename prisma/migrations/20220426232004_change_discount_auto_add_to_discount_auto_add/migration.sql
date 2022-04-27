/*
  Warnings:

  - You are about to drop the column `autoAdd` on the `Discount` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Discount" DROP COLUMN "autoAdd",
ADD COLUMN     "auto_add" BOOLEAN NOT NULL DEFAULT false;
