const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        switch (req.method) {
            case 'POST':
                // create one customer
                const { customer_data, contact_data, location_data } = req.body
                const customerData = JSON.parse(customer_data)
                const contactData = JSON.parse(contact_data)
                const locationData = JSON.parse(location_data)
                const customer = await prisma.customer.create({data: customerData})
                Promise.all([
                    prisma.customer_Contact.create({data: {...contactData, customer_id: +customer.id}}),
                    prisma.customer_Location.create({data: {...locationData, customer_id: +customer.id}})
                ])                       
                return res.status(200).json({'message': 'created'})
            case 'GET':
                // get all customers
                const customers = await prisma.customer.findMany()
                for (let i = 0; i < customers.length; i++){
                    let [contract, discount, contract_timeline, contact, location] = await Promise.all([
                        await prisma.customer_Contract.findUnique({where: {id: +customers[i].contract_id}}),
                        await prisma.discount.findUnique({where: {id: +customers[i].discount_id}}),
                        await prisma.contract_Timeline.findUnique({where: {id: +customers[i].contract_timeline_id}}),
                        await prisma.customer_Contact.findMany({where: {customer_id: +customers[i].id}}),
                        await prisma.customer_Location.findMany({where: {customer_id: +customers[i].id}})
                    ])
                    customers[i] = { contract, discount, contract_timeline, contact, location }
                }
                return res.status(200).json({customers: customers})
        }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
}
