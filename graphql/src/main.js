const { ApolloServer, gql } = require('apollo-server');
const { SQLDataSource } = require("datasource-sql");

class MyDatabase extends SQLDataSource {
    getDatas() {
      return this.knex
        .select("n",this.knex.raw("to_json(created_at) as created_at"))
        .from("data");
    }
}

const knexConfig = {
    client: "pg",
    connection: {
        host : process.env.PG_HOST,
        port: process.env.PG_PORT,
        user : process.env.PG_USER,
        password : process.env.PG_PASSWORD,
        database : process.env.PG_DBNAME,
    }
};

console.log("knexConfig",knexConfig);

const typeDefs = gql`
  type Data {
      n: Int
      created_at: String
  }

  type Query {
    datas: [Data]
  }
`;

// Resolvers define the technique for fetching the types defined in the
// schema. This resolver retrieves books from the "books" array above.
const resolvers = {
    Query: {
      datas: async (_source, _args, { dataSources }) => {
        return dataSources.db.getDatas();
      }
    }
};

const db = new MyDatabase(knexConfig);

// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({ 
    typeDefs, 
    resolvers, 
    tracing: true,
    debug: true,  //
    introspection: true,
    playground: {
        settings: {
            'editor.theme': 'light',
            'schema.polling.enable': true,
            'schema.polling.interval': 500,
        }
    },
    persistedQueries: false,
    cacheControl: {
        defaultMaxAge: 0,
    },
    dataSources: () => ({ db }),
});

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});