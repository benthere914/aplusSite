const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    switch (req.method) {
        case 'POST':
            // gets data from request body
            const { discount_id, contract_id} = req.body
            const data = { discount_id, contract_id }
            // validates request body data



            // const customer = await prisma.customer.create({data})
            res.status(200).json(data)
            break
        case 'PATCH':
            // updates all customers
            break
    }
  }
