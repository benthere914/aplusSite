import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()
export default async (req, res) => {
    const customers = {}
    const duplicates = []
    const customerResult = await prisma.customer.findMany()
    for (let i = 0; i < customerResult.length; i++){
        const name = customerResult[i].customer_name
        if (!customers[name]) customers[name] = {count: 1}
        else customers[name].count++;
    }
    for (let key in customers) {
        if (customers[key].count === 1) delete customers[key]
        
        // console.log(customers[key].count > 1)
        // customers[key].count > 1 ? console.log(true, customers[key].count) : null
    }
    return res.status(200).json({customers})
}