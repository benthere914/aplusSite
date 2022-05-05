const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {customerId} = req.query
        const customer = prisma.customer.findUnique({where: {id: +customerId}})
        let discount
        switch (req.method) {
            case 'GET':
                // get the discount applied to a customer
                discount = await prisma.discount.findUnique({where: {id: +(await customer).discount_id}})
                return res.status(200).json(discount)
            case 'PUT':
                // update the discount applied to a customer
                const {discount_data } = req.body
                const discountData = JSON.parse(discount_data)
                discountData.is_percentage = (discountData.is_percentage === 'true')
                discountData.is_flat_rate = (discountData.is_flat_rate === 'true')
                discountData.auto_add = (discountData.auto_add === 'true')
                discountData.active = (discountData.active === 'true')
                data.percentage = (percentage ? percentage : 0)
                data.flat_rate = (flat_rate ? flat_rate : 0)
                discount = await prisma.discount.update({where: {id: +(await customer).discount_id}, data: discountData})
                return res.status(200).json(discount)
        }
        
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
  }
