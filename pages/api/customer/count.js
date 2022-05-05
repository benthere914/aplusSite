const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    console.log(req)
    const count = await prisma.customer.count({})
    res.status(200).json({count})
}