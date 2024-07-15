show dbs
use ('myntra')
show collections

use ('myntra')
db.product.find()  // shows all records

use ('myntra')
db.product.insertOne({      
    "name": "T-shirt",
    "price": 1000
})   // inserting one record

use ('myntra')
db.product.find()  // shows all records

use ('myntra')
db.product.insertOne({      
    "name": "Campus Shoes",
    "price": 1000,
    "features":
    {
        uses:"running,walking",
        size:"6ft,5ft,4ft",
        color:"red,green,blue"
    }
})   // inserting one record with sub data

use ('myntra')
db.product.find()  // shows all records

use ('myntra')
db.product.insertMany([{name:'Moto AC',price:80000},
{name:'HPU laptop',price:50000,category:'laptop'},
{name:'DigiWatch',price:3000,company:'Boat',category:'smartwatch'}])

use ('myntra')
db.product.find()  // shows all records

use ('myntra')
db.product.deleteOne({category:'mobile'})

use ('myntra')
db.product.find()  // shows all records


use ('myntra')
db.product.deleteOne({price:1000}) //delete only one record

use ('myntra')
db.product.find()  // shows all records

use ('myntra')
db.product.insertOne({      
    "name": "T-shirt",
    "price": 1000
})   // inserting one record


use ('myntra')
db.product.find()  // shows all records

use ('myntra')
db.product.deleteMany({price:1000}) //delete only one record

use ('myntra')
db.product.find()  // shows all records
