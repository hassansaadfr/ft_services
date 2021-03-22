import React from 'react'
import Scrollspy from 'react-scrollspy'
import Scroll from './Scroll'

const Nav = (props) => (
    <nav id="nav" className={props.sticky ? 'alt' : ''}>
        <Scrollspy items={ ['first', 'second'] } currentClassName="is-active" offset={-300}>
            <li>
                <Scroll type="id" element="first">
                    <a href="#">Services</a>
                </Scroll>
            </li>
            <li>
                <Scroll type="id" element="second">
                    <a href="#">Identifiants</a>
                </Scroll>
            </li>
        </Scrollspy>
    </nav>
)

export default Nav
