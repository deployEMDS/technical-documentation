import clsx from 'clsx';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import HomepageFeatures from '@site/src/components/HomepageFeatures';
import Heading from '@theme/Heading';

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>

        <div>
            <p><strong>deployEMDS</strong> is a project co-funded under the <strong><a href="https://digital-strategy.ec.europa.eu/en/activities/digital-programme">EU Digital Europe Programme</a></strong> and responds to its outlined challenges. The project will help make the common&nbsp;European&nbsp;mobility&nbsp;data&nbsp;space a reality.
                The initiative will cultivate a broad European ecosystem of data providers and users, facilitating the adoption of common building blocks. It consists of 16 use cases from nine EU countries will contribute to the development of innovative services and applications.</p>

            The European mobility data space (EMDS) will offer a framework for interlinking and federating ecosystems and supports real-life implementations in nine cities and regions: Barcelona&nbsp;(ES), Île-de-France&nbsp;(FR), Milan&nbsp;(IT), Lisbon&nbsp;(PT), Flanders&nbsp;(BE), Sofia&nbsp;(BG), Stockholm&nbsp;(SE), Tampere&nbsp;(FI) and Budapest&nbsp;(HU).
            These initiatives focus on the development of innovative services and applications in urban mobility, while assisting in policymaking through the sharing and reuse of data.
        </div>
      </div>
    </header>
  );
}

export default function Home(): JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title}`}
      description="Technical documentation for the deployEMDS project and data space">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
