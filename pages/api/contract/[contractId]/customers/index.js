const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    const {contractId} = req.query
    try {
        switch (req.method) {
            case 'GET':
                // get all customers
                const customers = await prisma.customer.findMany({
                    where: {contract_id: +contractId},
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
        }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
}
