const { ApolloServer, gql } = require('apollo-server');
const { SQLDataSource } = require("datasource-sql");

class MyDatabase extends SQLDataSource {
    getFruits() {
      return this.knex
        .select("*")
        .from("fruit");
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
  type Fruit {
      name: String
      size: Int
  }

  type Book {
    title: String
    author: String
  }

  type Query {
    books: [Book]
    fruits: [Fruit]
  }
`;

const books = [
    {
      title: 'The Awakening',
      author: 'Kate Chopin',
    },
    {
      title: 'City of Glass',
      author: 'Paul Auster',
    },
];

// Resolvers define the technique for fetching the types defined in the
// schema. This resolver retrieves books from the "books" array above.
const resolvers = {
    Query: {
      books: () => books,
      fruits: async (_source, _args, { dataSources }) => {
        return dataSources.db.getFruits();
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