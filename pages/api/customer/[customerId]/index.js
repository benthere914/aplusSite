const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {customerId} = req.query
        if (!+customerId) return res.status(403)
        let customer;
        switch (req.method) {
            case 'GET':
                customer = await prisma.customer.findUnique({where: {id: +customerId}, include:{contacts:true, locations:true, contract:true, Contract_timeline:true, children:true, parent_customer:true}})
                return res.status(200).json(customer)
            case 'PUT':
                const {customerData} = req.body
                const result = await prisma.customer.update({where: {id: +customerId}, data: customerData})
                return res.status(200).json(result)
            case 'DELETE':
                // delete one customer by id
                customer = await prisma.customer.delete({where: {id: +customerId}, include: {contacts:true, locations:true}})
                return res.status(200).json(customer)
        }
    } catch (error) {
        res.status(400).json({error: error.message})
    }
}
