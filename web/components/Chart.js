import React, { useEffect, useState } from "react";
import { TimeSeries, Index } from "pondjs";
import {
  Charts,
  ChartContainer,
  ChartRow,
  YAxis,
  ScatterChart,
} from "react-timeseries-charts";
import { ApolloClient, gql, InMemoryCache } from "@apollo/client";

const NEXT_PUBLIC_API_ENDPOINT = process.env.NEXT_PUBLIC_API_ENDPOINT;

const client = new ApolloClient({
  uri: NEXT_PUBLIC_API_ENDPOINT + "/graphql",
  cache: new InMemoryCache(),
});

const Chart = () => {
  const [series, setSeries] = useState(null);

  useEffect(() => {
    const fetch = async () => {
      const result = await client.query({
        query: gql`
          query GetDatas {
            datas(limit: 1000) {
              list {
                n
                created_at
              }
            }
          }
        `,
        fetchPolicy: "no-cache",
      });

      console.log("fetch");

      const series = new TimeSeries({
        name: "hilo_rainfall",
        columns: ["index", "n"],
        points: result.data.datas.list
          .map(({ n, created_at }) => [
            Index.getIndexString("1s", new Date(created_at)),
            n,
          ])
          .sort(),
      });

      setSeries(series);
    };
    fetch();
    let interval = setInterval(() => {
      fetch();
    }, 1000);
    return () => {
      clearInterval(interval);
      console.log("clear fetch");
    };
  }, []);

  const perEventStyle = (column, event) => {
    return {
      normal: {
        fill: "#03a50d",
        opacity: 1.0,
      },
    };
  };

  if (series) {
    return (
      <ChartContainer timeRange={series.timerange()}>
        <ChartRow height="150">
          <YAxis
            id="number"
            label="Random number (/s)"
            min={0}
            max={500}
            format="1"
            width="70"
            type="linear"
          />
          <Charts>
            <ScatterChart
              axis="number"
              series={series}
              columns={["n"]}
              style={perEventStyle}
            />
          </Charts>
        </ChartRow>
      </ChartContainer>
    );
  } else {
    return <div>Loading ...</div>;
  }
};

export default Chart;
