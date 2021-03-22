import { Link } from 'gatsby'
import React from 'react'
import Helmet from 'react-helmet'
import { Waypoint } from 'react-waypoint'
import Header from '../components/Header'
import Layout from '../components/layout'
import Nav from '../components/Nav'

class Index extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      stickyNav: false,
    }
  }

  _handleWaypointEnter = () => {
    this.setState(() => ({ stickyNav: false }))
  }

  _handleWaypointLeave = () => {
    this.setState(() => ({ stickyNav: true }))
  }

  render () {
    console.log(process.env)
    return (
      <Layout>
        <Helmet title='Ft_services Hsaadaou' />

        <Header />

        <Waypoint
          onEnter={this._handleWaypointEnter}
          onLeave={this._handleWaypointLeave}
        ></Waypoint>
        <Nav sticky={this.state.stickyNav} />

        <div id='main'>
          <section id='first' className='main special'>
            <header className='major'>
              <h2>Services</h2>
            </header>
            <ul className='features'>
              <li>
                <span className='icon major style1 fa-server'></span>
                <h3>Nginx</h3>
                <p>https://{process.env.GATSBY_HOST_IP}</p>
                <div style={{ display: 'flex', flexDirection: 'row' }}>
                  <Link
                    to={`https://${process.env.GATSBY_HOST_IP}`}
                    className='button special'
                    style={{ marginRight: 5 }}
                  >
                    Access
                  </Link>
                  <a href={`ssh://root@${process.env.GATSBY_HOST_IP}`}>
                    <Link className='button special'>Access SSH</Link>
                  </a>
                </div>
              </li>
              <li>
                <span className='icon major style2 fa-users'></span>
                <h3>Phpmyadmin</h3>
                <p>https://{process.env.GATSBY_HOST_IP}/phpmyadmin</p>
                <Link
                  to={`https://${process.env.GATSBY_HOST_IP}/phpmyadmin`}
                  className='button special'
                >
                  Access
                </Link>
              </li>
              <li>
                <span className='icon major style5 fa-wordpress'></span>
                <h3>Wordpress</h3>
                <p>https://{process.env.GATSBY_HOST_IP}:5000</p>
                <Link
                  to={`https://${process.env.GATSBY_HOST_IP}/wordpress`}
                  className='button special'
                >
                  Access
                </Link>
              </li>
              <li>
                <span className='icon major style2 fa-bar-chart'></span>
                <h3>Grafana</h3>
                <p>https://{process.env.GATSBY_HOST_IP}:3000</p>
                <Link
                  to={`https://${process.env.GATSBY_HOST_IP}:3000`}
                  className='button special'
                >
                  Access
                </Link>
              </li>
              <li>
                <span className='icon major style5 fa-diamond'></span>
                <h3>FTPS</h3>
                <p>ftp://{process.env.GATSBY_HOST_IP}:21</p>
                <a href={`ftp://root:password@${process.env.GATSBY_HOST_IP}`}>
                  <Link className='button special'>Access FTP</Link>
                </a>
              </li>
              <li>
                <span className='icon major style5 fa-database'></span>
                <h3>Mysql</h3>
                <p>{process.env.GATSBY_HOST_IP}:3386</p>
              </li>
              <li>
                <span className='icon major style1 fa-database'></span>
                <h3>InfluxDB</h3>
                <p>{process.env.GATSBY_HOST_IP}:8086</p>
              </li>
            </ul>
          </section>

          <section id='second' className='main special'>
            <header className='major'>
              <h2>Ipsum consequat</h2>
              <p>
                Donec imperdiet consequat consequat. Suspendisse feugiat congue
                <br />
                posuere. Nulla massa urna, fermentum eget quam aliquet.
              </p>
            </header>
            <ul className='statistics' style={{ flexDirection: 'column' }}>
              <li className='style1'>
                <span className='icon fa-database'></span>
                <p>
                  <h3>Root login:</h3>
                  <span>root</span>
                  <h3>Root password:</h3>
                  <span>{process.env.GATSBY_MYSQL_ROOT_PASSWORD}</span>
                </p>
              </li>
              <li className='style2'>
              <span className='icon fa-folder-open-o'></span>
                <p>
                  <h3>ftp login:</h3>
                  <span>{process.env.GATSBY_FTP_USER}</span>
                  <h3>ftp password:</h3>
                  <span>{process.env.GATSBY_FTP_PASSWORD}</span>
                </p>
              </li>
              <li className='style4'>
              <span className="icon fa-laptop"></span>
                <p>
                  <h3>ssh login:</h3>
                  <span>{process.env.GATSBY_SSH_USER}</span>
                  <strong>ssh password:</strong>
                  <span>{process.env.GATSBY_SSH_PASSWORD}</span>
                </p>
              </li>
              <li className='style5'>
              <span className="icon fa-wordpress"></span>

                <p style={{ display: 'flex', justifyContent: 'space-around' }}>
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <h3>Wordpress admin:</h3>
                    <span>{process.env.GATSBY_ADMIN_WP_USER}</span>
                    <h3>Password:</h3>
                    <span>{process.env.GATSBY_ADMIN_WP_PASS}</span>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <h3>Wordpress user 1:</h3>
                    <span>{process.env.GATSBY_USER1_WP_USER}</span>
                    <h3>Password:</h3>
                    <span>{process.env.GATSBY_USER1_WP_PASS}</span>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <h3>Wordpress user 2:</h3>
                    <span>{process.env.GATSBY_USER2_WP_USER}</span>
                    <h3>Password:</h3>
                    <span>{process.env.GATSBY_USER2_WP_PASS}</span>
                  </div>
                </p>
              </li>
            </ul>
          </section>
        </div>
      </Layout>
    )
  }
}

export default Index
