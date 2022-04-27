const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {customerId} = req.query
        const customer = prisma.customer.findUnique({where: {id: +customerId}})
        let timeline;
        switch (req.method) {
            case 'GET':
                // get the contract timeline on a customer
                timeline = await prisma.contract_Timeline.findUnique({where: {id: +(await customer).contract_timeline_id}})
                return res.status(200).json(timeline)
            case 'PUT':
                // update the contract timeline's expiration on a customer
                const {timeline_data} = req.body
                const timeLineData = JSON.parse(timeline_data)
                timeLineData.start = new Date(timeLineData.start)
                timeLineData.expiration = new Date(timeLineData.expiration)
                timeline = await prisma.contract_Timeline.update({where: {id: +(await customer).contract_timeline_id}, data: timeLineData})    
                return res.status(200).json(timeline)
        }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }

}