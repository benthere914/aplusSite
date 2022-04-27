const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {customerId} = req.query
        const customer = await prisma.customer.findUnique({where: {id: +customerId}})
        let contract
        switch (req.method) {
            case 'GET':
                // get the contract applied to a customer
                contract = await prisma.customer_Contract.findUnique({where: {id: +customer.contract_id}})
                return res.status(200).json(contract)
        }
    } catch (error) {
        return res.status(400).json({error: error.messaage})
    }
}