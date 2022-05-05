import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()

export default async (req, res) => {
    const {customerName} = req.body
    const customers = await prisma.customer.findMany({where: {customer_name: customerName}, include: {contacts: true, locations: true}})
    return res.status(200).json({customers})
}