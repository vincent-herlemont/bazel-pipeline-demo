import Head from "next/head";
import dynamic from "next/dynamic";
const Chart = dynamic(() => import("../components/Chart"), { ssr: false });

export default function Home() {
  return (
    <div>
      <Head>
        <title>Pipeline demo</title>
      </Head>
      <main>
        <h1>Pipeline demo</h1>
        <Chart />
      </main>
    </div>
  );
}
