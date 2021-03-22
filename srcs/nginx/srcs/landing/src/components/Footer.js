import React from 'react'

const Footer = props => (
  <footer id="footer" style={{display:'flex', justifyContent:'center', textAlign:'center'}}>
    <section>
      <h2>Hassan Saadaoui</h2>
      <h3>42 Paris</h3>
      <ul className="icons">
        <li>
          <a
            href="https://github.com/hassansaadfr"
            className="icon fa-github alt"
          >
            <span className="label">GitHub</span>
          </a>
        </li>
      </ul>
    </section>
  </footer>
)

export default Footer
