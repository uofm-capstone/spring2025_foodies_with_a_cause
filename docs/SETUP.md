# Setup

## Environment Setup
- In the project directory, install the required gems:
```bash
bundle install
```
- Install front end dependencies:
```bash
yarn install
```
- Install and compile front end assets:
```bash
bin/rails webpacker:istall
```
## Database Setup
-  Create and set up the database:
```bash
rails db:create
rails db:migrate
```
- Populate the database:
```bash
rails db:seed
```
## Running the Project
- Run the app locally:
```bash
rails server
```
- Access the web app: [127.0.0.1:3000](http://127.0.0.1:3000)
