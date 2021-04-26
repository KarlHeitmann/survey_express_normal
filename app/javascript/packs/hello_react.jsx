// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import MyProsidebar from '../components/my_prosidebar'

const Hello = props => (
  <div>Hello {props.name}!</div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

// document.documentElement.addEventListener('turbo:render', (v1, v2)=> {console.log('render')})
document.documentElement.addEventListener('turbo:render', () => {
// document.documentElement.addEventListener('turbo:before-stream-render', () => {

// document.addEventListener('DOMContentLoaded', () => {
// document.addEventListener('turbolinks:load', () => {
// document.on("turbolinks:load", function() {
// document.addEventListener('turbolinks:load', function() {
// document.addEventListener('turbolinks:load', function() {
  ReactDOM.render(
    <MyProsidebar />,
    document.querySelector('#sidebar')
    // document.body.appendChild(document.createElement('div')),
  )
})

