/*
  Warnings:

  - You are about to drop the column `expires` on the `Customer_Contract` table. All the data in the column will be lost.
  - You are about to drop the column `started` on the `Customer_Contract` table. All the data in the column will be lost.
  - Added the required column `contract_timeline_id` to the `Customer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Customer" ADD COLUMN     "contract_timeline_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Customer_Contract" DROP COLUMN "expires",
DROP COLUMN "started",
ADD COLUMN     "active" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "autoAdd" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE "Contract_Timeline" (
    "id" SERIAL NOT NULL,
    "started" TIMESTAMP(3) NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Contract_Timeline_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_contract_timeline_id_fkey" FOREIGN KEY ("contract_timeline_id") REFERENCES "Contract_Timeline"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
