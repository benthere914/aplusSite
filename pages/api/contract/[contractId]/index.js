const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const { contractId } = req.query
        let contract;
        switch (req.method) {
            case 'GET':
                // get a customer contract by id
                contract = await prisma.customer_Contract.findUnique({where: {id: +contractId}})
                return res.status(200).json(contract)
            case 'PUT':
                // update a customer contract by id
                const {contractData} = req.body
                // const contractData = JSON.parse(contract_data)
                // contractData.autoAdd = (contractData.autoAdd === 'true')
                // contractData.active = (contractData.active === 'true')
                contract = await prisma.customer_Contract.update({where: {id: +contractId}, data})
                return res.status(200).json(contract)
            case 'DELETE':
                // delete a customer contract by id
                contract = await prisma.customer_Contract.delete({where})
                return res.status(200).json(contract)
        }
    } catch (error) {
        return res.status(400).json({error: error.messagge})
    }
}