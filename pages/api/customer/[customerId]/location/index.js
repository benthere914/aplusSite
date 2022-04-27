const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {customerId} = req.query
        let location
        switch (req.method) {
            case 'GET':
                // get the contract applied to a customer
                location = await prisma.customer_Location.findMany({where: {customer_id: +customerId}})
                return res.status(200).json(location)
            case 'PUT':
                // update the contract applied to a customer
                const {location_data} = req.body
                const locationData = JSON.parse(location_data)
                location = await prisma.customer_Location.update({where: {customer_id: +customerId}, data: locationData})
                return res.status(200).json(location)
            }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
}