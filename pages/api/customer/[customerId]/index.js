const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {customerId} = req.query
        let customer;
        switch (req.method) {
            case 'GET':
                // get one customer by id
                customer = await prisma.customer.findUnique({where: {id: +customerId}})
                return res.status(200).json(customer)
            case 'DELETE':
                // delete one customer by id
                customer = await prisma.customer.delete({where: {id: +customerId}})
                return res.status(200).json(customer)
        }
    } catch (error) {
        res.status(400).json({error: error.message})
    }
}
