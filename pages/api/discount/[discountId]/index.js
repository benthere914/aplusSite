const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    try {
        const {discountId} = req.query
        let discount;
        switch (req.method) {
            case 'GET':
                // get one discount by id
                discount = await prisma.discount.findUnique({where: {id: +discountId}})
                return res.status(200).json(discount)
            case 'PUT':
                // update a discount by id
                const { discount_data } = req.body
                const discountData = JSON.parse(discount_data)
                discountData.is_percentage = (discountData.is_percentage === 'true')
                discountData.is_flat_rate = (discountData.is_flat_rate === 'true')
                discountData.auto_add = (discountData.auto_add === 'true')
                discountData.active = (discountData.active === 'true')
                discountData.percentage = (discountData.percentage ? discountData.percentage : 0)
                discountData.flat_rate = (discountData.flat_rate ? discountData.flat_rate : 0)
                discount = await prisma.discount.update({where: {id: +discountId}, data: discountData})
                return res.status(200).json(discount)
            case 'DELETE':
                // delete a discount by id
                discount = await prisma.discount.delete({where: {id: +discountId}})
                return res.status(200).json(discount)
        }
    } catch (error) {
        return res.status(400).json({error: error.message})
    }
}
