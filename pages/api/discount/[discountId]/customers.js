import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
export default async (req, res) => {
    const {discountId} = req.query
    const customers = await prisma.customer.findMany({where: {discount_id: +discountId}})
    res.status(200).json({customers})
}