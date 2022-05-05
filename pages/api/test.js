import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()

export default async (req, res) => {
    const contacts = await prisma.customer_Contact.findMany()
    const duplicates = []
    for (let i = 0; i < contacts.length; i++){
        const contact = contacts[i]
        const duplicate_contacts = await prisma.customer_Contact.findMany({where: {first_name: contact.first_name, last_name: contact.last_name}})
        if (duplicate_contacts.length > 1) {
            duplicates.push(duplicate_contacts)
            // console.log(duplicate_contacts)
        }
        console.log(`looped thru ${i} of ${contacts.length}`)
    }
    res.status(200).json(duplicates)   
}