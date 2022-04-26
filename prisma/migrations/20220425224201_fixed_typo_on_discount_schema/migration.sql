/*
  Warnings:

  - You are about to drop the column `id_flat_rate` on the `Discount` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Discount" DROP COLUMN "id_flat_rate",
ADD COLUMN     "is_flat_rate" BOOLEAN NOT NULL DEFAULT false;
