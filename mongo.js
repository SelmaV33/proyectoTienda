const { MongoClient} = require("mongodb");
const url = "mongodb://localhost:27017";
const client = new MongoClient(url);
let db;

const connection = mysql1.createConnection({
    host: "localhost",
    user: "root",
    password: "SidinaAba",
    database: "polo_digital"
});

async function migrarcliente(){
    const collection = db.collection("cliente");

    Connection.query("select razon_social, cif, sector,telefono,numero_empleados", (error, result) => {
        if(error){
            throw error;
        }

        collection.insertMany(result);
    });
}

async function main(){
    await client.connect();
     console.log("Conectado a Mongodb");

     db = client.db("polo_digital");

     await migrarUsuaruios();
     await migrarCliente();
     await migrarEmpleados();
     await migrarSalas();

     return true;

}