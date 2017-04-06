// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.
import React from 'react'
import ReactDOM from 'react-dom'
import ApolloClient from 'apollo-client'
import { ApolloProvider } from 'react-apollo'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

const client = new ApolloClient({})

const App = () => {
  return <div>Hello World!</div>
}
const Root = () => {
  return (
    <ApolloProvider client={client}>
      <BrowserRouter>
        <Switch>
          <Route exact path='/' component={App} />
        </Switch>
      </BrowserRouter>
    </ApolloProvider>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render( <Root />, document.querySelector('#root'))
})


{/* <BrowserRouter>
  <Match exactly pattern='/' component={App} />
</BrowserRouter> */}
