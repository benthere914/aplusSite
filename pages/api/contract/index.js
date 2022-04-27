const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        let contract;
        switch (req.method) {
            case 'POST':
                // create a customer contract
                const {contract_data} = req.body
                const contractData = JSON.parse(contract_data)
                contractData.auto_add = (contractData.auto_add === 'true')
                contractData.active = (contractData.active === 'true')
                contract = await prisma.customer_Contract.create({data: contractData})
                return res.status(200).json(contract)
            case 'GET':
                // get all the customer contracts
                contract = await prisma.customer_Contract.findMany()
                return res.status(200).json(contract)
        }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
    
}
