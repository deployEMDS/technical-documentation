import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';
import { Icon } from '@iconify/react';

const config: Config = {
  title: 'deployEMDS Technical Documentation',
  tagline: 'Towards a common European mobility data space (EMDS)',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://pages.github.imec.be/',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/vghelu49/temp-emds-tech-docs/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  githubHost: 'github.imec.be',
  organizationName: 'vghelu49', // Usually your GitHub org/user name.
  projectName: 'temp-emds-tech-docs', // Usually your repo name.

  onBrokenAnchors: 'warn',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          editUrl:
            'https://github.com/imec-int/deployEMDS/tree/main/web',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    [
      require.resolve("@cmfcmf/docusaurus-search-local"),
      {
        // Options here
        indexBlog: false,
      },
    ],
  ],

  markdown: {
    mermaid: true,
  },
  themes: ['@docusaurus/theme-mermaid'],

  themeConfig: {
    // Replace with your project's social card
    image: 'img/mikhail-luxkstn-2NcGHHO9ukE-unsplash.jpg',
    colorMode: {
      defaultMode: 'light',
      disableSwitch: true,
      respectPrefersColorScheme: false,
    },
    navbar: {
      title: 'deployEMDS Technical Documentation',
      logo: {
        alt: 'deployEMDS Logo',
        src: 'img/1048_deployEMDS_LOGO-H_RGB.svg',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: 'Documentation',
        },
        // {to: '/blog', label: 'Blog', position: 'left'},
        {
          href: 'https://github.com/imec-int/deployEMDS',
          label: 'GitHub',
          position: 'right',
        },
        {
          href: 'https://www.linkedin.com/company/deployemds/',
          label: 'LinkedIn',
          position: 'right',
        }
      ],
    },
    footer: {
      logo: {
        src: 'img/EN-Co-Funded-by-the-EU_POS.png'
      },
      links: [
        {
          title: 'Documentation',
          items: [
            {
              label: 'Knowledge Hub',
              href: 'https://deployemds.eu/knowledge-hub/',
            },
            {
              label: 'Tutorial',
              to: '/docs/intro',
            },
          ],
        },
        {
          title: 'About',
          items: [
            {
              label: 'About',
              href: 'https://deployemds.eu/project/',
            },
            {
              label: 'Deployment',
              href: 'https://deployemds.eu/deployment/',
            },

            {
              label: 'News & Events',
              href: 'https://deployemds.eu/news-events/',
            },
            {
              label: 'Contact us',
              href: 'https://deployemds.eu/contact/',
            }
          ],
        },
        {
          title: 'Policies',
          items: [
            {
              label: 'Cookies Policy',
              to: 'https://deployemds.eu/cookie-policy/',
            },
            {
              label: 'Privacy Policy',
              href: 'https://deployemds.eu/privacy-policy/',
            },
          ],
        },
        {
          title: 'Contact',
          items: [{
            html: `<span style="display: block; height: 32px">Coordinator: Lucie Kirstein, acatech</span>`
          }, {
            html: `<span style="display: block; height: 32px"><a href="mailto:info@deployemds.eu">info@deployemds.eu</a></span>`
          }],
        }
      ],
      copyright: `
      Co-funded by the European Union. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Commission. Neither the European Union or the granting authority can be held responsible for them.<br/><br/>
      Copyright © deployEMDS Consortium, ${new Date().getFullYear()}. Built with Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
