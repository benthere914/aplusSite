import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()
export default async (req, res) => {
    const {customerData} = req.body
    const result = []
    for (let i = 0; i < customerData.length; i++) {
        const customer = await prisma.customer.create({data: customerData})
        result.push(customer.id) 
        console.log(`made ${i + 1} customer`)
    }
    return res.status(200).json({result})
}