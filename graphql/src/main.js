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
        host : '192.168.49.2',
        user : 'postgresadmin',
        password : 'admin123',
        database : 'test',
        port: '30032',
    }
};

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
    },
};

const db = new MyDatabase(knexConfig);

// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({ 
    typeDefs, 
    resolvers, 
    tracing: true,
    logger: true, // Debug
    debug: true,  //
    introspection: true,
    playground: true,
    dataSources: () => ({ db }),
});

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});