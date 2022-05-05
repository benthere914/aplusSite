const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        switch (req.method) {
            case 'POST':
                // create one customer
                const { customerData, timelineData, contactData, locationData } = req.body
                // console.log(req.body)
                // console.log(timelineData)
                timelineData.start = new Date(timelineData.start)
                timelineData.expiration = new Date(timelineData.expiration)
                const contract_timeline = await prisma.contract_Timeline.create({data: timelineData})
                console.log(contract_timeline)
                const customer = await prisma.customer.create({data: {...customerData, contract_timeline_id: contract_timeline.id}})
                
                console.log(customer)
                for (let i = 0; i < contactData.length; i++) contactData[i].customer_id = customer.id
                for (let i = 0; i < locationData.length; i++) locationData[i].customer_id = customer.id
                const [contacts, locations, count ] = await Promise.all([
                    prisma.customer_Contact.createMany({data: contactData}),
                    prisma.customer_Location.createMany({data: locationData}),
                    prisma.customer.count({})
                ])
                
                return res.status(200).json({'message': 'created', count})
            case 'GET':
                // get all customers
                const customers = await prisma.customer.findMany({
                    include: {
                        contract: true, 
                        Contract_timeline: true,
                        discount: true,
                        contacts: true, 
                        locations: true, 
                        parent_customer: true,
                        children: true
                    }
                }
                )
                return res.status(200).json({customers: customers})
            case 'DELETE':
                await prisma.customer_Contact.deleteMany({})
                await prisma.customer_Location.deleteMany({})
                await prisma.customer.deleteMany({})
                await prisma.contract_Timeline.deleteMany({})
                return res.status(200).json({message: 'deleted'})
        }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
}
