const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
export default async (req, res) => {
    switch (req.method) {
        case 'POST':
            // gets data from request body
            const {name, is_percentage, is_flat_rate, percentage, flat_rate } = req.body
            const data = { }
            data.name = name
            data.is_percentage = (is_percentage === 'true')
            data.is_flat_rate = (is_flat_rate === 'true')
            data.percentage = (percentage ? percentage : 0)
            data.flat_rate = (flat_rate ? flat_rate : 0)
            console.log(data)
            // creates discount with data from request body
            const discount = await prisma.discount.create({data})
            console.log(discount)
            res.status(200).json(data)
            break
    }
  }
