import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';
import { Icon } from '@iconify/react';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Data interoperability',
    Svg: require('@site/static/img/material-symbols-light--component-exchange.svg').default,
    description: (
      <>
          Sharing and exchanging data in a standardised way
      </>
    ),
  },
  {
    title: 'Data sovereignty and trust',
    Svg: require('@site/static/img/material-symbols-light--shield-lock-outline-rounded.svg').default,
    description: (
      <>
          Retaining authority and control over data
      </>
    ),
  },
  {
    title: 'Accessibility',
    Svg: require('@site/static/img/material-symbols-light--content-paste-search.svg').default,
    description: (
      <>
          Discoverability and availability of mobility data
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" style={{color: "#FFD803"}}/>
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
          <div className="row" style={{justifyContent: "center"}}>
              <div><Heading as="h2">Guiding principles</Heading></div>
          </div>
          <div className="row">
              {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
