# README

## Getting Started

```bash
# Install Dependencies
bundle install
yarn install

# Set up DB
bundle exec rails db:setup
```

## Starting the server

```bash
bin/dev
```

## Models

<table class="tg">
<thead>
  <tr>
    <th colspan="2">Customer</th>
  </tr>
  <tr>
    <th colspan="2">has_many :payment_requests</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>first_name</td>
    <td>string</td>
  </tr>
  <tr>
    <td>last_name</td>
    <td>string</td>
  </tr>
</tbody>
</table>

<table class="tg">
<thead>
  <tr>
    <th colspan="2">PaymentRequest</th>
  </tr>
  <tr>
    <th colspan="2">belongs_to :customer</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>customer_id</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>status</td>
    <td>string</td>
  </tr>
  <tr>
    <td>amount</td>
    <td>integer</td>
  </tr>
</tbody>
</table>
