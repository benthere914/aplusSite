const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        let discount;
        switch (req.method) {
            case 'POST':
                // create one discount
                const { discount_data } = req.body
                const discountData = JSON.parse(discount_data)
                discountData.is_percentage = (discountData.is_percentage === 'true')
                discountData.is_flat_rate = (discountData.is_flat_rate === 'true')
                discountData.auto_add = (discountData.auto_add === 'true')
                discountData.active = (discountData.active === 'true')
                discountData.percentage = (discountData.percentage ? discountData.percentage : 0)
                discountData.flat_rate = (discountData.flat_rate ? discountData.flat_rate : 0)
                discount = await prisma.discount.create({data: discountData})
                return res.status(200).json(discount)
            case 'GET':
                // get all the discounts
                discount = await prisma.discount.findMany()
                return res.status(200).json(discount)
        }
    } catch (error) {
        return res.status({error: error.message})
    }
    
  }
