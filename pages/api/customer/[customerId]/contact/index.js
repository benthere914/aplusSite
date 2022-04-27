const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {customerId} = req.query
        let contact
        switch (req.method) {
            case 'GET':
                // get the contract applied to a customer
                contact = await prisma.customer_Contact.findMany({where: {customer_id: +customerId}})
                return res.status(200).json(contact)
            case 'PUT':
                // update the contract applied to a customer
                const {contact_data} = req.body
                const contactData = JSON.parse(contact_data)
                contact = await prisma.customer_Contact.update({where: {customer_id: +customerId}, data: contactData})
                return res.status(200).json(contact)
        }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
}