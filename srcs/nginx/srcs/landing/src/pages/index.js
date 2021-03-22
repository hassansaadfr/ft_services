import { Link } from 'gatsby'
import React from 'react'
import Helmet from 'react-helmet'
import { Waypoint } from 'react-waypoint'
import Header from '../components/Header'
import Layout from '../components/layout'
import Nav from '../components/Nav'

class Index extends React.Component {
  constructor(props) {
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

  render() {
    return (
      <Layout>
        <Helmet title="Gatsby Starter - Stellar" />

        <Header />

        <Waypoint
          onEnter={this._handleWaypointEnter}
          onLeave={this._handleWaypointLeave}
        ></Waypoint>
        <Nav sticky={this.state.stickyNav} />

        <div id="main">
          <section id="first" className="main special">
            <header className="major">
              <h2>Services</h2>
            </header>
            <ul className="features">
              <li>
                <span className="icon major style1 fa-server"></span>
                <h3>Nginx</h3>
                <p>
                  https://localhost
                </p>
                <div style={{display:"flex", flexDirection: "row"}}>
                  <Link to="https://localhost" className="button special" style={{marginRight:5}}>
                    Access
                  </Link>
                  <a href="ssh://root@localhost">
                    <Link className="button special">
                      Access SSH
                    </Link>
                  </a>
                </div>
              </li>
              <li>
                <span className="icon major style2 fa-users"></span>
                <h3>Phpmyadmin</h3>
                <p>
                  https://localhost/phpmyadmin
                </p>
                <Link to="https://localhost/phpmyadmin" className="button special">
                  Access
                </Link>
              </li>
              <li>
                <span className="icon major style5 fa-wordpress"></span>
                <h3>Wordpress</h3>
                <p>
                  https://localhost:5000
                </p>
                <Link to="https://localhost:5000" className="button special">
                  Access
                </Link>
              </li>
              <li>
                <span className="icon major style2 fa-bar-chart"></span>
                <h3>Grafana</h3>
                <p>
                  https://localhost:3000
                </p>
                <Link to="https://localhost:3000" className="button special">
                  Access
                </Link>
              </li>
              <li>
                <span className="icon major style5 fa-diamond"></span>
                <h3>FTPS</h3>
                <p>
                  ftp://localhost:21
                </p>
                <a href="ftp://root:password@localhost">
                    <Link className="button special">
                      Access FTP
                    </Link>
                  </a>
              </li>
              <li>
                <span className="icon major style5 fa-database"></span>
                <h3>Mysql</h3>
                <p>
                  localhost:3386
                </p>
              </li>
              <li>
                <span className="icon major style1 fa-database"></span>
                <h3>InfluxDB</h3>
                <p>
                  localhost:8086
                </p>
              </li>
            </ul>
          </section>

          <section id="second" className="main special">
            <header className="major">
              <h2>Ipsum consequat</h2>
              <p>
                Donec imperdiet consequat consequat. Suspendisse feugiat congue
                <br />
                posuere. Nulla massa urna, fermentum eget quam aliquet.
              </p>
            </header>
            <ul className="statistics">
              <li className="style1">
                <span className="icon fa-code-fork"></span>
                <strong>5,120</strong> Etiam
              </li>
              <li className="style2">
                <span className="icon fa-folder-open-o"></span>
                <strong>8,192</strong> Magna
              </li>
              <li className="style3">
                <span className="icon fa-signal"></span>
                <strong>2,048</strong> Tempus
              </li>
              <li className="style4">
                <span className="icon fa-laptop"></span>
                <strong>4,096</strong> Aliquam
              </li>
              <li className="style5">
                <span className="icon fa-diamond"></span>
                <strong>1,024</strong> Nullam
              </li>
            </ul>
            <p className="content">
              Nam elementum nisl et mi a commodo porttitor. Morbi sit amet nisl
              eu arcu faucibus hendrerit vel a risus. Nam a orci mi, elementum
              ac arcu sit amet, fermentum pellentesque et purus. Integer maximus
              varius lorem, sed convallis diam accumsan sed. Etiam porttitor
              placerat sapien, sed eleifend a enim pulvinar faucibus semper quis
              ut arcu. Ut non nisl a mollis est efficitur vestibulum. Integer
              eget purus nec nulla mattis et accumsan ut magna libero. Morbi
              auctor iaculis porttitor. Sed ut magna ac risus et hendrerit
              scelerisque. Praesent eleifend lacus in lectus aliquam porta. Cras
              eu ornare dui curabitur lacinia.
            </p>
            <footer className="major">
              <ul className="actions">
                <li>
                  <Link to="/generic" className="button">
                    Learn More
                  </Link>
                </li>
              </ul>
            </footer>
          </section>
        </div>
      </Layout>
    )
  }
}

export default Index
