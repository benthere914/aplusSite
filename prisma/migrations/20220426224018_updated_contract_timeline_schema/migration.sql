/*
  Warnings:

  - You are about to drop the column `expires` on the `Contract_Timeline` table. All the data in the column will be lost.
  - You are about to drop the column `started` on the `Contract_Timeline` table. All the data in the column will be lost.
  - Added the required column `expiration` to the `Contract_Timeline` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start` to the `Contract_Timeline` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Contract_Timeline" DROP COLUMN "expires",
DROP COLUMN "started",
ADD COLUMN     "expiration" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "start" TIMESTAMP(3) NOT NULL;
