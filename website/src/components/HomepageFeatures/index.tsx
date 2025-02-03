import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';
import React, { JSX } from 'react';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Ready to Use Tests',
    Svg: require('@site/static/img/testing1r.svg').default,
    description: (
      <>
        Over 30 tests are ready to use. Just add them to Maester custom folder and start
      </>
    ),
  },
  {
    title: 'Customizable to your needs',
    Svg: require('@site/static/img/testing2r.svg').default,
    description: (
      <>
        Easily customize the tests to your needs. Add new tests or modify existing ones
      </>
    ),
  },
  {
    title: 'Single Pane of Glass',
    Svg: require('@site/static/img/testing3r.svg').default,
    description: (
      <>
        Keep all of your tests under a single pane of glass
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
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
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
